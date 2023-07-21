#!/usr/bin/env bash 
set -euo pipefail #bash strict mode
#
##retrieve project_id $gcloud config list --format 'value(core.project)'
echo " Preparing the environment for Terraform "
#place your compute instance ID as a variable
gcloud compute instances list
#

#tf_i1=$(gcloud compute instances describe tf-instance-1)
#tf_i2=$(gcloud compute instances describe tf-instance-2)
#
#get project ID and stored it as a variable
n_project=$(gcloud config list --format 'value(core.project)')
n_region="us-east1"
n_zone="us-east1-c"
n_bucket="tf-bucket-602878"
n_vpc="tf-vpc-539884"

echo "replacing shell variables in terraform config files"
#
sed -i 's/$n_project/n_project/g' variables.tf
sed -i 's/$n_region/n_region/g' variables.tf
sed -i 's/$n_zone/n_zone/g' variables.tf
sed -i 's/$n_bucket/n_bucket/g' variables.tf

#copy variables to instances and storage folder
cp ~/gcp_terraform_lab/variables.tf ~/gcp_terraform_lab/storage/
cp ~/gcp_terraform_lab/variables.tf ~/gcp_terraform_lab/instances/

#import modules 
#terraform import module.instances.google_compute_instance.tf-instance-1 $tf_i1
#terraform import module.instances.google_compute_instance.tf-instance-2 $tf_i2