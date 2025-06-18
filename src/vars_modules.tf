variable "vms_mod_marketing" {
  type = list(
     object({ mod_source = string, env_name = string, subnet_zones = list(string), instance_name = string, instance_count = number, public_ip = bool }))
  default = ([ 
    { 
    mod_source        = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main", 
    env_name          = "marketing" , 
    subnet_zones      = ["ru-central1-a","ru-central1-b"],
    instance_name     = "webs", 
    instance_count    = 2, 
    public_ip         = true
  }])
}

variable "vms_mod_analitics" {
  type = list(
     object({ mod_source = string, env_name = string, subnet_zones = list(string), instance_name = string, instance_count = number, public_ip = bool }))
  default = ([ 
    { 
    mod_source        = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main", 
    env_name          = "analitics" , 
    subnet_zones      = ["ru-central1-a"], 
    instance_name     = "web-stage", 
    instance_count    = 1, 
    public_ip         = true
    }])
}