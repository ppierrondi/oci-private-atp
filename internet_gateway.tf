resource "oci_core_internet_gateway" "paulopierrondiInternetGateway" {
    compartment_id = var.compartment_ocid
    display_name = "paulopierrondiInternetGateway"
    vcn_id = oci_core_virtual_network.paulopierrondiVCN.id
}
