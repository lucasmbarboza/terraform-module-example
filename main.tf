terraform {
  required_providers {
    ciscomcd = {
      source  = "CiscoDevNet/ciscomcd"
      version = "0.2.9"
    }
  }
}
provider "ciscomcd" {
  api_key_file = file(var.api_key_file)
}
resource "ciscomcd_address_object" "address" {
  for_each    = { for obj in var.address_objects : obj.name => obj }
  name        = each.value.name
  description = each.value.description
  type        = "STATIC"
  value       = [each.value.value]
}
