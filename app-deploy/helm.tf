resource "helm_release" "mongo_db" {
  create_namespace = true
  name             = "tyk-mongo"
  namespace        = "tyk"
  chart            = "mongodb"
  atomic           = true
  repository = "https://charts.bitnami.com/bitnami"
}
