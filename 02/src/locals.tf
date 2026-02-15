locals {
  prefix_platform = "netology-develop-platform"
  prefix_web      = "web"
  prefix_db       = "db"
  vm_web_name    = "${local.prefix_platform}-${local.prefix_web}"
  vm_db_name     = "${local.prefix_platform}-${local.prefix_db}"
}