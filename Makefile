tf-plan:
	terraform -chdir=./terraform plan -var-file=secret.datadog.tfvars -var-file=secret.yc.tfvars

tf-init:
	terraform -chdir=./terraform init

tf-validate:
	terraform -chdir=./terraform validate

tf-apply:
	terraform -chdir=./terraform apply -var-file=secret.datadog.tfvars -var-file=secret.yc.tfvars

tf-destroy:
	terraform -chdir=./terraform destroy -var-file=secret.datadog.tfvars -var-file=secret.yc.tfvars

install_roles:
	ansible-galaxy install -r requirements.yml

prepare:
	ansible-playbook ./ansible/playbook.yml --vault-password-file ./.vault-password -i ./ansible/inventory.ini --skip-tags deploy,datadog

deploy:
	ansible-playbook ./ansible/playbook.yml --vault-password-file ./.vault-password -i ./ansible/inventory.ini -t deploy

dd:
	ansible-playbook ./ansible/playbook.yml --vault-password-file ./.vault-password -i ./ansible/inventory.ini -t datadog

generate-tf-vars:
	ansible-playbook ./ansible/terraform.yml --vault-password-file ./.vault-password

build-app-image:
	docker build -t mercuriaal/simple-flask-app:latest .

push-app-image:
	docker push mercuriaal/simple-flask-app:latest

edit-vault:
	EDITOR=vim ansible-vault edit --vault-password-file .vault-password ansible/group_vars/all/vault.yml