resource "yandex_alb_load_balancer" "balancer" {
  name = "load-balancer"

  network_id = yandex_vpc_network.network-1.id

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.subnet-1.id
    }
    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.subnet-2.id
    }
    location {
      zone_id   = "ru-central1-c"
      subnet_id = yandex_vpc_subnet.subnet-3.id
    }
  }

  listener {
    name = "listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [443]
    }
    tls {
      default_handler {
        certificate_ids = ["fpqm4mjef093oo4qu3o5"]
        http_handler {
          http_router_id = yandex_alb_http_router.router.id
        }
      }
    }
  }

}

resource "yandex_alb_http_router" "router" {
  name = "http-router"
}

resource "yandex_alb_virtual_host" "virtual-host" {
  name           = "virtual-host"
  http_router_id = yandex_alb_http_router.router.id
  route {
    name = "route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.backend-group.id
      }
    }
  }
}

resource "yandex_alb_backend_group" "backend-group" {
  name = "backend-group"

  http_backend {
    name             = "http-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.target-group.id]
    healthcheck {
      timeout  = "1s"
      interval = "1s"
      http_healthcheck {
        path = "/ping"
      }
    }
  }
}

resource "yandex_alb_target_group" "target-group" {
  name = "target-group"

  target {
    subnet_id  = yandex_vpc_subnet.subnet-1.id
    ip_address = yandex_compute_instance.srv1.network_interface[0].ip_address
  }

  target {
    subnet_id  = yandex_vpc_subnet.subnet-1.id
    ip_address = yandex_compute_instance.srv2.network_interface[0].ip_address
  }
}
