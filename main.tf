module "storage" {
  source = "./modules/storage"
}

module "firewall" {
  source = "./modules/firewall"

  default_network    = "projects/${var.project_id}/global/networks/default"
  wakapi_vpc_network = module.vpc.wakapi_vpc_id
}

module "vpc" {
  source = "./modules/vpc"

  region          = var.region
  default_network = "projects/${var.project_id}/global/networks/default"
}

module "compute" {
  source = "./modules/compute"

  zone            = var.zone
  region          = var.region
  default_network = "projects/${var.project_id}/global/networks/default"

  startup_script_url = module.storage.gcloud_storage_start_script_url

  wakapi_vpc_id        = module.vpc.wakapi_vpc_id
  wakapi_vpc_self_link = module.vpc.wakapi_vpc_self_link
  wakapi_vpc_subnet    = module.vpc.wakapi_vpc_subnet

  service_account = var.service_account
}

module "health_check" {
  source = "./modules/health-check"
}

module "load_balancer" {
  source = "./modules/load-balancer"

  unmig_group            = module.compute.unmig_instance_group
  wakapi_mig_group       = module.compute.wakapi_mig_instance_group
  wakapi_health_check_id = module.health_check.wakapi_health_check_id
}
