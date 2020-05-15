resource "oci_core_dhcp_options" "paulopierrondiDhcpOptions1" {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_virtual_network.paulopierrondiVCN.id
  display_name = "paulopierrondiDHCPOptions1"

  // required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  // optional
  options {
    type = "SearchDomain"
    search_domain_names = [ "paulopierrondi.com" ]
  }
}
