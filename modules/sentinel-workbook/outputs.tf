output "id" {
  description = "The unique identifier of the ARM template deployment."
  value       = module.sentinel_workbook.id
}

output "output_content" {
  description = "The JSON content of the outputs of the ARM template deployment."
  value       = module.sentinel_workbook.output_content
}
