resource "oci_core_subnet" "paulopierrondiWebSubnet" {
  cidr_block = "10.0.1.0/24"
  display_name = "paulopierrondiWebSubnet"
  dns_label = "fkN1"
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_virtual_network.paulopierrondiVCN.id
  route_table_id = oci_core_route_table.paulopierrondiRouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.paulopierrondiDhcpOptions1.id
}


