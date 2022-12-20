# Infrastructure Planning

Doc to summarize major changes to the infrastructure for the tracker and associated APIs. 

## Improved Logging with Alarms 

Current logging is not hooked up with any kind of alarm system. While we do have alarms setup on critical metrics that inform overall system health such as monitoring processing of blocks, it does not capture things such as DB issues. External API status codes are pinged which alarms are set up for but would be really helpful to be able to get an index of all status codes along with origins to get stats on endpoint usage. 

## Migrate to K8s to Bare Metal 

Right now the tracker is running on a hybrid setup with docker compose running on bare metal and managed k8s running on cloud VMs. The managed k8s, unknown when the deployment began, is not running HA masters and in fact has the master running on a single node. This has caused issues on several occasions where the cloud provider had outages of that server. On one occasion, this server went down and the entire cluster needed to be redeployed, albeit with the same VMs and EBS volumes. 

The plan would be to migrate the k8s cluster to run on bare metal with masters being run on cloud VMs. The added benefits of this would be:

- HA masters with a higher SLA 
- Lower costs
  - No need for all the cloud VMs and their EBS volumes
- Better health checking 
  - Currently, the bare metal instances don't have individual health checks 
  - Plan would be to hook up a service mesh (istio) to get health checks on each service 
- HA DBs
  - Current DBs are not HA 
  - Would allow for 
- Better drive performance 
  - All volumes would be striped in RAID 0 with each service running in HA 
- More mobility for future setups
  - If in the event the architecture would need to be migrated again, the whole thing can be lift and switched very easily 
- Easier to manage
  - Long term, this setup would be easier to manage in general 
- More easily evangelize the deployment of ones own cluster 
  - Right now we have a docker-compose setup but this is lacking a lot of nice tooling that helps with things like monitoring and logging
  - An all k8s approach would allow for others to deploy the tracker on their own. It could even be possible on a single server running something like minikube of k3s 

Challenges:

- Would need to deploy own masters. Not something very hard to do but would need to figure out some networking things and aspects of deployment / management of masters 
- Need to deploy CSI driver to subdivide PVCs 
