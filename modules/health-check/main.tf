resource "google_compute_health_check" "wakapi_health_check" {
  name = "wakapi-health-check"

  timeout_sec         = 5
  check_interval_sec  = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port = 80
  }
}
