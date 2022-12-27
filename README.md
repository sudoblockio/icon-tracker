<p align="center">
  <h3 align="center">ICON Explorer</h3>
</p>

Repo for the ICON Blockchain tracker containing docker scripts to setup the stack.

[Status Page](https://status.icon.sudoblock.io)

#### Sub Repos

To clone all the repos, run `make pull-repos` or install [tackle-box](https://github.com/robcxyz/tackle-box) and run `tackle repos.yaml`. This is not required to setup a local tracker. 

- [Frontend](https://github.com/sudoblockio/icon-tracker-frontend)
- [ETL](https://github.com/sudoblockio/icon-go-etl)
    - Main indexer for the blockchain
- [Transformer](https://github.com/sudoblockio/icon-transformer)
    - Transform the blocks into usable tables
- [API](https://github.com/sudoblockio/icon-go-api)
    - Expose the data for querying
- [Contracts](https://github.com/sudoblockio/icon-contracts)
  - Handles special actions for contracts such as classifications, verifications, and uploading source code 
- [Governance](https://github.com/sudoblockio/icon-contracts)
  - Handles a number of actions for governance actions such as node uptimes and other things 
- [Network Exporter](https://github.com/sudoblockio/icon-network-exporter)
    - Scraper for various metrics across the nodes that run the network
- [Status Page](https://github.com/sudoblockio/icon-status-page)
    - Status page for the network 

#### Domains

All data from the blockchain is normalized into the following microservices.

| Service                                                          | API Docs                                                      | Status                                                                                                                                                                                 | Version | Build Status | 
|:-----------------------------------------------------------------|:--------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---- | :---- | 
| [Contracts](https://github.com/sudoblockio/icon-contracts)       | [Link](https://tracker.icon.community/api/v1/contracts/docs)  | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-contracts-service%2Fuptime.json)  | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-contracts.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-contracts/workflows/push-main-dockerhub/badge.svg?branch=main)
| [Governance](https://github.com/sudoblockio/icon-governance)     | [Link](https://tracker.icon.community/api/v1/governance/docs) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-governance-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-governance.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-governance/workflows/push-main-dockerhub/badge.svg?branch=main)
| [Extractor](https://github.com/sudoblockio/icon-extractor)       | N/A                                                           |                                                                                                                                                                                        | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-extractor.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-extractor/workflows/push-main/badge.svg?branch=main)
| [Transformer](https://github.com/sudoblockio/icon-transformer)   | [Link](https://tracker.icon.community/api/v1/metrics/docs)    | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-api%2Fuptime.json)                 | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-transformer.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-transformer/workflows/push-main/badge.svg?branch=main)
| [Go-API](https://github.com/sudoblockio/icon-go-api)             | [Link](https://tracker.icon.community/api/v1/metrics/docs)    | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-api%2Fuptime.json)                | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-go-api.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-go-api/workflows/push-main/badge.svg?branch=main)


#### Websockets

- wss://tracker.icon.community/ws/v1/blocks
- wss://tracker.icon.community/ws/v1/transactions
- wss://tracker.icon.community/ws/v1/logs

## Deployment 

### Pre-requisites

You will need to have a server with the following minimum specs depending on the network that you are running on. Specs can be reduced if you are only syncing up recent blocks or if you are using a custom version to only index subsets of a chain.

- Mainnet
  - 8 threads min / 24 threads recommended
    - Low thread count will impact query performance and sync time
    - 64 GB ram for full chain
    - 800 GB disk minimum which will grow over time
- Testnets
  - 4 threads min / 8 threads recommended
  - 16 GB ram for full chain
  - 100 GB disk minimum which will grow over time

Additionally, you will need the following installed:

- docker
- docker-compose

### Preparation

To setup a node to be able to run the application, directory structure and apply the following permissions:

```shell
# If you have a large root volume run 
mkdir volumes 
# Or if you have a second volumes -> Sym link  
# mkdir /data/volumes
# ln -s /data/volumes volumes
# mkdir volumes/broker
# mkdir volumes/zoo
# Chown for kafka persistence 
sudo chown 1000:1000 volumes/broker
sudo chown 1000:1000 volumes/zoo
```

Additionally, you will need to fill out an `.env` file which you can find an example for in the repo.

```shell
cp .env.example .env
nano .env
```

Follow the directions in this file to fill in the fields.

### Security and firewalls

You will also want to configure firewalls appropriately so that you do not expose any of the DBs publicly and if you do, you have a strong password and are ok with the risks.

If you are running the frontend, expose the following and set a DNS record to point to your host for letsencrypt SSL to be activated.

- 80 - Web insecure
- 443 - Web secure
- 8080 - Traefik admin

If you are monitoring the node, you will want to open the following ports:

- 9100 - Node exporter
- 8081 - Cadvisor
- 9187 - Postgres exporter
- 9308 - Kafka exporter

> Get in touch if you want to have any prometheus rules / grafana dashboards to monitor the stack. They will be made public in the future.

If you are running on a single host without an external firewall, be mindful that docker ignores UFW rules and so consider [this repo](https://github.com/chaifeng/ufw-docker) but beware you will also need to allow traffic to internal services such as postgres, redis, and kafka as well.

### Database Tuning

For the best performance, it is important that you tune the postgres database per the specs of the node you are running the application on. To do this, go to [https://pgtune.leopard.in.ua/](https://pgtune.leopard.in.ua/), enter your specs, and put the output into a file called `postgresql.conf` in the root of this repo.  The file should be mounted into the PG container and the specs will be reflected in the PG exporter.

### Running the application

After customizing the `.env` file from previous step, simply run the following command:

```shell
make up  # See status of stack 
```

Or with tackle-box:

```shell
tackle docker 
```

Note that public endpoints are ok to stay at head or sync a small number of blocks but if you need to sync a whole network then it is strongly recommended to run a local node. Get in touch if you need help with that. 

### Recovering Redis

The API uses redis under the hood to improve query performance for counts. It is possible recover the cache by running `-f docker-compose.redis-recovery.yml`

```shell
docker-compose docker-stack.yml -f docker-compose.redis-recovery.yml
```

### Filling in Missing Blocks

It is possible to miss blocks in the backend so to fill them in, there is a process to discover missing blocks, re-extract them, and process them so that they are properly stored in the backend.

> Generally the chain syncs without having to run this. This is only to validate / fill in potential areas that didn't sync properly. 

To run the process, add an additional `-f docker-compose.find-missing.yml` to the makefile command.  A table will be created and internally it will call the extractor service to pull those blocks.

Missing blocks can come from the following general reasons:

1. Misconfigured Kafka topic / broker that has `message.max.bytes` set too low for large blocks
2. Misformatted blocks such as missing timestamps or empty hashes (they exist) that are dropped in a "[dead letter queue](https://medium.com/@sannidhi.s.t/dead-letter-queues-dlqs-in-kafka-afb4b6835309)" and need to be fixed in some way.  Currently there are only a about 5 of such messages so you should not need to worry about this much in normal practice.
3. A restart on the transformer as it is processing a message can make it drop the block

Generally speaking, when a block is processed it is fully processed but a process still exists to make sure the DB is 100% complete.

```shell
docker-compose docker-stack.yml -f docker-compose.find-missing.yml
```

## Usage

For development purposes, we have included a helper script to bring the stack up as one docker-stack.yaml file. To use
this, run the following.

```bash
make help 
make pull-repos 
make up 
```

Produces a file `docker-stack.yml` which you can:

```bash
docker-compose -f docker-stack.yml <whatever - ie ps / logs / up / down>
```

Or just use the make commands

```bash
make ps 
make logs 
```