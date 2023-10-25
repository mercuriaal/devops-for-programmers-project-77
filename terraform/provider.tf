terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

provider "yandex" {
  zone = "ru-central1-a"
  token = var.yc_token
  cloud_id = var.yc_cloud_id
  folder_id = var.yc_folder_id
}

provider "datadog" {
  api_url = "https://api.datadoghq.eu/"
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}