variable "Pg_host" {
  default     = "172.16.1.171"
  description = "IP Address of postgresql server"
}

variable "Pg_username" {
  default     = "postgres"
  description = "Username of postgres server"
}

variable "Pg_port" {
  default     = 5432
  description = "Port of database"
}

variable "Pg_password" {
  default     = "Z4yw26ch"
  description = "database password"
}

variable "Pg_conn_database" {
  default     = "postgres"
  description = "database name"
}

variable "Pg_database" {
  default     = "terraform_db"
  description = "create new database"
}

variable "Pg_SSLmode" {
  default     = "disable"
  description = "SSL connection of postgres"
}

variable "Pg_role_name" {
  default     = "jay"
  description = "create new role to take access of database"
}

variable "Pg_table_name" {
  default     = "users_table"
  description = "create new table"
}