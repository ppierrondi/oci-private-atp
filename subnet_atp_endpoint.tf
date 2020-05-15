resource "oci_core_subnet" "paulopierrondiATPEndpointSubnet" {
  cidr_block = "10.0.2.0/24"
  display_name = "paulopierrondiATPEndpointSubnet"
  dns_label = "fkN2"
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_virtual_network.paulopierrondiVCN.id
  route_table_id = oci_core_route_table.paulopierrondiRouteTableViaNAT.id
  dhcp_options_id = oci_core_dhcp_options.paulopierrondiDhcpOptions1.id
}


