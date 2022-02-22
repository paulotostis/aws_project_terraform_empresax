resource "betteruptime_monitor" "empresax" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://empresax.com/"
  required_keyword = "<title>empresax</title>"
}

resource "betteruptime_monitor" "empresax_access_control_list_https" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "tcp"

  pronounceable_name = "empresax Access Control List HTTPS"

  request_timeout     = 500
  check_frequency     = 60
  confirmation_period = 90
  ssl_expiration      = 7

  url  = "acl.empresax.com"
  port = "443"
}

resource "betteruptime_monitor" "empresax_access_control_list_http" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "tcp"

  pronounceable_name = "empresax Access Control List HTTP"

  request_timeout     = 500
  check_frequency     = 60
  confirmation_period = 90
  ssl_expiration      = 7

  url  = "acl.empresax.com"
  port = "80"
}

resource "betteruptime_monitor" "empresax_api" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax API"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://api.empresax.com/health/"
  required_keyword = jsonencode({ "status" : "ok" })
}

resource "betteruptime_monitor" "empresax_checkin_api" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Check-In API"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://checkin.empresax.com/health/"
  required_keyword = jsonencode({ "status" : "ok" })
}

resource "betteruptime_monitor" "empresax_coupon_api" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Coupon API"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://coupon.empresax.com/health/"
  required_keyword = jsonencode({ "data" : { "status" : true } })
}

resource "betteruptime_monitor" "empresax_gateway_api" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Gateway API"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://gateway.empresax.com/health/"
  required_keyword = jsonencode({ "status" : "ok" })
}

resource "betteruptime_monitor" "empresax_konga" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Konga"

  request_timeout     = 5
  check_frequency     = 60
  confirmation_period = 90
  ssl_expiration      = 7

  url              = "https://konga.empresax.com/"
  required_keyword = "<title>Konga</title>"
}

resource "betteruptime_monitor" "empresax_metabase" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Metabase"

  request_timeout     = 5
  check_frequency     = 60
  confirmation_period = 90
  ssl_expiration      = 7

  url              = "https://metabase.empresax.com/"
  required_keyword = "<title>Metabase</title>"
}

resource "betteruptime_monitor" "empresax_www" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax WWW"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://www.empresax.com/"
  required_keyword = "<title>empresax</title>"
}

resource "betteruptime_monitor" "empresax_auth" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Auth"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://auth.empresax.com/"
  required_keyword = "<title>empresax Authenticator</title>"
}

resource "betteruptime_monitor" "empresax_backoffice" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Backoffice"

  request_timeout     = 5
  check_frequency     = 60
  confirmation_period = 90
  ssl_expiration      = 7

  url              = "https://backoffice.empresax.com/"
  required_keyword = "<title>Backoffice</title>"
}

resource "betteruptime_monitor" "empresax_backstage" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Backstage"

  request_timeout     = 5
  check_frequency     = 60
  confirmation_period = 90
  ssl_expiration      = 7

  url              = "https://backstage.empresax.com/"
  required_keyword = "<title>Backstage</title>"
}

resource "betteruptime_monitor" "empresax_embedstore" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Embed Store"

  request_timeout     = 5
  check_frequency     = 60
  confirmation_period = 90
  ssl_expiration      = 7

  url              = "https://embedstore.empresax.com/"
  required_keyword = "<title>Compra Embarcada empresax</title>"
}

resource "betteruptime_monitor" "empresax_team" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Team"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://equipe.empresax.com/"
  required_keyword = "<title>empresax</title>"
}

resource "betteruptime_monitor" "empresax_finance_https" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "tcp"

  pronounceable_name = "empresax Finance API HTTPS"

  request_timeout     = 500
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url  = "finance.empresax.com"
  port = "443"
}

resource "betteruptime_monitor" "empresax_live" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax Live"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://live.empresax.com/"
  required_keyword = "<title>empresax Live</title>"
}

resource "betteruptime_monitor" "empresax_rabbitmq_ui" {
  monitor_group_id = betteruptime_monitor_group.checks.id
  monitor_type     = "keyword"

  pronounceable_name = "empresax RabbitMQ UI"

  request_timeout     = 5
  check_frequency     = 30
  confirmation_period = 60
  ssl_expiration      = 7

  url              = "https://rabbitmq-ui.empresax.com/"
  required_keyword = "<title>RabbitMQ Management</title>"
}
