# variables
node_name			?=node_1
# Targets
help:              ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:             ## Build Images from Docker compose file
	@docker compose build

stop:              ## stop all containers
	@docker stop $$(docker ps -aq)

run_node:          ## run node, make node_name=node_2 run_node
	@docker run --rm -d -P --name $(node_name)  nodes
	@docker inspect $(node_name) | grep IPAddress

run_ansible:       ## run ansible host and exec
	@docker run  --rm --name ansibleMaster -v ${PWD}/lab:/root/lab -it ansible_host