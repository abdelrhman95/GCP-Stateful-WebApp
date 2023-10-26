variable "project_id" {
  type = string
  default = "molten-snowfall-401102"
}


variable "services" {
  type = list(string)
  default = ["cloudresourcemanager.googleapis.com", 
             "iap.googleapis.com",
            "iam.googleapis.com", 
            "compute.googleapis.com",
            "artifactregistry.googleapis.com",
            "container.googleapis.com",
            "networkconnectivity.googleapis.com",
            "cloudbuild.googleapis.com" ]
}