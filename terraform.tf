terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.25.0"
    }
  }
}

provider "postgresql" {
  host            = var.Pg_host
  port            = var.Pg_port
  database        = var.Pg_conn_database
  username        = var.Pg_username
  password        = var.Pg_password
  connect_timeout = 15
  sslmode         = var.Pg_SSLmode
}
