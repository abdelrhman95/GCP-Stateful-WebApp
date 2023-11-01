provider "google" {

  project     = var.project_id
  region      = var.region

  # set crediential for your project - must create serviceaccount first and set its key here
  #credentials = file("/home/abdo/GCP-Project/molten-snowfall-401102-972c349f4666.json")

  
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 3.50.0" 
    }
  }
}
