module "RG" {
  source = "../../Modules/Resource-Group"
  rg_var    = var.rg
}

module "mqdb" {
  source = "../../Modules/MSQL"
  msql_var = var.db
  depends_on = [ module.RG ]
}



module "ACR" {
  source = "../../Modules/ACR"
  acr   = var.acr
  depends_on = [ module.mqdb ]
}

module "K8S" {
  source = "../../Modules/AKS_Cluster"
  k8s_var   = var.k8s
  depends_on = [ module.ACR ]
}

