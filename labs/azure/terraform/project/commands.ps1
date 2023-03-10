terraform init
terraform workspace list

#####################################
# QA section
terraform workspace new qa_workspace
terraform workspace select qa_workspace
terraform plan -var-file="qa.tfvars"
terraform apply -var-file="qa.tfvars"
terraform destroy -var-file="qa.tfvars"

terraform workspace select default
terraform workspace delete qa_workspace

#####################################
# PROD section
terraform workspace new prod_workspace
terraform workspace select prod_workspace
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
terraform destroy -var-file="prod.tfvars"

terraform workspace select default
terraform workspace delete prod_workspace
