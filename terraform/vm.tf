resource "yandex_compute_instance" "srvs" {
  for_each = {
    "srv1" = "pluto",
    "srv2" = "jupiter"
  }
  name = each.value
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.img.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.app_vm_user}:${var.ssh_key}"
  }
}