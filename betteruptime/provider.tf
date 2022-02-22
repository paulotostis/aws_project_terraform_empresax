terraform {
  required_providers {
    betteruptime = {
      source  = "Altinity/betteruptime"
      version = "0.1.1"
    }
  }
}

provider "betteruptime" {
  api_token = var.betteruptime_api_token
}

resource "betteruptime_monitor_group" "checks" {
  name = "empresax"
}
