
terraform {
  backend "gcs" {
    bucket = "bucket-dev-iti-tfstate"
  
  }
  
}
