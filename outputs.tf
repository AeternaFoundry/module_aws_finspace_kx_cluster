output "finspace_kx_clusters_id" {
  description = "Map of id values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "finspace_kx_clusters_arn" {
  description = "Map of arn values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "finspace_kx_clusters_auto_scaling_configuration" {
  description = "Map of auto_scaling_configuration values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => one(v.auto_scaling_configuration) if v.auto_scaling_configuration != null && length(v.auto_scaling_configuration) > 0 }
}
output "finspace_kx_clusters_availability_zone_id" {
  description = "Map of availability_zone_id values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.availability_zone_id if v.availability_zone_id != null && length(v.availability_zone_id) > 0 }
}
output "finspace_kx_clusters_az_mode" {
  description = "Map of az_mode values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.az_mode if v.az_mode != null && length(v.az_mode) > 0 }
}
output "finspace_kx_clusters_cache_storage_configurations" {
  description = "Map of cache_storage_configurations values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.cache_storage_configurations if v.cache_storage_configurations != null && length(v.cache_storage_configurations) > 0 }
}
output "finspace_kx_clusters_capacity_configuration" {
  description = "Map of capacity_configuration values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => one(v.capacity_configuration) if v.capacity_configuration != null && length(v.capacity_configuration) > 0 }
}
output "finspace_kx_clusters_code" {
  description = "Map of code values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => one(v.code) if v.code != null && length(v.code) > 0 }
}
output "finspace_kx_clusters_command_line_arguments" {
  description = "Map of command_line_arguments values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.command_line_arguments if v.command_line_arguments != null && length(v.command_line_arguments) > 0 }
}
output "finspace_kx_clusters_created_timestamp" {
  description = "Map of created_timestamp values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.created_timestamp if v.created_timestamp != null && length(v.created_timestamp) > 0 }
}
output "finspace_kx_clusters_database" {
  description = "Map of database values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.database if v.database != null && length(v.database) > 0 }
}
output "finspace_kx_clusters_description" {
  description = "Map of description values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.description if v.description != null && length(v.description) > 0 }
}
output "finspace_kx_clusters_environment_id" {
  description = "Map of environment_id values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.environment_id if v.environment_id != null && length(v.environment_id) > 0 }
}
output "finspace_kx_clusters_execution_role" {
  description = "Map of execution_role values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.execution_role if v.execution_role != null && length(v.execution_role) > 0 }
}
output "finspace_kx_clusters_initialization_script" {
  description = "Map of initialization_script values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.initialization_script if v.initialization_script != null && length(v.initialization_script) > 0 }
}
output "finspace_kx_clusters_last_modified_timestamp" {
  description = "Map of last_modified_timestamp values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.last_modified_timestamp if v.last_modified_timestamp != null && length(v.last_modified_timestamp) > 0 }
}
output "finspace_kx_clusters_name" {
  description = "Map of name values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "finspace_kx_clusters_region" {
  description = "Map of region values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.region if v.region != null && length(v.region) > 0 }
}
output "finspace_kx_clusters_release_label" {
  description = "Map of release_label values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.release_label if v.release_label != null && length(v.release_label) > 0 }
}
output "finspace_kx_clusters_savedown_storage_configuration" {
  description = "Map of savedown_storage_configuration values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => one(v.savedown_storage_configuration) if v.savedown_storage_configuration != null && length(v.savedown_storage_configuration) > 0 }
}
output "finspace_kx_clusters_scaling_group_configuration" {
  description = "Map of scaling_group_configuration values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => one(v.scaling_group_configuration) if v.scaling_group_configuration != null && length(v.scaling_group_configuration) > 0 }
}
output "finspace_kx_clusters_status" {
  description = "Map of status values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.status if v.status != null && length(v.status) > 0 }
}
output "finspace_kx_clusters_status_reason" {
  description = "Map of status_reason values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.status_reason if v.status_reason != null && length(v.status_reason) > 0 }
}
output "finspace_kx_clusters_tags" {
  description = "Map of tags values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "finspace_kx_clusters_tags_all" {
  description = "Map of tags_all values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "finspace_kx_clusters_tickerplant_log_configuration" {
  description = "Map of tickerplant_log_configuration values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.tickerplant_log_configuration if v.tickerplant_log_configuration != null && length(v.tickerplant_log_configuration) > 0 }
}
output "finspace_kx_clusters_type" {
  description = "Map of type values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => v.type if v.type != null && length(v.type) > 0 }
}
output "finspace_kx_clusters_vpc_configuration" {
  description = "Map of vpc_configuration values across all finspace_kx_clusters, keyed the same as var.finspace_kx_clusters"
  value       = { for k, v in aws_finspace_kx_cluster.finspace_kx_clusters : k => one(v.vpc_configuration) if v.vpc_configuration != null && length(v.vpc_configuration) > 0 }
}

