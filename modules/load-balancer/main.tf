resource "google_compute_global_forwarding_rule" "wakapi_lb_frontend" {
  name = "wakapi-frontend"

  load_balancing_scheme = "EXTERNAL_MANAGED"

  ip_protocol = "TCP"
  ip_version  = "IPV4"
  port_range  = "80"

  target     = google_compute_target_http_proxy.wakapi_lb_http_proxy.id
  ip_address = "" // Do not delete, it's auto generate public ipv4.
}

resource "google_compute_target_http_proxy" "wakapi_lb_http_proxy" {
  name    = "wakapi-lb-http-proxy"
  url_map = google_compute_url_map.wakapi_lb.id
}

resource "google_compute_url_map" "wakapi_lb" {
  name            = "wakapi-lb"
  default_service = google_compute_backend_service.wakapi_backend.id
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
  locality_lb_policy              = "RING_HASH"

  consistent_hash {
    minimum_ring_size = 1024
  }
}
