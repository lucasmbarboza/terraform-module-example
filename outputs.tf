output "address_full_map" {
  value = {
    for obj in ciscomcd_address_object.address :
    obj.name => {
      description = obj.description
      id          = obj.id
      ip_address  = obj.value
    }
  }
}

output "address_full_map_csv" {
  value = join("\n", [
    "name,description,id,ip_address,created_at", # Cabeçalho do CSV
    for obj in ciscomcd_address_object.address : join(",", [
      obj.name,
      obj.description,
      obj.id,
      join(";", tolist(obj.value)), # Une IPs (se houver mais de um) com ";"
      timestamp() # Data/hora de criação do output
    ])
  ])
}