
# create role for database
resource "postgresql_role" "my_user" {
  name     = var.Pg_role_name
  login    = true
  password = var.Pg_role_passwd
}

# create new database
resource "postgresql_database" "my_db" {
  depends_on             = [postgresql_role.my_user]
  name                   = var.Pg_database
  owner                  = var.Pg_role_name
  connection_limit       = -1
  allow_connections      = true
  alter_object_ownership = true
}

# grant access on database 
resource "postgresql_grant" "read_only_table" {
  depends_on  = [null_resource.init_db]
  database    = var.Pg_database
  role        = var.Pg_role_name
  object_type = "table"
  schema      = "public"
  objects     = ["users_table"]
  privileges  = ["ALL"]
}

# template to create init.sql file 
resource "local_file" "init_sql" {
  filename = "${path.module}/init.sql"
  content  = templatefile("${path.module}/init.sql.tmpl", { table_name = var.Pg_table_name })
}

# create new table in my_bd database using template
resource "null_resource" "init_db" {
  depends_on = [local_file.init_sql, postgresql_database.my_db]

  provisioner "local-exec" {
    command = "psql -h ${var.Pg_host} -p ${var.Pg_port} -U ${var.Pg_username} -d ${var.Pg_database} --file init.sql"
    environment = {
      PGPASSWORD = var.Pg_password
    }
  }
}


# read table from database 
data "postgresql_tables" "list_my_tables" {
  depends_on = [resource.postgresql_database.my_db]
  database   = var.Pg_database
}
