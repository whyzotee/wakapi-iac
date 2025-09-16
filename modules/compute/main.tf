resource "google_compute_autoscaler" "default" {
  name   = "wakapi-autoscaler"
  zone   = "us-west1-a"
  target = google_compute_instance_group_manager.wakapi_mig.id

  autoscaling_policy {
    min_replicas    = 1
    max_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.6
    }
  }
}

resource "google_compute_instance_template" "wakapi_template" {
  name        = "wakapi-template"
  description = "This template is used to create wakapi server instances."

  machine_type         = "e2-micro"
  region               = "us-west1"
  tags                 = ["http-server"]
  can_ip_forward       = false
  instance_description = "description assigned to instances"

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.wakapi_vpc_id
    subnetwork = var.wakapi_vpc_subnet
    access_config {}
  }

  metadata = {
    "startup-script-url" : var.startup_script_url
  }

  service_account {
    email  = var.service_account
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance_group_manager" "wakapi_mig" {
  name = "wakapi-mig"
  zone = "us-west1-a"

  target_size        = 2
  base_instance_name = "wakapi"

  version {
    instance_template = google_compute_instance_template.wakapi_template.self_link
  }

  named_port {
    name = "http"
    port = "80"
  }
}

resource "google_compute_instance_group" "unmanaged" {
  name    = "un-mig"
  zone    = "us-west1-a"
  network = var.default_network

  instances = [google_compute_instance.wakapi_unmagend_instance.id]

  named_port {
    name = "http"
    port = "80"
  }
}

resource "google_compute_instance" "wakapi_unmagend_instance" {
  name         = "wakapi-unmanaged"
  machine_type = "e2-micro"

  metadata = {
    "startup-script-url" : var.startup_script_url
  }

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  network_interface {
    network    = var.wakapi_vpc_id
    subnetwork = var.wakapi_vpc_subnet
  }

  service_account {
    email  = var.service_account
    scopes = ["cloud-platform"]
  }
}
