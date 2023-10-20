#Create router for NAT 
resource "google_compute_router" "router" {
    name = "private-router"
    region = google_compute_subnetwork.managment_subnet.region
    network = google_compute_network.my-vpc.self_link

    bgp {
    asn = 64514
  }
  
}