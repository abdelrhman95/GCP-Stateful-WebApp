# create service account for artifact and gke
resource "google_service_account" "gke_artifact_sa" {

    account_id = "artifact-registry"
    display_name = "Serviceaccount for Artifact Registry"
  
}

resource "google_service_account" "gke-sa" {

    account_id = "gke-service-account-id"
    display_name = "gke-service-account"
  
}


#Grant pull Artifact Registry permissions
resource "google_project_iam_member" "pull-image" {
  
  project = var.project_id
  role = "roles/artifactregistry.reader"
  member = "serviceAccount:${google_service_account.gke_artifact_sa.email}"
}


#Grant push Artifact Registry permissions
resource "google_project_iam_member" "push-image" {
  
  project = var.project_id
  role = "roles/artifactregistry.writer"
  member = "serviceAccount:${google_service_account.gke_artifact_sa.email}"
}


#Grant permissions to access GKE
resource "google_project_iam_member" "gke_permissions" {
project = var.project_id
role    = "roles/container.developer"
member  = "serviceAccount:${google_service_account.gke_artifact_sa.email}"
}



resource "google_project_iam_member" "member" {
project = var.project_id
role    = "roles/container.admin"
member  = "serviceAccount:${google_service_account.gke-sa.email}"
}

resource "google_project_iam_member" "pull-image-for-container" {
  
  project = var.project_id
  role = "roles/artifactregistry.reader"
  member = "serviceAccount:${google_service_account.gke-sa.email}"
}
