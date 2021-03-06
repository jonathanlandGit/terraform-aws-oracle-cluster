resource "aws_db_subnet_group" "main" {
  count       = var.enabled ? 1 : 0
  name        = var.name
  description = "Group of DB subnets"
  subnet_ids  = var.subnets
}


# data "aws_availability_zones" "all" {}
# resource "aws_autoscaling_group" "example" {
#   # launch_configuration = aws_launch_configuration.example.id
#   availability_zones = data.aws_availability_zones.all.names

#   min_size = 2
#   max_size = 2

#   # Use for_each to loop over var.custom_tags
#   dynamic "tag" {
#     for_each = var.custom_tags
#     content {
#       key                 = tag.key
#       value               = tag.value
#       propagate_at_launch = true
#     }
#   }
# }

locals {
  rds_instances = toset([
    "rds-orc1",
    "rds-orc2",
    # "rds-orc3",
  ])
}

resource "aws_db_instance" "default" {
  # count                     = var.instance_count
  for_each = local.rds_instances

  license_model             = "license-included"
  allocated_storage         = var.vrds_allocated_storage
  engine                    = var.vrds_engine
  engine_version            = var.vrds_engine_version
  identifier                = "pmrt-${each.key}"
  instance_class            = var.vrds_instance_class
  storage_type              = var.vrds_storage_type
  final_snapshot_identifier = var.vrds_final_snapshot_identifier
  skip_final_snapshot       = var.vrds_skip_final_snapshot
  copy_tags_to_snapshot     = var.vrds_copy_tags_to_snapshot
  password                  = var.db_password
  username                  = var.vrds_username
  backup_retention_period   = var.vrds_backup_retention_period
  backup_window             = var.vrds_backup_window
  iops                      = var.vrds_iops
  maintenance_window        = var.vrds_maintenance_window
  multi_az                  = var.vrds_multi_az
  port                      = var.vrds_port
  vpc_security_group_ids    = ["${aws_security_group.sql.id}"]
  # availability_zone         = data.example.aws_availability_zones.all
  # db_subnet_group_name        = var.vrds_subnets_dev
  # db_subnet_group_name        = aws_db_subnet_group.main[0].name
  storage_encrypted = var.vrds_storage_encrypted
  apply_immediately = var.vrds_apply_immediately
  # replicate_source_db         = var.vrds_replicate_source_db
  snapshot_identifier         = var.vrds_snapshot_identifier
  auto_minor_version_upgrade  = var.vrds_auto_minor_version_upgrade
  allow_major_version_upgrade = var.vrds_allow_major_version_upgrade
  monitoring_interval         = var.vrds_enhanced_monitoring_interval
  monitoring_role_arn         = var.vrds_monitoring_role_arn
  # enabled_cloudwatch_logs_exports = [var.vrds_enabled_cloudwatch_logs_exports]
  #performance_insights_enabled   = "${var.vrds_perf_insights}"

  tags = {
    # ProductCode   = "${var.product_code_tag}"
    # Name          = "hpp-${count.index}"
    Name          = "pmrt-${each.key}"
    Environment   = var.environment_tag
    InventoryCode = var.inventory_code_tag
    # DBIdentifier  = "hpp-${count.index}"
    DBIdentifier = "pmrt-${each.key}"
    # Creator      = var.resource_creator
  }

  lifecycle {
    prevent_destroy = false
  }
}

