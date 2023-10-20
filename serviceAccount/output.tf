#for the private vm 
output "serviceaccount_gke_artifact_sa_email" {
  value = google_service_account.gke_artifact_sa.email
}



output "serviceaccount_gke_sa_email" {
  value = google_service_account.gke-sa.email
}