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