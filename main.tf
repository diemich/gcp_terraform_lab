#The terraform {} block is required so Terraform knows which provider to download from the Terraform Registry.
# In the configuration above, the google provider's source is defined as hashicorp/google which is shorthand 
#for registry.terraform.io/hashicorp/google.
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
# GCP provider
provider "google" {
  project      = var.project_id
  region       = var.gcp_region
  zone         = var.gcp_zone
}
#bucket 
module "remote_backend_bucket" {
  source = "./modules/storage"
  name       = var.bucket_name
  project_id = var.project_id
  location   = var.gcp_zone
  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]
}
