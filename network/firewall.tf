# create firewall for allowing ssh on mangament-vm 
resource "google_compute_firewall" "allow-iap-ssh" {
  name    = "allow-iap-ssh"
  network = google_compute_network.my-vpc.name
  direction = "INGRESS"


  allow {
    protocol = "tcp"
    ports    = ["22","8080"]
  }

  source_ranges = [
    "35.235.240.0/20", 
    #google_compute_subnetwork.managment_subnet.ip_cidr_range
  ] #  the current IAP TCP forwarding IP range
  
  # target_tags = [  ] # maybe i need it later usage to specify which machine should this firewall use & i have to use the same tag i created in my vm tage section
}
 
