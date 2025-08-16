###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "<your_ssh_ed25519_key>"
#   description = "ssh-keygen -t ed25519"
# }


### yandex_compute_image

variable "vm_web_yandex_compute_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

### yandex_compute_instance

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform"
}

# variable "vm_web_name-web" {
#   type        = string
#   default     = "netology-develop-platform-web"
# }


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
}



#variable "vm_db_resources"{
#    type = object({ cores = number, memory = number, core_fraction = number })
#    default = {cores = 2, memory = 2, core_fraction = 20}
#  }

variable "vm_web_scheduling_policy" {
  type        = object({ preemptible = bool})
  default     = {preemptible = true}
}
variable "vm_web_network_interface" {
  type        = object({ nat = bool})
  default     = {nat = true}
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
}

variable "vm_resources"{
    type = map (object({
      cores = number
      memory = number
      core_fraction = number
    }))
    default ={"web" = {cores = 2, memory = 1, core_fraction = 5}, "db" = {cores = 2, memory = 2, core_fraction = 20}}
  }

variable "vm_metadata"{
    type =object({
      serial-port-enable = number
      ssh-keys = string
    })
    default ={serial-port-enable = 1, ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJztg5ehO3ZVIV5fMsvNOkcRk6ed1QKPy45JWWzQ7z/3"}
}