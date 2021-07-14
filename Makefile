
.DEFAULT_GOAL := help

.PHONY: help

tackle-install:  ## Install tackle-box, a helper for managing repo
	@type tackle -h >/dev/null 2>&1 || pip3 install tackle-box;

pull-repos: tackle-install  ## Pull all the underlying repos
	tackle . --context-file repos.yaml --no-input

up: create-stack  ## Bring up the stack
	docker-compose -f docker-stack.yml up -d;

down:  ## Take down the
	docker-compose -f docker-stack.yml down;

ps:  ## Check the containers
	docker-compose -f docker-stack.yml ps;

logs:  ## Get the logs from the runnning services
	docker-compose -f docker-stack.yml logs;

create-stack:  ## Merge all the sub-repo's docker-compose.yml files into one docker-stack.yml file
	COMPOSE_FILE_SEPARATOR=: \
	COMPOSE_FILE=./docker-compose.db.yml:./frontend/docker-compose.yml:./blocks/docker-compose.yml \
	FRONTEND_CONTEXT=./frontend \
	BLOCKS_CONTEXT=./blocks \
	docker-compose \
    config > docker-stack.yml

create-stack-persist:  ## Same as create-stack but with persisting data in a local volume for longer operation
	COMPOSE_FILE_SEPARATOR=: \
	COMPOSE_FILE=./docker-compose.db.yml:./docker-compose.db.persist.yml:./frontend/docker-compose.yml:./blocks/docker-compose.yml \
	FRONTEND_CONTEXT=./frontend \
	BLOCKS_CONTEXT=./blocks \
	docker-compose \
    config > docker-stack.yml

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
