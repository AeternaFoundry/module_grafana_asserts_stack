output "asserts_stacks_id" {
  description = "Map of id values across all asserts_stacks, keyed the same as var.asserts_stacks except keys with no id are omitted"
  value       = { for k, v in grafana_asserts_stack.asserts_stacks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "asserts_stacks_cloud_access_policy_token" {
  description = "Map of cloud_access_policy_token values across all asserts_stacks, keyed the same as var.asserts_stacks except keys with no cloud_access_policy_token are omitted"
  value       = { for k, v in grafana_asserts_stack.asserts_stacks : k => v.cloud_access_policy_token if v.cloud_access_policy_token != null && length(v.cloud_access_policy_token) > 0 }
  sensitive   = true
}
output "asserts_stacks_dataset" {
  description = "Map of dataset values across all asserts_stacks, keyed the same as var.asserts_stacks except keys with no dataset are omitted"
  value       = { for k, v in grafana_asserts_stack.asserts_stacks : k => v.dataset if v.dataset != null && length(v.dataset) > 0 }
}
output "asserts_stacks_enabled" {
  description = "Map of enabled values across all asserts_stacks, keyed the same as var.asserts_stacks except keys with no enabled are omitted"
  value       = { for k, v in grafana_asserts_stack.asserts_stacks : k => v.enabled if v.enabled != null }
}
output "asserts_stacks_grafana_token" {
  description = "Map of grafana_token values across all asserts_stacks, keyed the same as var.asserts_stacks except keys with no grafana_token are omitted"
  value       = { for k, v in grafana_asserts_stack.asserts_stacks : k => v.grafana_token if v.grafana_token != null && length(v.grafana_token) > 0 }
  sensitive   = true
}
output "asserts_stacks_status" {
  description = "Map of status values across all asserts_stacks, keyed the same as var.asserts_stacks except keys with no status are omitted"
  value       = { for k, v in grafana_asserts_stack.asserts_stacks : k => v.status if v.status != null && length(v.status) > 0 }
}
output "asserts_stacks_version" {
  description = "Map of version values across all asserts_stacks, keyed the same as var.asserts_stacks except keys with no version are omitted"
  value       = { for k, v in grafana_asserts_stack.asserts_stacks : k => v.version if v.version != null }
}

