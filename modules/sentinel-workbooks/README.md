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
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_workbook_source_id"></a> [workbook\_source\_id](#input\_workbook\_source\_id) | The resource id of log analytics workspace on which the workbook will be deployed. | `string` | n/a | yes |
| <a name="input_content_path_workbooks"></a> [content\_path\_workbooks](#input\_content\_path\_workbooks) | The path to the workbooks directory.<br>Default empty value will used pre-packaged workbooks.<br>If you have packs in /opt/xdr/content/workbooks then you may want to provide a value of "/opt/xdr/content/workbooks" | `string` | `""` | no |
<!-- END_TF_DOCS -->
