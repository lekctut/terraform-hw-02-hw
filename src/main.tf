resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_yandex_compute_image_family
}

resource "yandex_compute_instance" "platform" {
  name        = local.name_vm1
  platform_id = var.vm_web_platform_id
  resources {
    cores         =  var.vm_resources.web.cores
    memory        =  var.vm_resources.web.memory
    core_fraction =  var.vm_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_scheduling_policy.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_network_interface.nat
  }

  metadata = var.vm_metadata

}

resource "yandex_vpc_network" "develop2" {
  name = var.vpc_name2
}
resource "yandex_vpc_subnet" "develop2" {
  name           = var.vpc_name2
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop2.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu2" {
  family = var.vm_db_yandex_compute_image_family
}

resource "yandex_compute_instance" "platform2" {
  name        = local.name_vm2
  zone        = var.vm_db_zone
  platform_id = var.vm_db_platform_id
  resources {
    cores         =  var.vm_resources.db.cores
    memory        =  var.vm_resources.db.memory
    core_fraction =  var.vm_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu2.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_scheduling_policy.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop2.id
    nat       = var.vm_db_network_interface.nat
  }

  metadata = var.vm_metadata

}