# ---------------------------------------------------------------------------------------------------------------------
# MODULE VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "workbook_source_id" {
  description = "The resource id of log analytics workspace on which the workbook will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "default_workbooks" {
  type        = set(string)
  default     = []
  description = "A list of default workbooks to be deployed."
}

variable "custom_workbooks" {
  type        = set(string)
  default     = []
  description = "A list of custom workbooks to be deployed from the custom-workbooks folder."
}

variable "custom_workbook_path" {
  description = "The path of the custom workbooks."
  type        = string
  default     = ""
}

variable "default_workbook_path" {
  description = "The path of the default workbooks."
  type        = string
}
