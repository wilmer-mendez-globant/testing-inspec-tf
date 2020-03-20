#!/usr/bin/env bash

terraform init
printf "\n"
echo "------------------------------------------"
echo "Building TF Test Module"
echo "------------------------------------------"
printf "\n"
terraform apply -auto-approve
terraform output --json > test/verify/files/terraform_output.json
printf "\n"
echo "------------------------------------------"
echo "Starting InSpec Tests"
echo "------------------------------------------"
printf "\n"
inspec exec test/verify -t aws://
printf "\n"
echo "------------------------------------------"
echo "Destroying TF Test Module"
echo "------------------------------------------"
printf "\n"
terraform destroy -auto-approve 
rm test/verify/files/terraform_output.json