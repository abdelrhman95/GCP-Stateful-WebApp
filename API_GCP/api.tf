resource "google_project_service" "apis" {
  project = var.project_id
  count = length(var.services)
  service = var.services[count.index]
  disable_dependent_services = false
  disable_on_destroy = false
  
}

# givin sometime for config
resource "time_sleep" "delay-config" {
  create_duration = "50s"
  depends_on = [ google_project_service.apis ]
}
