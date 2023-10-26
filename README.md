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
![Screenshot from 2023-10-26 20-43-58](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/1330e1ff-220e-4a6d-a8aa-c79460a17823)



## Prerequisites
 * GCP Account
 *  Terraform
 *  docker
 *  kubectl

## Steps 
* Build application image by docker file and push to artifact registry 
![Screenshot from 2023-10-26 21-10-47](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/f6615458-fa09-4fee-a3da-0cfd0979e713)


* Initialize infra using terraform
   ```sh
   terraform init
   terraform plan
   terraform apply --auto-approve
   ```
    - after applying it should return that your infra has been completed
      ![Screenshot from 2023-10-26 21-19-14](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/29ac103a-00ba-42f8-b48f-97357ec69eca)

      
* After creating the GCP architecture we have to ssh to private-vm  through IAP
   ```sh
  gcloud compute ssh [vm-name] --tunnel-through-iap --zone=[zone-name] --project=[project-id]
  ```
* Once you connect to you private vm, you can access GKE Cluster
   ```sh
   gcloud container clusters get-credentials [cluster-name] --zone [zone-name] --project [project-id]
   ```
  - Deploy MongoDB (stateful)
  - Deploy Node.js app
  - Deploy LoadBalancer service

## Results

*  ![k8s](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/6e816740-4c02-44b8-a3aa-b113c3e91d87)


      ``` sh
      curl EXTERNAL_IP:PORT
      ```
      ![running application through load balancer](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/04ad243e-1dc5-4f5b-bf02-41aea8893232)






