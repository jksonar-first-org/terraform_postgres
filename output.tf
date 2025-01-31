output "print_db_name" {
  value = resource.postgresql_database.my_db.name
}

output "read_database" {
  value = data.postgresql_tables.list_my_tables.tables
}