variable "Pg_host" {
  default     = "172.16.1.171"
  description = "IP Address of postgresql server"
  type        = string
}

variable "Pg_username" {
  default     = "postgres"
  description = "Username of postgres server"
  type        = string
}

variable "Pg_port" {
  default     = 5432
  description = "Port of database"
  type        = number
}

variable "Pg_password" {
  sensitive   = true
  default     = "Z4yw26ch"
  description = "Database password"
  type        = string
}

variable "Pg_conn_database" {
  default     = "postgres"
  description = "Database name"
  type        = string
}

variable "Pg_database" {
  default     = "terraform_db"
  description = "Create new database"
  type        = string
}

variable "Pg_SSLmode" {
  default     = "disable"
  description = "SSL connection of postgres"
  type        = string
}

variable "Pg_role_name" {
  default     = "jay"
  description = "Create new role to take access of database"
  type        = string
}

variable "Pg_role_passwd" {
  sensitive   = true
  default     = "jDR3SK@1s"
  description = "Create new passwd for role"
  type        = string
}

variable "Pg_table_name" {
  default     = "users_table"
  description = "Create new table"
  type        = string
}