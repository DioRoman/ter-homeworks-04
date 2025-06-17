resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = var.vpc_subnet_name_a
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_a
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.vpc_subnet_name_b
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_b
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vms_mod_marketing[0].env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.vms_mod_marketing[0].subnet_zones 
  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
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
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.vms_mod_analitics[0].subnet_zones 
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
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