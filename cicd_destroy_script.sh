#!/bin/bash
set -e


terraform -chdir=./app-deploy destroy --var-file=./tfvars/dev.tfvars --auto-approve

sleep 30


terraform -chdir=./cluster-deploy destroy --var-file=./tfvars/dev.tfvars --auto-approve



