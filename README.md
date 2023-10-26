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
* Build application image by docker file and push to artifact registry 
![image](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/f481d415-7727-46e9-94dd-32785aa1cbd3)

* Initialize infra using terraform
   ```sh
   terraform init
   terraform plan
   terraform apply --auto-approve
   ```
    - after applying it should return that your infra have completed
       ![image](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/ff16f2f6-43c7-4356-ab74-9b476c76ae4a)
      
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

*  Results
   ![k8s](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/d49b1c08-0071-4281-bfe1-564055d16753)

      ``` sh
      curl EXTERNAL_IP:PORT
      ```
      ![running application through load balancer](https://github.com/abdelrhman95/GCP-Terraform-Node.jsApp/assets/58826560/5eaaaf4c-0292-42a4-9100-cd56d9c91eef)





