resource "google_compute_instance" "vm" {
  name         = var.vm-name
  machine_type = var.machine_type
  zone         = var.machine_zone

  tags = ["private-vm"] # instance network tag

  boot_disk {
    initialize_params {
      image = var.machine_image
    }

    
  }
 

  network_interface {
    network = module.network.vpc-name
    subnetwork = module.network.managment_subnet_name
  }


  service_account {
    email = module.serviceaccount.serviceaccount_gke_artifact_sa_email
    scopes = ["cloud-platform"]
  }
  
  #put your script file here
  metadata_startup_script = file("./startup-script.sh")     


  
}
