#The terraform {} block is required so Terraform knows which provider to download from the Terraform Registry.
# In the configuration above, the google provider's source is defined as hashicorp/google which is shorthand 
#for registry.terraform.io/hashicorp/google.
terraform {
  #backend "gcs" {
  #bucket  = "tf-bucket-NUMBER"
  #prefix  = "terraform/state"
  #}
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
module "instances" {
  source = "./modules/instances"
}
module "storage" {
  source = "./modules/storage"
}
#module "firewall" {
#source = "./modules/networking"
#}