resource "google_compute_forwarding_rule" "wakapi_lb_frontend" {
  name = "wakapi-frontend"

  load_balancing_scheme = "EXTERNAL_MANAGED"

  ip_protocol = "TCP"
  ip_version  = "IPV4"
  port_range  = "80"

  backend_service = google_compute_backend_service.wakapi_backend.id
}

resource "google_compute_forwarding_rule" "wakapi_lb_frontend_ipv6" {
  name = "wakapi-frontend-ipv6"

  load_balancing_scheme = "EXTERNAL_MANAGED"

  ip_protocol = "TCP"
  ip_version  = "IPV6"
  port_range  = "80"

  backend_service = google_compute_backend_service.wakapi_backend.id
}

resource "google_compute_backend_service" "wakapi_backend" {
  name = "wakapi-backend"

  protocol  = "HTTP"
  port_name = "http"

  load_balancing_scheme = "EXTERNAL_MANAGED"
  timeout_sec           = 30
  enable_cdn            = true


  log_config {
    enable        = true
    sample_rate   = 1
    optional_mode = "EXCLUDE_ALL_OPTIONAL"
  }

  iap {
    enabled = false
  }

  backend {
    group                 = var.unmig_group
    capacity_scaler       = 1
    max_rate_per_instance = 50
    balancing_mode        = "RATE"
  }

  backend {
    group                 = var.wakapi_mig_group
    capacity_scaler       = 1
    max_rate_per_instance = 50
    balancing_mode        = "RATE"
  }

  health_checks = [var.wakapi_health_check_id]

  session_affinity                = "GENERATED_COOKIE"
  connection_draining_timeout_sec = 300
}
