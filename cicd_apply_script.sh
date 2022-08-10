#!/bin/bash
set -e

# Init Cluster
terraform -chdir=./cluster-deploy init
# Plan Cluster
# terraform -chdir=./cluster-deploy plan --var-file=<(cat ./cluster-deploy/tfvars/dev.tfvars ./dev_common.tfvars)
# Apply Cluster
terraform -chdir=./cluster-deploy apply --var-file=<(cat ./cluster-deploy/tfvars/dev.tfvars ./dev_common.tfvars) --auto-approve


# sleep 30

# Init App
terraform -chdir=./app-deploy init
# Plan App
# terraform -chdir=./app-deploy plan --var-file=<(cat ./app-deploy/tfvars/dev.tfvars ./dev_common.tfvars) 
# # Apply App
terraform -chdir=./app-deploy apply --var-file=<(cat ./app-deploy/tfvars/dev.tfvars ./dev_common.tfvars) --auto-approve

