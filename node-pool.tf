resource "google_container_node_pool" "node_pool" {

    name = "iti-nodes"
    location = "us-east1"
    cluster = google_container_cluster.primary.name
    

    # the number of nodes that should be created for that node pool.
    node_count = 3


    node_config {
      preemptible = true
      machine_type = "e2-micro"

    #Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
      service_account = google_service_account.gke-sa.email
      oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    
    }

    max_pods_per_node = 100

    node_locations = ["us-east1-b","us-east1-d", "us-east1-c"]


  
}