terraform {
  required_version = ">= 0.12.26"
}

locals {
  # deploy default workbooks
  #path_to_default_workbooks = "${path.module}/../../content/workbooks"
  path_to_default_workbooks = "./../content/workbooks"
}

# Deploy default workbooks
module "sentinel_workbooks" {
  source = "../sentinel-workbook"

  for_each = var.default_workbooks

  content_path_workbooks = local.path_to_default_workbooks
  workbook_source_id     = var.workbook_source_id
  name                   = replace(basename(each.value), ".json", "")
  resource_group_name    = var.resource_group_name
}

# Deploy custom workbooks
module "custom_sentinel_workbooks" {
  source = "../sentinel-workbook"

  for_each = var.custom_workbooks

  content_path_workbooks = var.custom_workbook_path
  workbook_source_id     = var.workbook_source_id
  name                   = replace(basename(each.value), ".json", "")
  resource_group_name    = var.resource_group_name
}
