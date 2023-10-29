variable "vpc-name" {
    type = string
    default = "vpc-network"
}

variable "routing_mode" {
    type = string
    default = "GLOBAL"
  
}

variable "managment_subnet_cider" {
  type = string
  default = "10.0.1.0/24"
}

variable "workload_subnet_cider" {
  type = string
  default = "10.0.2.0/24"
}

variable "vpc-region" {
    type= string
    default = "asia-east1"
  
}

variable "nat_ip_allocate_option" {
    type = string
    default = "AUTO_ONLY"
  
}

variable "managment-subnet-region" {
  type=string
  default="us-central1"
}

variable "workload-subnet-region" {
  type = string
  default = "asia-east1"
}
