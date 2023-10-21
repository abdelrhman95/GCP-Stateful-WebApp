variable "gke_name" {
  type = string
  default = "my-gke-cluster"
}


variable "vpc_name" {
  type = string
}

variable "workload_subnet_name" {
  type = string
}


variable "workload_subnet_cidr" {
  type = string
}

variable "serviceaccount_gke_sa_email" {
  type = string
}



variable "gke_location" {
  type = string
  default = "us-east1"
}

variable "networking_mode" {
  type = string
  default = "VPC_NATIVE"
}

variable "release_channel" {
  type = string
  default = "REGULAR"
}


variable "private_cluster_ip" {
  type = string
  default = "172.16.0.0/28"
}

variable "node_pool_name" {
  type = string
  default = "iti-node-pool"
}

variable "node_machine_type" {
  type = string
  default = "e2-micro"
}
variable "node_count" {
  type = number
  default = 3
}

variable "max_pods_per_node" {
  type = number
  default = 100
}