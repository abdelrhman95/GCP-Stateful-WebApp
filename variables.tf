variable "vm-name" {
  type = string
  default = "managment-mv"
}

variable "machine_type" {
  type = string
  default = "e2-micro"
}

variable "machine_zone" {
  type = string
  default = "us-central1-b"
}

variable "machine_image" {
  type = string
  default = "debian-cloud/debian-11"
}


variable "backend-bucket" {
  type = string
  default = "tf-state"
}

variable "project_id" {
  type = string
  default = "molten-snowfall-401102"
}

variable "region" {
  type = string
  default = "asia-east1"
}




