resource "google_compute_network" "my-vpc" {
    name = "vpc-network"
    auto_create_subnetworks  = false
    mtu=1460

  routing_mode = "GLOBAL"
}

#Private subnet 
resource "google_compute_subnetwork" "managment_subnet" {
name          = "managment-subnet"
ip_cidr_range = "10.0.1.0/24"
region        = "us-east1"

network       = google_compute_network.my-vpc.self_link  #Using self_link avoids issues with resource name changes
description = "Managment subnet"

private_ip_google_access = true

}   

#Workload subnet 
resource "google_compute_subnetwork" "workload_subnet" {
name          = "workload-subnet"
ip_cidr_range = "10.0.2.0/24"
region        = "us-east1"

network       = google_compute_network.my-vpc.self_link  #Using self_link avoids issues with resource name changes
description = "workload subnet for GKE"

private_ip_google_access = true

}



#Create router for NAT 
resource "google_compute_router" "router" {
    name = "private-router"
    region = google_compute_subnetwork.managment_subnet.region
    network = google_compute_network.my-vpc.self_link
  
}

#Configure Nat on router 
resource "google_compute_router_nat" "nat" {
    name       = "vpc-router-nat"
    router     = google_compute_router.router.name
    region     = google_compute_router.router.region
    nat_ip_allocate_option   = "AUTO_ONLY" 
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES" # used by vm instances
}


# create firewall for allowing ssh on mangament-vm 
resource "google_compute_firewall" "allow-iap-ssh" {
  name    = "allow-iap-ssh"
  network = google_compute_network.my-vpc.name
  

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [
    "35.235.240.0/20", 
    google_compute_subnetwork.managment_subnet.ip_cidr_range
  ] #  the current IAP TCP forwarding IP range
  
}


