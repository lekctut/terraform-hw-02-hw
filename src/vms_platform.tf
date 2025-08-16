
variable "vpc_name2" {
  type        = string
  default     = "develop2"
  description = "VPC network & subnet name"
}


### yandex_compute_image

variable "vm_db_yandex_compute_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

### yandex_compute_instance

# variable "vm_db_name" {
#   type        = string
#   default     = "netology-develop-platform-db"
# }
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
}
#variable "vm_db_resources"{
#    type = object({ cores = number, memory = number, core_fraction = number })
#    default = {cores = 2, memory = 2, core_fraction = 20}
#  }
variable "vm_db_scheduling_policy" {
  type        = object({ preemptible = bool})
  default     = {preemptible = true}
}
variable "vm_db_network_interface" {
  type        = object({ nat = bool})
  default     = {nat = true}
}