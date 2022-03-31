terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir = coalesce(var.content_path_workbooks, "${path.module}/../../content/workbooks")
  files    = fileset("${local.root_dir}/", "*.json")
}

module "sentinel_workbooks" {
  source = "../sentinel-workbook"

  for_each = local.files

  content_path_workbooks = local.root_dir
  workbook_source_id     = var.workbook_source_id
  name                   = replace(basename(each.value), ".json", "")
  resource_group_name    = var.resource_group_name
}
