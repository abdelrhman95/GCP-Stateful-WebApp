# Create GKE Cluster
resource "google_container_cluster" "primary" {
    name     = var.gke_name
    location = var.gke_location


     # define my-vpc 
     network =  var.vpc_name                #google_compute_network.my-vpc.self_link

     #Deploy nodes in our subnet 
     subnetwork = var.workload_subnet_name      #google_compute_subnetwork.workload_subnet.self_link

    # We can't create a cluster with no node pool defined, but we want to only use
    # separately managed node pools. So we create the smallest possible default node pool and immediately delete it
     remove_default_node_pool = true
     initial_node_count = 1

    # dont know what is this option donig
     networking_mode = var.networking_mode

    # GKE is responsible for auto upgrading the cluster
     release_channel {
       channel = var.release_channel
     }

     private_cluster_config {
       
       #this field only applies to private clusters
       enable_private_endpoint = False
       enable_private_nodes = true  #creating a private endpoint on the cluster.
       master_ipv4_cidr_block = var.private_cluster_ip
       master_global_access_config {
         enabled = true
       }
     }


     master_authorized_networks_config {
       cidr_blocks {
         cidr_block = "0.0.0.0/0" #var.managment_subnet_cider
         display_name = "ip-cider-managmentsubnet"

       }
     }

     deletion_protection = false

  }




    




