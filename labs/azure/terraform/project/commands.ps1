terraform init

#####################################
# QA section
terraform plan -var-file="qa.tfvars"

terraform apply -var-file="qa.tfvars"

#####################################
# PROD section
terraform plan -var-file="prod.tfvars"

terraform apply -var-file="prod.tfvars"