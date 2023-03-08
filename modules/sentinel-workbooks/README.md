<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom_sentinel_workbooks"></a> [custom\_sentinel\_workbooks](#module\_custom\_sentinel\_workbooks) | ../sentinel-workbook | n/a |
| <a name="module_sentinel_workbooks"></a> [sentinel\_workbooks](#module\_sentinel\_workbooks) | ../sentinel-workbook | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_workbook_path"></a> [default\_workbook\_path](#input\_default\_workbook\_path) | The path of the default workbooks. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_workbook_source_id"></a> [workbook\_source\_id](#input\_workbook\_source\_id) | The resource id of log analytics workspace on which the workbook will be deployed. | `string` | n/a | yes |
| <a name="input_custom_workbook_path"></a> [custom\_workbook\_path](#input\_custom\_workbook\_path) | The path of the custom workbooks. | `string` | `""` | no |
| <a name="input_custom_workbooks"></a> [custom\_workbooks](#input\_custom\_workbooks) | A list of custom workbooks to be deployed from the custom-workbooks folder. | `set(string)` | `[]` | no |
| <a name="input_default_workbooks"></a> [default\_workbooks](#input\_default\_workbooks) | A list of default workbooks to be deployed. | `set(string)` | `[]` | no |
<!-- END_TF_DOCS -->
