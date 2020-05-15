resource "oci_core_nat_gateway" "paulopierrondiNATGateway" {
    compartment_id = var.compartment_ocid
    display_name = "paulopierrondiNATGateway"
    vcn_id = oci_core_virtual_network.paulopierrondiVCN.id
}
