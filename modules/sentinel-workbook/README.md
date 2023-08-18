<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.1 |
| <a name="requirement_template"></a> [template](#requirement\_template) | ~> 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | ~> 3.2.1 |
| <a name="provider_template"></a> [template](#provider\_template) | ~> 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sentinel_workbook"></a> [sentinel\_workbook](#module\_sentinel\_workbook) | git::git@github.com:quantum-sec/package-azure.git//modules/azure-arm-deployment | 1.5.1 |

## Resources

| Name | Type |
|------|------|
| [null_resource.parameters](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [template_file.template](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_workbook_source_id"></a> [workbook\_source\_id](#input\_workbook\_source\_id) | The resource id of log analytics workspace on which the workbook will be deployed. | `string` | n/a | yes |
| <a name="input_content_path_workbooks"></a> [content\_path\_workbooks](#input\_content\_path\_workbooks) | The path to the workbooks directory.<br>Default empty value will used pre-packaged workbooks.<br>If you have packs in /opt/xdr/content/workbooks then you may want to provide a value of "/opt/xdr/content/workbooks" | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the workbook that will be deployed in Microsoft Sentinel. | `string` | `"Quantum-Workbook"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the ARM template deployment. |
| <a name="output_output_content"></a> [output\_content](#output\_output\_content) | The JSON content of the outputs of the ARM template deployment. |
<!-- END_TF_DOCS -->
