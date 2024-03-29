terraform {
  required_version = ">= 1.2"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.1"
    }

    template = {
      source  = "hashicorp/template"
      version = "~> 2.2.0"
    }
  }
}

# Deploy default workbooks
module "sentinel_workbooks" {
  source = "../sentinel-workbook"

  for_each = var.default_workbooks

  content_path_workbooks = var.default_workbook_path
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
