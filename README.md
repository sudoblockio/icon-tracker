<p align="center">
  <h3 align="center">ICON Explorer</h3>
</p>

Meta repo for ICON Blockchain Explorer. For testing purposes and local development. Includes a single code generated docker-compose that brings up the stack. 

### Sub Repos 

- [Metrics](https://github.com/geometry-labs/icon-metrics)
- [ETL](https://github.com/geometry-labs/icon-etl)
- [Network Exporter](https://github.com/geometry-labs/icon-network-exporter)
- [Frontend](https://github.com/geometry-labs/icon-tracker-frontend)
    - To be made public after launch 

#### Domains 

All data from the blockchain is normalized into the following microservices.

- [Blocks](https://github.com/geometry-labs/icon-blocks)
- [Transactions](https://github.com/geometry-labs/icon-transactions)
- [Logs](https://github.com/geometry-labs/icon-logs)
- [Addresses](https://github.com/geometry-labs/icon-addresses)
- [Contracts](https://github.com/geometry-labs/icon-contracts)
- [Governance](https://github.com/geometry-labs/icon-governance)

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