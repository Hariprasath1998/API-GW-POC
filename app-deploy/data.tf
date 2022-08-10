data "google_client_config" "current" {

}
locals {
  tyk_cluster_name              = join("-", [var.project_environment, var.project_name, "tyk-cluster"])
}


data "google_container_cluster" "tyk" {
  name     = local.tyk_cluster_name
  location = var.region
}
