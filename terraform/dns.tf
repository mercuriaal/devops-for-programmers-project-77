resource "yandex_dns_zone" "zone1" {
  name = "mercury-zone"
  zone = "mercurial-learning-app.ru."
  public = true
}

resource "yandex_dns_recordset" "rs-a" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "mercurial-learning-app.ru."
  type    = "A"
  ttl     = 600
  data    = ["158.160.128.235"]
}

