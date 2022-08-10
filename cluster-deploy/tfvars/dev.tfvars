
# Network
vpc_auto_create_subnetworks = false
vpc_mtu = 1460
vpc_delete_default_routes_on_create = true

private_subnet_ip_cidr_range = "172.17.1.0/24"

egress_internet_route_dest_range = "0.0.0.0/0"
egress_internet_route_next_hop_gateway = "default-internet-gateway"

nat_router_nat_ip_allocate_option = "AUTO_ONLY"
nat_router_source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"


# Default Service Account
default_service_account_id = "default-service-account"

# Cluster
# tyk_cluster_name   = "dev-dxc-api-gateway-tyk-cluster"
node_locations     = ["us-west1-a", "us-west1-b"]
# tyk_node_pool_name = "dev-api-gateway-tyk-node-pool"
machine_type       = "e2-medium"

region     = "us-west1"
project_id = "melodic-splicer-357510"

project_environment = "dev"
# project_name        = "api-gateway"
project_name        = "hari-poc"
