locals {
  tyk_cluster_name              = join("-", [var.project_environment, var.project_name, "tyk-cluster"])
  tyk_node_pool_name        = join("-", [var.project_environment, var.project_name, "tyk-nodepool"])
}

resource "google_service_account" "cluster" {
  account_id   = var.default_service_account_id
  display_name = "Cluster Node Service Account"
}


resource "google_container_cluster" "tyk" {
  name           = local.tyk_cluster_name
  location       = var.region
  node_locations = var.node_locations

  remove_default_node_pool = true
  initial_node_count       = 1
  # default_max_pods_per_node = var.max_pods_per_node

  network    = google_compute_network.main.self_link
  subnetwork = google_compute_subnetwork.private.self_link

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "10.0.0.0/28"
  }
  master_authorized_networks_config {
    # cidr_blocks {
      
    # }
  }

  ip_allocation_policy {
    # cluster_secondary_range_name  = data.google_compute_subnetwork.shared_subnet.secondary_ip_range.0.range_name
    # services_secondary_range_name = data.google_compute_subnetwork.shared_subnet.secondary_ip_range.1.range_name
  }
  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }

  }
}

resource "google_container_node_pool" "tyk" {
  name       = local.tyk_node_pool_name
  location   = var.region
  cluster    = google_container_cluster.tyk.self_link
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.cluster.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${self.name} >> cluster_name.txt"
  }
}
