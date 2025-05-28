variable "api_key_file" {
  description = "Path to the API key file for Cisco MCD"
  type        = string
}


variable "address_objects" {
  description = "List of address objects to be created"
  type = list(object({
    name        = string
    description = string
    value       = string
  }))
}
