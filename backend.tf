resource "google_storage_bucket" "terraform-bucket-for-state" {
  name                        = "bucket-dev-iti"
  location                    = "US"
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  
}



terraform {
  backend "gcs" {
    bucket = "tf-state"
  
  }
}