# Variable for multiple resource groups
variable "rg_var" {
  description = "Map of resource groups with their names and locations"
  type = map(object({
    name_rg = string   # Resource Group name
  }))
}
