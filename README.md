<p align="center">
  <h3 align="center">ICON Explorer</h3>
</p>

Meta repo for ICON Blockchain Explorer. For testing purposes and local development. Includes a single code generated docker-compose that brings up the stack. 

### Sub Repos 

- [ETL](https://github.com/geometry-labs/icon-etl)
- [Blocks](https://github.com/geometry-labs/icon-blocks)
- [Transactions](https://github.com/geometry-labs/icon-transactions)
- [Logs](https://github.com/geometry-labs/icon-logs)
- [Accounts](https://github.com/geometry-labs/icon-accounts)
- [Contracts](https://github.com/geometry-labs/icon-contracts)
- [Tokens](https://github.com/geometry-labs/icon-tokens)
- [Frontend](https://github.com/geometry-labs/icon-tracker-frontend)

## Usage 

```bash
make help 
make pull-repos 
make up 
make test
```

Produces a file `docker-stack.yml` which you can:

```bash
docker-compose -f docker-stack.yml <whatever>
```

Or just use the make commands 

```bash
make ps 
make logs 
```