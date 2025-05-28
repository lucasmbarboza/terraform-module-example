output "address_full_map" {
  value = {
    for obj in ciscomcd_address_object.address :
    obj.name => {
      description = obj.description
      id          = obj.id
      ip_address  = obj.ip_address
    }
  }
}
