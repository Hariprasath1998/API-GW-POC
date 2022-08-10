terraform {
  backend "gcs" {
    bucket      = "api-gw-poc-state"
    prefix      = "terraform-application/state"
  }
}