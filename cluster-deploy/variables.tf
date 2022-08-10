# Project
variable "region" {
  type        = string
  description = "Project Region"
  default     = "us-west1"
}

variable "project_id" {
  type        = string
  description = "Project ID"
}


variable "project_environment" {
  type        = string
  description = "Project Environment"
}

variable "project_name" {
  type        = string
  description = "Project Name"
  default     = "api-gateway"
}

# Network
variable "vpc_delete_default_routes_on_create" {
  type        = bool
  description = "To delete default routes in vpc"
  default     = true
}
variable "vpc_mtu" {
  type        = number
  description = "To set main VPC's MTU"
  default     = 1460
}
variable "vpc_auto_create_subnetworks" {
  type        = bool
  description = "To specify automatic creation of subnetworks in every region"
  default     = false
}
variable "private_subnet_ip_cidr_range" {
  type        = string
  description = "IP CIDR range for the private subnet"
}
variable "egress_internet_route_dest_range" {
  type        = string
  description = "Destination range for egress internet route"
}
variable "egress_internet_route_next_hop_gateway" {
  type        = string
  description = "Next hop to handle the packets"
}
variable "nat_router_nat_ip_allocate_option" {
  type        = string
  description = "NAT IP allocation option"
}
variable "nat_router_source_subnetwork_ip_ranges_to_nat" {
  type        = string
  description = "To set the option for configuring subnet for the NAT"
}

# APIs to be enabled
variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com"
  ]
}

# Service Account
variable "default_service_account_id" {
  type        = string
  description = "Default service account id"
}

# Cluster
# variable "tyk_cluster_name" {
#   type        = string
#   description = "Tyk Cluster name"
# }

variable "node_locations" {
  type        = list(string)
  description = "Zones for the cluster nodes"
}

# variable "tyk_node_pool_name" {
#   type        = string
#   description = "Tyk Node pool name"
# }

variable "machine_type" {
  type        = string
  description = "Node Machine type"
}
