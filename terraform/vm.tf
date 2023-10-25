resource "yandex_compute_instance" "srv1" {
  name = "pluto"

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
    nat = true
  }

  metadata = {
    ssh-keys = "mercurial:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "srv2" {
  name = "jupiter"

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
    nat = true
  }

  metadata = {
    ssh-keys = "mercurial:${file("~/.ssh/id_rsa.pub")}"
  }
}