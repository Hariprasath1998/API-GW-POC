terraform {
  backend "gcs" {
    bucket      = "api-gw-poc-state"
    prefix      = "terraform-infrastructure/state"
    # credentials = "melodic-splicer-357510-fe2d4c9af51f.json"
  }
}