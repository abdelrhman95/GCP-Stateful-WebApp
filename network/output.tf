output "vpc-name" {
    value = google_compute_network.my-vpc.name
  
}

output "vpc-id" {
  value = google_compute_network.my-vpc.project
}

output "managment_subnet_name" {
  value = google_compute_subnetwork.managment_subnet.name
}


output "workload_subnet_name" {
  value = google_compute_subnetwork.workload_subnet.name
}

output "mangament_subnet_cider" {
  value = google_compute_subnetwork.managment_subnet.ip_cidr_range
}


output "workload_subnet_cider" {
  value = google_compute_subnetwork.workload_subnet.ip_cidr_range
}
