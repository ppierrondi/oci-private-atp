# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

# Gets the Id of a specific OS Images
data "oci_core_images" "OSImageLocal" {
  #Required
  compartment_id = var.compartment_ocid
  display_name   = var.OsImage
}

resource "oci_core_instance" "paulopierrondiWebserver1" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[2], "name")
  compartment_id      = var.compartment_ocid
  display_name        = "paulopierrondiWebServer1"
  shape               = var.Shapes[0]
  subnet_id           = oci_core_subnet.paulopierrondiWebSubnet.id
  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.OSImageLocal.images[0], "id")
  }
 metadata = {
    ssh_authorized_keys = "${var.ssh_public_key}"
    # user_data           = "${base64encode(data.template_file.client.rendered)}"
  }
  create_vnic_details {
    subnet_id = oci_core_subnet.paulopierrondiWebSubnet.id
    nsg_ids   = [oci_core_network_security_group.paulopierrondiWebSecurityGroup.id, oci_core_network_security_group.paulopierrondiSSHSecurityGroup.id]
  }
}

data "oci_core_vnic_attachments" "paulopierrondiWebserver1_VNIC1_attach" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[2], "name")
  compartment_id      = var.compartment_ocid
  instance_id         = oci_core_instance.paulopierrondiWebserver1.id
}

data "oci_core_vnic" "paulopierrondiWebserver1_VNIC1" {
  vnic_id = data.oci_core_vnic_attachments.paulopierrondiWebserver1_VNIC1_attach.vnic_attachments.0.vnic_id
}

output "paulopierrondiWebserver1_PublicIP" {
  value = [data.oci_core_vnic.paulopierrondiWebserver1_VNIC1.public_ip_address]
}
