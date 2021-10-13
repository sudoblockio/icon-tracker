<p align="center">
  <h3 align="center">ICON Explorer</h3>
</p>

Meta repo for ICON Blockchain Explorer. For testing purposes and local development. Includes a single code generated docker-compose that brings up the stack. 

### Sub Repos 

- [ETL](https://github.com/geometry-labs/icon-etl)
    - Main indexer for the blockchain 
- [Network Exporter](https://github.com/geometry-labs/icon-network-exporter)
    - Scraper for various metrics across the nodes that run the network
- [Metrics](https://github.com/geometry-labs/icon-metrics)
    - Microservice that serves a REST endpoint for random metrics
- [Frontend](https://github.com/geometry-labs/icon-tracker-frontend)
    - To be made public after launch 

#### Domains 

All data from the blockchain is normalized into the following microservices.

| Service | Version | Build Status | 
| :--- | :---- | :---- |
| [Blocks](https://github.com/geometry-labs/icon-blocks) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-governance.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-governance/workflows/push-main/badge.svg?branch=main) | 
| [Transactions](https://github.com/geometry-labs/icon-transactions) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-transactions.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-transactions/workflows/push-main/badge.svg?branch=main) | 
| [Logs](https://github.com/geometry-labs/icon-logs) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-logs.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-logs/workflows/push-main/badge.svg?branch=main) |
| [Addresses](https://github.com/geometry-labs/icon-addresses) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-addresses.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-addresses/workflows/push-main/badge.svg?branch=main) |
| [Contracts](https://github.com/geometry-labs/icon-contracts) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-contracts.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-contracts/workflows/push-main/badge.svg?branch=main)
| [Governance](https://github.com/geometry-labs/icon-governance) | [![GitHub Release](https://img.shields.io/github/release/geometry-labs/icon-governance.svg?style=flat)]() | ![](https://github.com/geometry-labs/icon-governance/workflows/push-main/badge.svg?branch=main)

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