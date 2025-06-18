module "vpc_marketing" {
  source       = "./modules/vpc"
  env_name     = var.vms_mod_marketing[0].env_name
  subnets = [
    { zone = var.default_zone_a, cidr = var.default_cidr_a },
    { zone = var.default_zone_b, cidr = var.default_cidr_b },
  ]
}

module "vpc_analitics" {
  source       = "./modules/vpc"
  env_name     = var.vms_mod_analitics[0].env_name
  subnets = [
    { zone = var.default_zone_a, cidr = var.default_cidr_a },
  ]
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vms_mod_marketing[0].env_name
  network_id     = module.vpc_marketing.network_id
  subnet_zones   = var.vms_mod_marketing[0].subnet_zones
  subnet_ids     = module.vpc_marketing.subnet_ids
  instance_name  = var.vms_mod_marketing[0].instance_name
  instance_count = var.vms_mod_marketing[0].instance_count
  image_family   = var.vm_web_image_family
  public_ip      = var.vms_mod_marketing[0].public_ip

  labels = { 
    project = var.vms_mod_marketing[0].env_name
     }
  metadata = {
    user-data = data.template_file.cloudinit.rendered
    serial-port-enable = local.serial-port-enable
  }
}

module "analitics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vms_mod_analitics[0].env_name
  network_id     = module.vpc_analitics.network_id
  subnet_zones   = var.vms_mod_analitics[0].subnet_zones
  subnet_ids     = module.vpc_analitics.subnet_ids
  instance_name  = var.vms_mod_analitics[0].instance_name
  instance_count = var.vms_mod_analitics[0].instance_count
  image_family   = var.vm_web_image_family
  public_ip      = var.vms_mod_analitics[0].public_ip

  labels = { 
    project = var.vms_mod_analitics[0].env_name
     }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
    serial-port-enable = local.serial-port-enable
  }
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

    vars = {
    ssh_public_key     = file(var.vms_ssh_root_key)
  }
}