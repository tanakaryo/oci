resource "oci_core_vcn" "vcn1" {
  cidr_block     = "10.0.0.0/16"
  dns_label      = "vcn1"
  compartment_id = data.oci_identity_availability_domains.ads.compartment_id
  display_name   = "vcn1"
}

resource "oci_core_subnet" "subnet1" {
  cidr_block     = "10.0.1.0/24"
  compartment_id = data.oci_identity_availability_domains.ads.compartment_id
  vcn_id         = oci_core_vcn.vcn1.id
  display_name   = "subnet1"
}