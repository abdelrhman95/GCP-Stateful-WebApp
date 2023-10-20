#Configure Nat on router 
resource "google_compute_router_nat" "nat" {
    name       = "vpc-router-nat"
    router     = google_compute_router.router.name
    region     = google_compute_router.router.region
    nat_ip_allocate_option   = var.nat_ip_allocate_option
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES" # used by vm instances


    log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
