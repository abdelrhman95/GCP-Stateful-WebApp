resource "google_compute_instance" "vm" {
  name         = "managment-vm"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  tags = ["private-vm"] # instance network tag

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }

    
  }
 

  network_interface {
    subnetwork = google_compute_subnetwork.managment_subnet.self_link
  }


  service_account {
    email = google_service_account.gke_artifact_sa.email
    scopes = ["cloud-platform"]
  }


  
}