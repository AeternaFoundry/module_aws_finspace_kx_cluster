variable "finspace_kx_clusters" {
  description = <<EOT
Map of finspace_kx_clusters, attributes below
Required:
    - az_mode
    - environment_id
    - name
    - release_label
    - type
    - vpc_configuration (block):
        - ip_address_type (required)
        - security_group_ids (required)
        - subnet_ids (required)
        - vpc_id (required)
Optional:
    - availability_zone_id
    - command_line_arguments
    - description
    - execution_role
    - initialization_script
    - region
    - tags
    - tags_all
    - auto_scaling_configuration (block):
        - auto_scaling_metric (required)
        - max_node_count (required)
        - metric_target (required)
        - min_node_count (required)
        - scale_in_cooldown_seconds (required)
        - scale_out_cooldown_seconds (required)
    - cache_storage_configurations (block):
        - size (required)
        - type (required)
    - capacity_configuration (block):
        - node_count (required)
        - node_type (required)
    - code (block):
        - s3_bucket (required)
        - s3_key (required)
        - s3_object_version (optional)
    - database (block):
        - cache_configurations (optional, block):
            - cache_type (required)
            - db_paths (optional)
        - changeset_id (optional)
        - database_name (required)
        - dataview_name (optional)
    - savedown_storage_configuration (block):
        - size (optional)
        - type (optional)
        - volume_name (optional)
    - scaling_group_configuration (block):
        - cpu (optional)
        - memory_limit (optional)
        - memory_reservation (required)
        - node_count (required)
        - scaling_group_name (required)
    - tickerplant_log_configuration (block):
        - tickerplant_log_volumes (required)
EOT

  type = map(object({
    az_mode                = string
    environment_id         = string
    name                   = string
    release_label          = string
    type                   = string
    availability_zone_id   = optional(string)
    command_line_arguments = optional(map(string))
    description            = optional(string)
    execution_role         = optional(string)
    initialization_script  = optional(string)
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    vpc_configuration = object({
      ip_address_type    = string
      security_group_ids = set(string)
      subnet_ids         = set(string)
      vpc_id             = string
    })
    auto_scaling_configuration = optional(object({
      auto_scaling_metric        = string
      max_node_count             = number
      metric_target              = number
      min_node_count             = number
      scale_in_cooldown_seconds  = number
      scale_out_cooldown_seconds = number
    }))
    cache_storage_configurations = optional(list(object({
      size = number
      type = string
    })))
    capacity_configuration = optional(object({
      node_count = number
      node_type  = string
    }))
    code = optional(object({
      s3_bucket         = string
      s3_key            = string
      s3_object_version = optional(string)
    }))
    database = optional(list(object({
      cache_configurations = optional(list(object({
        cache_type = string
        db_paths   = optional(set(string))
      })))
      changeset_id  = optional(string)
      database_name = string
      dataview_name = optional(string)
    })))
    savedown_storage_configuration = optional(object({
      size        = optional(number)
      type        = optional(string)
      volume_name = optional(string)
    }))
    scaling_group_configuration = optional(object({
      cpu                = optional(number)
      memory_limit       = optional(number)
      memory_reservation = number
      node_count         = number
      scaling_group_name = string
    }))
    tickerplant_log_configuration = optional(list(object({
      tickerplant_log_volumes = set(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.auto_scaling_configuration == null || (v.auto_scaling_configuration.max_node_count >= 1 && v.auto_scaling_configuration.max_node_count <= 5)
      )
    ])
    error_message = "must be between 1 and 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.auto_scaling_configuration == null || (v.auto_scaling_configuration.metric_target >= 0 && v.auto_scaling_configuration.metric_target <= 100)
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.auto_scaling_configuration == null || (v.auto_scaling_configuration.min_node_count >= 1 && v.auto_scaling_configuration.min_node_count <= 5)
      )
    ])
    error_message = "must be between 1 and 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.auto_scaling_configuration == null || (v.auto_scaling_configuration.scale_in_cooldown_seconds >= 0 && v.auto_scaling_configuration.scale_in_cooldown_seconds <= 100000)
      )
    ])
    error_message = "must be between 0 and 100000"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.auto_scaling_configuration == null || (v.auto_scaling_configuration.scale_out_cooldown_seconds >= 0 && v.auto_scaling_configuration.scale_out_cooldown_seconds <= 100000)
      )
    ])
    error_message = "must be between 0 and 100000"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.capacity_configuration == null || (v.capacity_configuration.node_count >= 1 && v.capacity_configuration.node_count <= 5)
      )
    ])
    error_message = "must be between 1 and 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.capacity_configuration == null || (length(v.capacity_configuration.node_type) >= 1 && length(v.capacity_configuration.node_type) <= 32)
      )
    ])
    error_message = "must be between 1 and 32 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.code == null || (length(v.code.s3_key) >= 3 && length(v.code.s3_key) <= 1024)
      )
    ])
    error_message = "must be between 3 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.code == null || (v.code.s3_object_version == null || (length(v.code.s3_object_version) >= 3 && length(v.code.s3_object_version) <= 1024))
      )
    ])
    error_message = "must be between 3 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        length(v.environment_id) >= 1 && length(v.environment_id) <= 32
      )
    ])
    error_message = "must be between 1 and 32 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.execution_role == null || (length(v.execution_role) >= 1 && length(v.execution_role) <= 1024)
      )
    ])
    error_message = "must be between 1 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.initialization_script == null || (length(v.initialization_script) >= 1 && length(v.initialization_script) <= 255)
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        length(v.release_label) >= 1 && length(v.release_label) <= 16
      )
    ])
    error_message = "must be between 1 and 16 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.savedown_storage_configuration == null || (v.savedown_storage_configuration.volume_name == null || (length(v.savedown_storage_configuration.volume_name) >= 3 && length(v.savedown_storage_configuration.volume_name) <= 63))
      )
    ])
    error_message = "must be between 3 and 63 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.scaling_group_configuration == null || (length(v.scaling_group_configuration.scaling_group_name) >= 3 && length(v.scaling_group_configuration.scaling_group_name) <= 63)
      )
    ])
    error_message = "must be between 3 and 63 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.scaling_group_configuration == null || (v.scaling_group_configuration.cpu == null || (v.scaling_group_configuration.cpu >= 0.1))
      )
    ])
    error_message = "must be at least 0.1"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.scaling_group_configuration == null || (v.scaling_group_configuration.node_count >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.scaling_group_configuration == null || (v.scaling_group_configuration.memory_limit == null || (v.scaling_group_configuration.memory_limit >= 6))
      )
    ])
    error_message = "must be at least 6"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.scaling_group_configuration == null || (v.scaling_group_configuration.memory_reservation >= 6)
      )
    ])
    error_message = "must be at least 6"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_clusters : (
        v.tickerplant_log_configuration == null || alltrue([for item in v.tickerplant_log_configuration : (alltrue([for x in item.tickerplant_log_volumes : length(x) >= 3 && length(x) <= 63]))])
      )
    ])
    error_message = "must be between 3 and 63 characters"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

