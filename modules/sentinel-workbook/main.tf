terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir         = coalesce(var.content_path_workbooks, "${path.module}/../../content/workbooks")
  workbook_content = file("${path.root_dir}/${var.name}.json")
}

module "sentinel_workbook" {
  source = "git::git@github.com:quantum-sec/package-azure.git//modules/azure-arm-deployment?ref=1.4.4"

  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  arm_script          = file("./azuredeploy.json")

  parameters_override = {
    workbookType        = "sentinel"
    workbookSourceId    = var.workbook_source_id
    workbookDisplayName = var.name
    workbookContent     = local.workbook_content # To be updated to the path of workbook content repo in future.
  }
}
