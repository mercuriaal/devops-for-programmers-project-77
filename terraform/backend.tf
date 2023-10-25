terraform {
  backend "s3" {
    endpoint                    = "https://storage.yandexcloud.net"
    region                      = "ru-central1"
    key                         = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true

  }
}