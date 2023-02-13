terraform {
  required_version = ">= 0.12.26"

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

locals {
  root_dir         = coalesce(var.content_path_workbooks, "${path.module}/../../content/workbooks")
  workbook_content = file("${local.root_dir}/${var.name}.json")
  arm_script       = file("${path.module}/azuredeploy.json")

  parameters_override = merge({
    workbookType        = "sentinel",
    workbookSourceId    = var.workbook_source_id,
    workbookDisplayName = var.name,
    workbookContent     = local.workbook_content,
  })

  parameters_md5 = md5(jsonencode(local.parameters_override))
  template_md5   = md5(data.template_file.template.rendered)
}

data "template_file" "template" {
  # This function is needed as we added ignore_changes to parameters inside lifecycle, for reference see the link below.
  # https://github.com/quantum-sec/package-azure/blob/e33ccef7619dceea456d5e27bbb0246aca600085/modules/azure-arm-deployment/main.tf#L18-L23
  template = local.arm_script
  vars = {
    parameters_md5 = local.parameters_md5
  }
}

resource "null_resource" "parameters" {
  triggers = {
    md5          = local.parameters_md5
    template_md5 = local.template_md5
  }
}

module "sentinel_workbook" {
  source = "git::git@github.com:quantum-sec/package-azure.git//modules/azure-arm-deployment?ref=1.5.1"

  depends_on = [
    null_resource.parameters,
    data.template_file.template,
  ]

  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  arm_script          = data.template_file.template.rendered

  parameters_override = merge(
    local.parameters_override, {
      parameters_md5 = local.parameters_md5
  })
}
