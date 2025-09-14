module "storage" {
  source = "./modules/storage"
}

module "vpc" {
  source          = "./modules/vpc"
  network_default = "projects/${var.project_id}/global/networks/default"
}

module "compute" {
  source          = "./modules/compute"
  network_default = "projects/${var.project_id}/global/networks/default"

  startup_script_url = module.storage.gcloud_storage_start_script_url

  wakapi_vpc_id        = module.vpc.wakapi_vpc_id
  wakapi_vpc_self_link = module.vpc.wakapi_vpc_self_link
  wakapi_vpc_subnet    = module.vpc.wakapi_vpc_subnet

  service_account = var.service_account
}
