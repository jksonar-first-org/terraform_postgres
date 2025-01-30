terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.25.0"
    }
  }
}

provider "postgresql" {
  host            = "172.16.1.171"
  port            = 5432
  database        = "postgres"
  username        = "postgres"
  password        = "Z4yw26ch"
  connect_timeout = 15
  sslmode         = "disable"
}
