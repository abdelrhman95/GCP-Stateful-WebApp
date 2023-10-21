provider "google" {

  project     = var.project_id
  region      = var.region

  # set crediential for your project - must create serviceaccount first and set its key here
  credentials = file("/home/abdo/GCP-Project/molten-snowfall-401102-71ebb6dd91a2.json")

  
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 3.50.0" 
    }
  }
}