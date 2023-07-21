#!/usr/bin/env bash 
set -euo pipefail #bash strict mode
#
##retrieve project_id $gcloud config list --format 'value(core.project)'
echo " Preparing the environment for Terraform "
#place your compute instance ID as a variable

#
path_file="~/gcp_terraform_lab/variables.tf"
tf_i1="1995625199652300347"
tf_i2="5735389327498143291"
#
#get project ID and store it as a variable
n_project=$(gcloud config list --format 'value(core.project)')
n_project="esto_es_my_projectID"
n_region="us-east1"
n_zone="us-east1-c"
n_bucket="tf-bucket-602878"
n_vpc="tf-vpc-539884"

echo "replacing shell variables in terraform config files"
#
sed -i "s/n_project/$n_project/g" "$path_file"
sed -i "s/n_region/$n_region/g" "$path_file"
sed -i "s/n_zone/$n_zone/g" "$path_file"
sed -i "s/n_bucket/$n_bucket/g" "$path_file"

#sed -i "s/n_project/$n_project/g" firewall.tf
#sed -i "s/n_vpc/$n_vpc/g" firewall.tf"

#copy variables to instances and storage folder
cp ~/gcp_terraform_lab/variables.tf ~/gcp_terraform_lab/storage/
cp ~/gcp_terraform_lab/variables.tf ~/gcp_terraform_lab/instances/
cp ~/gcp_terraform_lab/variables.tf ~/gcp_terraform_lab/networking/

#import modules 
#terraform import module.instances.google_compute_instance.tf-instance-1 $tf_i1
#terraform import module.instances.google_compute_instance.tf-instance-2 $tf_i2