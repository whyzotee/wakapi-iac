resource "google_compute_instance_group" "unmanaged" {
  name    = "wakapi-unmanaged-group"
  zone    = "us-west1-a"
  network = var.network_default

  instances = [google_compute_instance.wakapi_unmagend_instance.id]

  named_port {
    name = "http"
    port = "80"
  }
}

resource "google_compute_instance" "wakapi_unmagend_instance" {
  name         = "wakapi-instance-unmanaged"
  machine_type = "e2-micro"

  metadata = {
    "startup-script-url" : var.startup_script_url
  }

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}


