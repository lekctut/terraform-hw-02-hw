# output "name" {
#    value = data.yandex_compute_instance.name
#}

output "info" {
    value = [
       {name_vm = yandex_compute_instance.platform.name
       fqdn = yandex_compute_instance.platform.fqdn
       ip_adress = yandex_compute_instance.platform.network_interface.0.nat_ip_address},

       {name_vm = yandex_compute_instance.platform2.name
       fqdn = yandex_compute_instance.platform2.fqdn
       ip_adress = yandex_compute_instance.platform2.network_interface.0.nat_ip_address}
    ]
}
