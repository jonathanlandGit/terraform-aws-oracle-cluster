# Variables for providers used in this module
variable "aws_region" { default = "us-east-1" }
# variable "aws_cross_region" { default = "us-east-1" }
# variable "aws_profile" {}
variable "zone" {}

# TAG and name
# variable "product_code_tag" {}
variable "inventory_code_tag" {}
variable "environment_tag" {}
# variable "account_tag" {}
variable "product_name" {}
# variable "resource_creator" {}

# RDS Instance Agruments
variable "vrds_allocated_storage" {}
variable "vrds_engine" { default = "postgres" }
variable "vrds_engine_version" {}
variable "vrds_identifier" {}
variable "vrds_instance_class" {}
variable "vrds_storage_type" { default = "gp2" }
variable "vrds_final_snapshot_identifier" {}
variable "vrds_skip_final_snapshot" { default = false }
variable "vrds_snapshot_identifier" {}
variable "vrds_copy_tags_to_snapshot" { default = true }
variable "db_password" {}
variable "vrds_username" { default = "admin" }
variable "vrds_backup_retention_period" { default = 7 }
variable "vrds_backup_window" { default = "07:30-08:00" }
variable "vrds_iops" {}
variable "vrds_maintenance_window" { default = "wed:09:00-wed:10:00" }
variable "vrds_multi_az" { default = false }
variable "vrds_port" { default = 5432 }
variable "vrds_storage_encrypted" {}
variable "vrds_apply_immediately" { default = true }
# variable "vrds_replicate_source_db" {}
variable "vrds_auto_minor_version_upgrade" { default = false }
variable "vrds_allow_major_version_upgrade" { default = false }
variable "db_family" {}
variable "db_name" {}
variable "vrds_custom_param_group" { default = "false" }
variable "vrds_param_group_family" { default = "default.postgres10.4" }
variable "vrds_subnets_dev" {}
variable "vrds_vpc_id" {}
variable "vrds_perf_insights" { default = "false" }
variable "name" {
  type        = string
  description = "Name given to DB subnet group"
}
variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs to use"
}
variable "enabled" {
  type        = string
  default     = true
  description = "Whether the database resources should be created"
}

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default = {
    development = "RDS-Oracle-1"
    staging     = "RDS-Oracle-2"
  }
} # variable "vrds_enabled_cloudwatch_logs_exports" { default = ["alert"] }

# DMS specific variables
# variable "dms_allocated_storage" {}
# variable "dms_engine_version" {}
# variable "dms_replication_instance_class" {}
# variable "dms_subnet" {}



# RDS Reader Instance Arguments
variable "vrds_ro_count" {}
variable "vrds_instance_class_ro" {}
variable "vrds_port_ro" { default = 1521 }
variable "vrds_storage_type_ro" { default = "gp2" }
variable "vrds_iops_ro" {}
variable "vrds_apply_immediately_ro" { default = true }
variable "vrds_auto_minor_version_upgrade_ro" { default = false }
variable "vrds_copy_tags_to_snapshot_ro" { default = true }

variable "instance_count" {}

variable "rds_instances_added" {}

# variable "user" {
#   description = "IAM usernames"
#   type        = set(string)
# }

# PgSQL Parameter Group Arguments
variable "param_max_connections" { default = "LEAST({DBInstanceClassMemory/9531392},5000)" }
variable "param_ro_max_connections" { default = "LEAST({DBInstanceClassMemory/9531392},5000)" }

# Monitoring / Alerting Arguments

variable "alarm_sns_topic" { default = "" }
variable "es_instance_event_categories" { default = "availability,failure,failover,maintenance" }
variable "es_ro_instance_event_categories" { default = "availability,failure,failover,maintenance" }
variable "es_rds_event_sns_topic" { default = "dummy" }
variable "es_cr_rds_event_sns_topic" { default = "dummy" }
variable "es_rds_event_categories" { default = "failure" }
variable "es_ro_rds_event_categories" { default = "failure" }
variable "es_cr_rds_event_categories" { default = "failure" }

variable "cw_alarms" { default = "false" }
variable "cw_readiops_thresholds" { default = "2000000" }
variable "cw_readiops_evaluation_period" { default = "1" }
variable "cw_writeiops_thresholds" { default = "1000000" }
variable "cw_writeiops_evaluation_period" { default = "1" }
variable "cw_conn_thresholds" { default = "80" }
variable "cw_conn_evaluation_period" { default = "5" }
variable "cw_cpu_thresholds" { default = "80" }
variable "cw_cpu_evaluation_period" { default = "5" }
variable "cw_free_storage_thresholds" { default = "10" }
variable "cw_free_storage_evaluation_period" { default = "3" }
variable "cw_ro_readiops_thresholds" { default = "2000000" }
variable "cw_ro_readiops_evaluation_period" { default = "1" }
variable "cw_ro_writeiops_thresholds" { default = "1000000" }
variable "cw_ro_writeiops_evaluation_period" { default = "1" }
variable "cw_ro_conn_thresholds" { default = "80" }
variable "cw_ro_conn_evaluation_period" { default = "5" }
variable "cw_ro_cpu_thresholds" { default = "80" }
variable "cw_ro_cpu_evaluation_period" { default = "5" }
variable "cw_ro_free_storage_thresholds" { default = "10" }
variable "cw_ro_free_storage_evaluation_period" { default = "3" }

# Enhanced Monitoring

variable "vrds_enhanced_monitoring_interval" { default = "0" }
variable "vrds_monitoring_role_arn" { default = "" }
