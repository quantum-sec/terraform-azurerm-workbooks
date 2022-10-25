terraform {
  required_version = ">= 0.12.26"
}

locals {
  # deploy default workbooks
  path_to_default_workbooks = "${path.module}/../../content/workbooks"
  default_workbook_files    = fileset("${local.path_to_default_workbooks}/", "*.json")

  # Conditionally deploy custom workbooks
  path_to_custom_workbooks = var.content_path_workbooks != "" ? var.content_path_workbooks : null
  custom_workbook_files    = var.content_path_workbooks != "" ? fileset("${local.path_to_custom_workbooks}/", "*.json") : toset([])

}

# Deploy default workbooks
module "sentinel_workbooks" {
  source = "../sentinel-workbook"

  for_each = local.default_workbook_files

  content_path_workbooks = local.path_to_default_workbooks
  workbook_source_id     = var.workbook_source_id
  name                   = replace(basename(each.value), ".json", "")
  resource_group_name    = var.resource_group_name
}

# Deploy custom workbooks
module "custom_sentinel_workbooks" {
  source = "../sentinel-workbook"

  for_each = local.custom_workbook_files

  content_path_workbooks = local.path_to_custom_workbooks
  workbook_source_id     = var.workbook_source_id
  name                   = replace(basename(each.value), ".json", "")
  resource_group_name    = var.resource_group_name
}
