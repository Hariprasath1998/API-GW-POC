locals {
  main_vpc_name              = join("-", [var.project_environment, var.project_name, "vpc"])
  private_subnet_name        = join("-", [var.project_environment, var.project_name, "private-subnet"])
  egress_internet_route_name = join("-", [var.project_environment, var.project_name, "egress-internet"])
  vpc_router_name            = join("-", [var.project_environment, var.project_name, "vpc-router"])
  nat_router_name            = join("-", [var.project_environment, var.project_name, "nat-router"])
}


resource "google_compute_network" "main" {
  project = var.project_id

  name                            = local.main_vpc_name
  auto_create_subnetworks         = var.vpc_auto_create_subnetworks
  mtu                             = 1460
  delete_default_routes_on_create = var.vpc_delete_default_routes_on_create
}


resource "google_compute_subnetwork" "private" {
  project                  = var.project_id
  name                     = local.private_subnet_name
  ip_cidr_range            = var.private_subnet_ip_cidr_range
  region                   = var.region
  network                  = google_compute_network.main.self_link
  private_ip_google_access = true
}

resource "google_compute_route" "egress_internet" {
  name             = local.egress_internet_route_name
  dest_range       = var.egress_internet_route_dest_range
  network          = google_compute_network.main.self_link
  next_hop_gateway = var.egress_internet_route_next_hop_gateway
}

resource "google_compute_router" "router" {
  name    = local.vpc_router_name
  region  = google_compute_subnetwork.private.region
  network = google_compute_network.main.self_link
}


resource "google_compute_router_nat" "nat_router" {
  name                               = local.nat_router_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = var.nat_router_nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.nat_router_source_subnetwork_ip_ranges_to_nat

  subnetwork {
    name                    = google_compute_subnetwork.private.self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}