# Variable for multiple resource groups
variable "rg" {
  description = "Map of resource groups with their names and locations"
  type = map(object({
    name_rg = string   # Resource Group name
  }))
}


variable "db" {
  type = map(any)
}
variable "acr" {
  type = map(any)
}
variable "k8s" {
  type = map(any)
}