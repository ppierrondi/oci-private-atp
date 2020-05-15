# Rules related to paulopierrondiATPSecurityGroup

# EGRESS

resource "oci_core_network_security_group_security_rule" "paulopierrondiATPSecurityEgressGroupRule" {
    network_security_group_id = oci_core_network_security_group.paulopierrondiATPSecurityGroup.id
    direction = "EGRESS"
    protocol = "6"
    destination = var.VCN-CIDR
    destination_type = "CIDR_BLOCK"
}

# INGRESS

resource "oci_core_network_security_group_security_rule" "paulopierrondiATPSecurityIngressGroupRules" {
    network_security_group_id = oci_core_network_security_group.paulopierrondiATPSecurityGroup.id
    direction = "INGRESS"
    protocol = "6"
    source = var.VCN-CIDR
    source_type = "CIDR_BLOCK"
    tcp_options {
        destination_port_range {
            max = 1522
            min = 1522
        }
    }
}

# Rules related to paulopierrondiWebSecurityGroup

# EGRESS

resource "oci_core_network_security_group_security_rule" "paulopierrondiWebSecurityEgressATPGroupRule" {
    network_security_group_id = oci_core_network_security_group.paulopierrondiWebSecurityGroup.id
    direction = "EGRESS"
    protocol = "6"
    destination = oci_core_network_security_group.paulopierrondiATPSecurityGroup.id 
    destination_type = "NETWORK_SECURITY_GROUP"
}

resource "oci_core_network_security_group_security_rule" "paulopierrondiWebSecurityEgressInternetGroupRule" {
    network_security_group_id = oci_core_network_security_group.paulopierrondiWebSecurityGroup.id
    direction = "EGRESS"
    protocol = "6"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
}

# INGRESS

resource "oci_core_network_security_group_security_rule" "paulopierrondiWebSecurityIngressGroupRules" {
    for_each = toset(var.httpx_ports)

    network_security_group_id = oci_core_network_security_group.paulopierrondiWebSecurityGroup.id
    direction = "INGRESS"
    protocol = "6"
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    tcp_options {
        destination_port_range {
            max = each.value
            min = each.value
        }
    }
}

# Rules related to paulopierrondiSSHSecurityGroup

# EGRESS

resource "oci_core_network_security_group_security_rule" "paulopierrondiSSHSecurityEgressGroupRule" {
    network_security_group_id = oci_core_network_security_group.paulopierrondiSSHSecurityGroup.id
    direction = "EGRESS"
    protocol = "6"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
}

# INGRESS

resource "oci_core_network_security_group_security_rule" "paulopierrondiSSHSecurityIngressGroupRules" {
    network_security_group_id = oci_core_network_security_group.paulopierrondiSSHSecurityGroup.id
    direction = "INGRESS"
    protocol = "6"
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    tcp_options {
        destination_port_range {
            max = 22
            min = 22
        }
    }
}

