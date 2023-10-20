provider "google" {

  project     = "molten-snowfall-401102"
  region      = "us-east1"
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