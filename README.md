<p align="center">
  <h3 align="center">ICON Explorer</h3>
</p>

Meta repo for ICON Blockchain Explorer. For testing purposes and local development. Includes a single code generated docker-compose that brings up the stack. 

[Status Page](https://status.icon.geometry.io)

### Sub Repos 

- [ETL](https://github.com/geometry-labs/icon-etl)
    - Main indexer for the blockchain
- [Frontend](https://github.com/geometry-labs/icon-tracker-frontend)
    - To be made public after launch 
- [Network Exporter](https://github.com/geometry-labs/icon-network-exporter)
    - Scraper for various metrics across the nodes that run the network

#### Domains 

All data from the blockchain is normalized into the following microservices.

| Service | API Docs | Status | Version | Build Status | 
| :--- | :---- |:---- | :---- | :---- |
| [Blocks](https://github.com/geometry-labs/icon-blocks) | [Link](https://explorer.icon.geometry-dev.net/api/v1/blocks/docs/) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgeometry-labs%2Ficon-status-page%2Fmaster%2Fapi%2Fdev-blocks-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-governance.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-governance/workflows/push-main/badge.svg?branch=main) | 
[Transactions](https://github.com/geometry-labs/icon-transactions) | [Link](https://explorer.icon.geometry-dev.net/api/v1/transactions/docs/) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgeometry-labs%2Ficon-status-page%2Fmaster%2Fapi%2Fdev-transactions-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-transactions.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-transactions/workflows/push-main/badge.svg?branch=main) |
| [Logs](https://github.com/geometry-labs/icon-logs) | [Link](https://explorer.icon.geometry-dev.net/api/v1/logs/docs/) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgeometry-labs%2Ficon-status-page%2Fmaster%2Fapi%2Fdev-logs-service%2Fuptime.json) |  [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-logs.svg?style=flat)]() | ![https://github.com/geometry-labs/icon-logs/actions](https://github.com/geometry-labs/icon-logs/workflows/push-main/badge.svg?branch=main) |
| [Addresses](https://github.com/geometry-labs/icon-addresses) | [Link](https://explorer.icon.geometry-dev.net/api/v1/addresses/docs/) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgeometry-labs%2Ficon-status-page%2Fmaster%2Fapi%2Fdev-addresses-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-addresses.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-addresses/workflows/push-main/badge.svg?branch=main) |
| [Contracts](https://github.com/geometry-labs/icon-contracts) | [Link](https://explorer.icon.geometry-dev.net/api/v1/contracts/docs) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgeometry-labs%2Ficon-status-page%2Fmaster%2Fapi%2Fdev-contracts-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-contracts.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-contracts/workflows/push-main/badge.svg?branch=main)
| [Governance](https://github.com/geometry-labs/icon-governance) | [Link](https://explorer.icon.geometry-dev.net/api/v1/governance/docs) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgeometry-labs%2Ficon-status-page%2Fmaster%2Fapi%2Fdev-governance-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-governance.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-governance/workflows/push-main/badge.svg?branch=main)
| [Metrics](https://github.com/geometry-labs/icon-metrics) | [Link](https://explorer.icon.geometry-dev.net/api/v1/metrics/docs) | ![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgeometry-labs%2Ficon-status-page%2Fmaster%2Fapi%2Fdev-metrics-service%2Fuptime.json) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-metrics.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-metrics/workflows/push-main/badge.svg?branch=main)

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