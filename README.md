<p align="center">
  <h3 align="center">ICON Explorer</h3>
</p>

Meta repo for ICON Blockchain Explorer. For testing purposes and local development. Includes a single code generated docker-compose that brings up the stack. 

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