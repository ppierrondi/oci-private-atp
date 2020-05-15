resource "oci_core_virtual_network" "paulopierrondiVCN" {
  cidr_block = var.VCN-CIDR
  dns_label = "ppVCN"
  compartment_id = var.compartment_ocid
  display_name = "paulopierrondiVCN"
}
