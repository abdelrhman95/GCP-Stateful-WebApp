#Private subnet 
resource "google_compute_subnetwork" "managment_subnet" {
name          = "managment-subnet"
ip_cidr_range = var.managment_subnet_cider
region        = var.managment-subnet-region

network       = google_compute_network.my-vpc.self_link  #Using self_link avoids issues with resource name changes
description = "Managment subnet"

#private_ip_google_access = true

}   

#Workload subnet 
resource "google_compute_subnetwork" "workload_subnet" {
name          = "workload-subnet"
ip_cidr_range = var.workload_subnet_cider
region        = var.workload-subnet-region

network       = google_compute_network.my-vpc.self_link  #Using self_link avoids issues with resource name changes
description = "workload subnet for GKE"

#private_ip_google_access = true

}
