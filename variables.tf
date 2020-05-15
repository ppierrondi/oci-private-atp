variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
variable "private_key_oci" {}
variable "public_key_oci" {}
variable "atp_password" {}

variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCNname" {
  default = "paulopierrondiVCN"
}

variable "Shapes" {
  default = ["VM.Standard.E2.1", "VM.Standard.E2.1.Micro", "VM.Standard2.1", "VM.Standard.E2.1", "VM.Standard.E2.2"]
}

variable "OsImage" {
  # Oracle-Linux-7.7-2020.02.21-0 in Frankfurt
  default = "Oracle-Linux-7.7-2020.02.21-0"
}

variable "httpx_ports" {
  default = ["80", "443"]
}

variable "paulopierrondi_ATP_database_cpu_core_count" {
  default = 1
}

variable "paulopierrondi_ATP_database_data_storage_size_in_tbs" {
  default = 1
}

variable "paulopierrondi_ATP_database_db_name" {
  default = "fkatpdb1"
}

variable "paulopierrondi_ATP_database_defined_tags_value" {
  default = "value"
}

variable "paulopierrondi_ATP_database_display_name" {
  default = "paulopierrondiATP"
}

variable "paulopierrondi_ATP_database_freeform_tags" {
  default = {
    "Owner" = "paulopierrondi"
  }
}

variable "paulopierrondi_ATP_database_license_model" {
  default = "LICENSE_INCLUDED"
}

variable "paulopierrondi_ATP_tde_wallet_zip_file" {
  default = "tde_wallet_fkatpdb1.zip"
}

variable "paulopierrondi_ATP_database_atp_private_endpoint_label" {
  default = "paulopierrondiATPPrivateEndpoint"
}

variable "ssh_public_key" {
}

variable "ssh_private_key"{}