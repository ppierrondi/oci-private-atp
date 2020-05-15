resource "oci_database_autonomous_database" "paulopierrondiATPdatabase" {
  admin_password           = var.atp_password
  compartment_id           = var.compartment_ocid
  cpu_core_count           = var.paulopierrondi_ATP_database_cpu_core_count
  data_storage_size_in_tbs = var.paulopierrondi_ATP_database_data_storage_size_in_tbs
  db_name                  = var.paulopierrondi_ATP_database_db_name
  display_name             = var.paulopierrondi_ATP_database_display_name
  freeform_tags            = var.paulopierrondi_ATP_database_freeform_tags
  license_model            = var.paulopierrondi_ATP_database_license_model
  nsg_ids                  = [oci_core_network_security_group.paulopierrondiATPSecurityGroup.id]   
  private_endpoint_label   = var.paulopierrondi_ATP_database_atp_private_endpoint_label
  subnet_id                = oci_core_subnet.paulopierrondiATPEndpointSubnet.id      
}

data "oci_database_autonomous_databases" "paulopierrondiATPdatabases" {
  compartment_id = var.compartment_ocid
  display_name = var.paulopierrondi_ATP_database_display_name
}

output "paulopierrondi_ATP_database_admin_password" {
   value = var.atp_password
}

output "paulopierrondi_ATP_databases" {
  value = data.oci_database_autonomous_databases.paulopierrondiATPdatabases.autonomous_databases
}

output "parallel_connection_string" {
  value = [lookup(oci_database_autonomous_database.paulopierrondiATPdatabase.connection_strings.0.all_connection_strings, "PARALLEL", "Unavailable")]
}
