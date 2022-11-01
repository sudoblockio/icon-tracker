# Miscellaneous Planning

Doc to summarize miscellaneous endeavors. 

## Smart Contract Scaffolding Code Generator

It would be super helpful to have a project starter template that can be used to generate the boilerplate for starting to write smart contracts. This would include things like tests, CI, and helper utilities so that after generation, the SC can be deployed easily. Goal would be to be able to allow a user to deploy an SC from within two commands using [tackle](https://github.com/robcxyz/tackle-box), a language Rob wrote that specializes in generating boilerplate that was built from the most popular on a star basis project scaffolding tool called [cookiecutter](https://github.com/cookiecutter/cookiecutter). 

```shell
tackle icon-project/tackle-icon-contract
cd the-sc-name
tackle deploy  # Would include a selector for which testnet 
```

## Extended ABI Spec

Currently, there is an ABI specification that backs the return of [`icx_getScoreApi`](https://docs.icon.community/icon-stack/client-apis/json-rpc-api/v3#icx_getscoreapi) but this is somewhat limited. It would be nice if this was extended to include additional metadata similar to how OpenAPI does. For instance in the ABI we have docs for each function / event log but a spec could separate these and / or include additional metadata. For instance, with OpenAPI we have:

```yaml
title: Sample Pet Store App
description: This is a sample server for a pet store.
termsOfService: http://example.com/terms/
contact:
  name: API Support
  url: http://www.example.com/support
  email: support@example.com
license:
  name: Apache 2.0
  url: https://www.apache.org/licenses/LICENSE-2.0.html
version: 1.0.1
```

For an SC, it would make sense to include this type of metadata along with other things similar to OpenAPI. 

[Example OpenAPI](https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v2.0/yaml/petstore.yaml)

## Smart Contract Code Generator 

Similar to [openapi-generator](https://github.com/OpenAPITools/openapi-generator) for servers (there are multiple tools like this), would be really cool to create a code generator that sets up the interfaces needed to build out a full smart contract. Same with traditional OpenAPI server gens, it does not generate the business logic. 

## Smart Contract Client Code Generator 

Similar to [openapi-generator](https://github.com/OpenAPITools/openapi-generator) for clients, this would code gen a client needed to call an SC both from within an SC and externally. Would make the chain **very** easily to build on as it would create the same processes that are common in the web2 world.
