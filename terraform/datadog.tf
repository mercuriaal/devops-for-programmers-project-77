resource "datadog_monitor" "ping_monitoring" {
  name               = "Ping service"
  type               = "service check"
  message            = "App is not responding"

  query = "\"http.can_connect\".over(\"instance:check_service\").by(\"*\").last(2).count_by_status()"

  monitor_thresholds {
    ok = 2
    warning  = 2
  }

}