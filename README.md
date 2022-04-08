<p align="center">
  <h3 align="center">ICON Explorer</h3>
</p>

Meta repo for ICON Blockchain Explorer and backend based on an event driven microservice architecture. For testing purposes and local development purposes. 

To use the endpoints, please checkout the live API docs linked in each service below. 

[Status Page](https://status.icon.geometry.io)

### Sub Repos 

- [ETL](https://github.com/sudoblockio/icon-etl)
    - Main indexer for the blockchain
- [Frontend](https://github.com/sudoblockio/icon-tracker-frontend)
    - To be made public after launch 
- [Network Exporter](https://github.com/sudoblockio/icon-network-exporter)
    - Scraper for various metrics across the nodes that run the network

#### Domains 

All data from the blockchain is normalized into the following microservices.

| Service | API Docs | Status | Version | Build Status | 
| :--- | :---- |:---- |:---- | :---- | 
| [Blocks](https://github.com/sudoblockio/icon-blocks) | [Link](https://tracker.icon.geometry.io/api/v1/blocks/docs/) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-blocks-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-blocks.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-blocks/workflows/push-main-dockerhub/badge.svg?branch=main) | 
[Transactions](https://github.com/sudoblockio/icon-transactions) | [Link](https://tracker.icon.geometry.io/api/v1/transactions/docs/) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-transactions-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-transactions.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-transactions/workflows/push-main-dockerhub/badge.svg?branch=main) |
| [Logs](https://github.com/sudoblockio/icon-logs) | [Link](https://tracker.icon.geometry.io/api/v1/logs/docs/) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-logs-service%2Fuptime.json) |  [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-logs.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-logs/workflows/push-main-dockerhub/badge.svg?branch=main) |
| [Addresses](https://github.com/sudoblockio/icon-addresses) | [Link](https://tracker.icon.geometry.io/api/v1/addresses/docs/) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-addresses-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-addresses.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-addresses/workflows/push-main-dockerhub/badge.svg?branch=main) |
| [Contracts](https://github.com/sudoblockio/icon-contracts) | [Link](https://tracker.icon.geometry.io/api/v1/contracts/docs) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-contracts-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-contracts.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-contracts/workflows/push-main-dockerhub/badge.svg?branch=main)
| [Governance](https://github.com/sudoblockio/icon-governance) | [Link](https://tracker.icon.geometry.io/api/v1/governance/docs) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-governance-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-governance.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-governance/workflows/push-main-dockerhub/badge.svg?branch=main)
| [Metrics](https://github.com/sudoblockio/icon-metrics) | [Link](https://tracker.icon.geometry.io/api/v1/metrics/docs) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsudoblockio%2Ficon-status-page%2Fmaster%2Fapi%2Fprod-mainnet-metrics-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/sudoblockio/icon-metrics.svg?style=flat)]() | ![](https://github.com/sudoblockio/icon-metrics/workflows/push-main-dockerhub/badge.svg?branch=main)


## Websockets 

- wss://tracker.icon.community/ws/v1/blocks
- wss://tracker.icon.community/ws/v1/transactions 
- wss://tracker.icon.community/ws/v1/logs 

## Usage 

For development purposes, we have included a helper script to bring the stack up as one docker-stack.yaml file. To use this, run the following. 

```bash
make help 
make pull-repos 
make up 
make test
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