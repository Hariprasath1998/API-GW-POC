provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file("melodic-splicer-357510-fe2d4c9af51f.json")
}


provider "helm" {
  kubernetes {
    host                   = "https://${data.google_container_cluster.tyk.endpoint}"
    cluster_ca_certificate = base64decode(data.google_container_cluster.tyk.master_auth[0].cluster_ca_certificate)
    token                  = data.google_client_config.current.access_token
  }

#   kubernetes {
#   host = "https://cluster_endpoint:port"

#   client_certificate     = file("~/.kube/client-cert.pem")
#   client_key             = file("~/.kube/client-key.pem")
#   cluster_ca_certificate = file("~/.kube/cluster-ca-cert.pem")
# }

}
