variable "vm-name" {
  type = string
  default = "managment-mv"
}

variable "machine_type" {
  type = string
  default = "e2-medium"
}

variable "machine_zone" {
  type = string
  default = "us-central1-b"
}

variable "machine_image" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}


variable "backend-bucket" {
  type = string
  default = "tf-state"
}

variable "project_id" {
  type = string
  default = "project-id"
}

variable "region" {
  type = string
  default = "asia-east1"
}

variable "gcp-sa-key"{
type = string
default = "secret/gcp-sa-key.json"
}



