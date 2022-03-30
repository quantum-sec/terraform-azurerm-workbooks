output "id" {
  description = "The unique identifier of the ARM template deployment."
  value       = module.azure_workbook.id
}

output "output_content" {
  description = "The JSON content of the outputs of the ARM template deployment."
  value       = module.azure_workbook.output_content
}
