provider "grafana" {
  url  = "http://localhost:3000/"
  auth = var.grafana_auth
}