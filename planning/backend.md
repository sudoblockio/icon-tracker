# Backend Planning

Doc to summarize major changes to the backend for the tracker and associated APIs. 

## Combine API with Transformer 

Right now for various reasons the API and transformer live in different repos and are deployed separately. Since they both operate on the same schemas, it would be very helpful to combine these into the same repo and compile them so that both functions can be run from the same binary. Deployment will still be as different containers with the difference between them toggleable based on different commands on the entrypoint. 

Some changes are being looked at to support this. 

- Updates to protobuf schema management 
  - Currently, we rely on two sets of schemas, one for the transformer and one for the API.
  - The API doesn't have any tags which are used to generate the gorm structs and validation. 
  - When we combine these repos, it is important to 


- Move from [envconfig](https://github.com/kelseyhightower/envconfig) to [viper](https://github.com/spf13/viper)
  - This is done because the current configuration

## Improved Logging with Alarms 

Current logging is not hooked up with any kind of alarm system. While we do have alarms setup on critical metrics that inform overall system health such as monitoring processing of blocks, it does not capture things such as DB issues. External API status codes are pinged which alarms are set up for but would be really helpful to be able to get an index of all status codes. 

## Balance Over Time

Much time was spent in the past to get the balance over time but efforts were unsuccessful. In the future, it would be good to get this index going with a configurable window. Windowing needs to be done as it is not helpful to keep an index of every single transaction as for high Tx addresses, there could be hundreds of thousands of results over a short period of time. The window to summarize the results should be selected to be the minimum resolution needed for the results on the frontend. A stream processor will then be built to keep the index maintained at head. 
