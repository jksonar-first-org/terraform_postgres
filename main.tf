
# create role for database
resource "postgresql_role" "my_user" {
  name     = var.Pg_role_name
  login    = true
  password = "jDR3SK@1s"
}

# create new database
resource "postgresql_database" "my_db" {
  name                   = var.Pg_database
  owner                  = var.Pg_username
  connection_limit       = -1
  allow_connections      = true
  alter_object_ownership = true
}

# grant access on database 
resource "postgresql_grant" "read_only_table" {
  database    = resource.postgresql_database.my_db.name
  role        = resource.postgresql_role.my_user.name
  object_type = "table"
  objects     = ["users_table"]
  privileges  = ["select"]
}

# template to create init.sql file 
resource "local_file" "init_sql" {
  filename = "${path.module}/init.sql"
  content  = templatefile("${path.module}/init.sql.tmpl", { table_name = var.Pg_table_name })
}

# create new table in my_bd database using template
resource "null_resource" "init_db" {
  depends_on = [local_file.init_sql]
  provisioner "local-exec" {
    command = "PGPASSWORD=${var.Pg_password} psql -h ${var.Pg_host} -U ${var.Pg_username} -d ${var.Pg_database} -f init.sql"
  }
}


# data source already exist database 

# add table in already exit database 
