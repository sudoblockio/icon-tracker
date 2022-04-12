
.DEFAULT_GOAL := help

.PHONY: help

tackle-install:  ## Install tackle-box, a helper for managing repo
	@if ! tackle -h >/dev/null 2>&1; then pip3 install tackle-box; fi

pull-repos: tackle-install  ## Pull all the underlying repos
	tackle repos.yaml --no-input

up: create-stack  ## Bring up the stack
	docker-compose -f docker-stack.yml up -d;

down:  ## Take down the
	docker-compose -f docker-stack.yml down;

ps:  ## Check the containers
	docker-compose -f docker-stack.yml ps;

logs:  ## Get the logs from the runnning services
	docker-compose -f docker-stack.yml logs;

create-v2:  ## Merge all the sub-repo's docker-compose.yml files into one docker-stack.yml file
ifeq (,$(wildcard .env))
	export $(cat .env | xargs)
endif
	COMPOSE_FILE_SEPARATOR=: \
	COMPOSE_FILE=./docker-compose.db.yml:./extractor/docker-compose.yml:./transformer/docker-compose.yml:./api/docker-compose.yml:./contracts/docker-compose.yml:./governance/docker-compose.yml \
	EXTRACTOR_CONTEXT=./extractor \
	TRANSFORMER_CONTEXT=./transformer \
	API_CONTEXT=./api \
	CONTRACTS_CONTEXT=./contracts \
	GOVERNANCE_CONTEXT=./governance \
	docker-compose \
    config > docker-stack.yml

create-v1:  ## Same as create-stack but with persisting data in a local volume for longer operation
	COMPOSE_FILE=./docker-compose.db.yml:./docker-compose.db.persist.yml:./blocks/docker-compose.yml:./transformer/docker-compose.yml:./contracts/docker-compose.yml:./addresses/docker-compose.yml:./logs/docker-compose.yml:./governance/docker-compose.yml \
	BLOCKS_CONTEXT=./blocks \
	TRANSFORMER_CONTEXT=./transformer \
	LOGS_CONTEXT=./logs \
	ADDRESSES_CONTEXT=./addresses \
	CONTRACTS_CONTEXT=./contracts \
	GOVERNANCE_CONTEXT=./governance \
	docker-compose \
    config > docker-stack.yml

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
