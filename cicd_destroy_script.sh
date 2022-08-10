#!/bin/bash
set -e

terraform -chdir=./app-deploy destroy --var-file=<(cat ./app-deploy/tfvars/dev.tfvars ./dev_common.tfvars) --auto-approve


sleep 30



terraform -chdir=./cluster-deploy destroy --var-file=<(cat ./cluster-deploy/tfvars/dev.tfvars ./dev_common.tfvars) --auto-approve


