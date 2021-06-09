output "windows_app_startup_script" {
  value       = var.app ? data.template_file.app_startup_script.rendered : ""
  description = "startup script when instance boots"
}

output "database_startup_script" {
  value       = var.database ? data.template_file.database_startup_script.rendered : ""
  description = "startup script when instance boots"
}

output "web_startup_script" {
  value       = var.web ? data.template_file.web_startup_script.rendered : ""
  description = "startup script when instance boots"
}
