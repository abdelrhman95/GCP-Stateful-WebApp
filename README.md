# GCP-Terraform-Node.jsApp
Building a stateful web app using  GCP architecture to deploy it  in the GKE cluster using Terraform as infrastructure as code (IaC) 


## Overview
* Develop and use your own Terraform modules to build the required infrastructure
on GCP:
  - a. IAM: 2 service accounts - N roles.
  - b. Network: 1 VPC – 2 subnets – N firewall rules – 1 NAT.
  - c. Compute: 1 private VM – 1 GKE standard cluster across 3 zones.
  - d. Storage: Artifact Registry repository to store the images.
  - 
* Deploy the MongoDB replicaset across the 3 zones

* Dockerize and Deploy the Node.js web app that will connect to the 3 DB replicas.

* Expose the web app using ingress/load balancer.


## Architecture
![Screenshot from 2023-10-26 20-43-58](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/399f1236-4692-46ac-8386-1d676d06fece)


## Prerequisites
 * GCP Account
 *  Terraform
 *  docker
 *  kubectl

## Steps 


