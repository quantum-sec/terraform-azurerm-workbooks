# ---------------------------------------------------------------------------------------------------------------------
# MODULE VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "workbook_source_id" {
  description = "The resource id of log analytics workspace on which the workbook will be deployed."
  type        = string
}

variable "content_path_workbooks" {
  description = <<-EOT
  The path to the workbooks directory.
  Default empty value will used pre-packaged workbooks.
  If you have packs in /opt/xdr/content/workbooks then you may want to provide a value of "/opt/xdr/content/workbooks"
  EOT
  type        = string
  default     = ""
}
