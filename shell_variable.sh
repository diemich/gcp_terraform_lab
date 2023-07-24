#!/usr/bin/env bash 
set -euo pipefail #bash strict mode
#
#
echo " Preparing the environment for Terraform "
#place your compute instance ID as a variable
#
#
path_file="$(pwd)/variables.tf"
tf_i1="ID_instance1"
tf_i2="ID_instance2"
#
#get the project ID and store it as a variable  $gcloud config list --format 'value(core.project)'
n_project=$($gcloud config list --format 'value(core.project)')
n_region="us-east1"
n_zone="us-east1-c"
n_bucket="tf-bucket-602878"
n_vpc="tf-vpc-539884"

#echo "replacing shell variables in terraform config files"
#
sed -i "s/n_project/$n_project/g" "$path_file"
sed -i "s/n_region/$n_region/g" "$path_file"
sed -i "s/n_zone/$n_zone/g" "$path_file"
sed -i "s/n_bucket/$n_bucket/g" "$path_file"
cat $(pwd)/variables.tf
#
#optional
#
#sed -i "s/n_project/$n_project/g" firewall.tf
#sed -i "s/n_vpc/$n_vpc/g" firewall.tf"

#copy variables to instances and storage folder
cp "$path_file" $(pwd)/modules/storage/
cp "$path_file" $(pwd)/modules/instances/
cp "$path_file" $(pwd)/modules/networking/

#import modules 
#terraform import module.instances.google_compute_instance.tf-instance-1 $tf_i1
#terraform import module.instances.google_compute_instance.tf-instance-2 $tf_i2