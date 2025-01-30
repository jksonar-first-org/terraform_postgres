
# create role for database
resource "postgresql_role" "my_user" {
  name     = "jay"
  login    = true
  password = "jDR3SK@1s"
}

# grant access on database 
resource "postgresql_grant" "read_only_table" {
  database    = resource.postgresql_database.my_db.name
  role        = "test_role"
  object_type = "table"
  objects     = ["table1"]
  privileges  = ["select"]
}

# create new database
resource "postgresql_database" "my_db" {
  name                   = "change_name"
  owner                  = "postgres"
  connection_limit       = -1
  allow_connections      = true
  alter_object_ownership = true
}

# create new table in my_bd database



# data source already exist database 

# add table in already exit database 
