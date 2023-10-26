module "enable-apies" {
  source = "./API_GCP"
}
module "network" {
    # i have defined defaults values for every variables 
    source = "./network"
  
}

module "serviceaccount" {
    source = "./serviceAccount"
  
}




module "gke" {
  source = "./GKE"

  vpc_name = module.network.vpc-name

  workload_subnet_name = module.network.workload_subnet_name

  serviceaccount_gke_sa_email = module.serviceaccount.serviceaccount_gke_sa_email


}