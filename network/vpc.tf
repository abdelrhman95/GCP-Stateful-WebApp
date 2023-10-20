resource "google_compute_network" "my-vpc" {
    name = var.vpc-name
    auto_create_subnetworks  = false # do not add any region by default 

  routing_mode = var.routing_mode
}