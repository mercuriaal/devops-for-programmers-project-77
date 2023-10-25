data "yandex_compute_image" "img" {
  family = "container-optimized-image"
}

variable "datadog_api_key" {
  description = "Datadog token"
  type = string
  sensitive = true
}

variable "datadog_app_key" {
  description = "Datadog app key"
  type = string
  sensitive = true
}

variable "yc_token" {
  description = "Yandex cloud token"
  type = string
  sensitive = true
}

variable "yc_cloud_id" {
  description = "Yandex cloud id"
  type = string
  sensitive = true
}

variable "yc_folder_id" {
  description = "Yandex folder id"
  type = string
  sensitive = true
}