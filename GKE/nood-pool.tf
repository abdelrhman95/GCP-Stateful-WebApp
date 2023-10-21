resource "google_container_node_pool" "node_pool" {

    name = var.node_pool_name
    location = var.gke_location
    cluster = google_container_cluster.primary.name
    

    # the number of nodes that should be created for that node pool.
    node_count = var.node_count


    node_config {
      preemptible = true
      machine_type = var.node_machine_type
      disk_size_gb = 10
      disk_type = var.disk_type
    #Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
      service_account = var.serviceaccount_gke_sa_email
      oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    
    }

    max_pods_per_node = var.max_pods_per_node

    node_locations = ["asia-east1-a","asia-east1-b", "asia-east1-c"]


  
}