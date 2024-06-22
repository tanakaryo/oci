resource "oci_core_instance" "vm1" {
  compartment_id      = data.oci_identity_availability_domains.ads.compartment_id
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[0], "name")
  shape               = "VM.Standard.E2.1.Micro"
  display_name        = "vm1"
  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }
  create_vnic_details {
    subnet_id = oci_core_subnet.subnet1.id
  }
  source_details {
    source_id   = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaamiyhq6rfjlg3lajgtr4kq5x6wcrrvdkbnpe4vsmdqgomzu7mziva"
    source_type = "image"
  }
}