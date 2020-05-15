resource "oci_core_network_security_group" "paulopierrondiWebSecurityGroup" {
    compartment_id = var.compartment_ocid
    display_name = "paulopierrondiWebSecurityGroup"
    vcn_id = oci_core_virtual_network.paulopierrondiVCN.id
}

resource "oci_core_network_security_group" "paulopierrondiSSHSecurityGroup" {
    compartment_id = var.compartment_ocid
    display_name = "paulopierrondiSSHSecurityGroup"
    vcn_id = oci_core_virtual_network.paulopierrondiVCN.id
}

resource "oci_core_network_security_group" "paulopierrondiATPSecurityGroup" {
    compartment_id = var.compartment_ocid
    display_name = "paulopierrondiATPSecurityGroup"
    vcn_id = oci_core_virtual_network.paulopierrondiVCN.id
}