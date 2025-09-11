module "compute" {
  source             = "./modules/compute"
  network_default    = "projects/${var.project_id}/global/networks/default"
  startup_script_url = module.storage.gcloud_storage_start_script_url
  # wakapi_vpc_id = module.network.wakapi_vpc_id
}

# module "network" {
#   source = "./modules/network"
# }

module "storage" {
  source = "./modules/storage"
}
