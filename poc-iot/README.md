# Contrail Multi-Cloud Vagrant Setup (MC-GW)

Using this repo you can create a whole Multi-Cloud POC setup using Vagrant. The topology is similar to CFM with an addition of new server "s-srv4" on vQFX1 Spine which will be configrued as on-prem MC-GW (Multi-Cloud Gateway) to provide connectivity to Public Cloud AWS and Azure. In this setup on-prem vagrant setup will connect to both AWS and Azure.

Note: Please check high level E2E topology diagram for 


```bash
vagrant box add robwc/minitrusty64
vagrant box add qarham/ubuntu-1604-250G

 ```


## High Level Vagrant Topology Diagram

![Multi Cloud](images/mcloud-1x1vQFX-Top-Overview.png)


## Use-cases Tested on this setup

* ### [UC-01-Contrail_Command_Installation](../docs/multi-cloud/01-Install-Contrail-Command.md)

* ### [UC-02-OpenStack-Contrail-Cluster-Provisioning](../docs/multi-cloud/02-OpenStack-Contrail-Cluster-Provisioning.md)

* ### [UC-03-Contrail-MultiCloud-Provisioning](../docs/multi-cloud/03-Contrail-MultiCloud-Provisioning.md)

* ### [UC-04-K8s PODs & OpenStack VMs Workload Testing](../docs/multi-cloud/04-PODs-VMs-Workload-Testing.md)

