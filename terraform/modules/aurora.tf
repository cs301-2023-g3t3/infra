
resource "aws_rds_cluster" "main_cluster" {
  allocated_storage                   = 1
  allow_major_version_upgrade         = null
  apply_immediately                   = null
  availability_zones                  = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  backtrack_window                    = 0
  backup_retention_period             = 1
  cluster_identifier                  = "itsa-db"
  cluster_identifier_prefix           = null
  cluster_members                     = ["itsa-db-reader", "itsa-db-writer"]
  copy_tags_to_snapshot               = true
  database_name                       = null
  db_cluster_instance_class           = null
  db_cluster_parameter_group_name     = "itsa-parameter-group"
  db_instance_parameter_group_name    = null
  db_subnet_group_name                = "default-vpc-0a1a8fab3e8b4cd4c"
  db_system_id                        = null
  deletion_protection                 = true
  enable_global_write_forwarding      = null
  enable_http_endpoint                = false
  enabled_cloudwatch_logs_exports     = ["audit", "error", "general", "slowquery"]
  engine                              = "aurora-mysql"
  engine_mode                         = "provisioned"
  engine_version                      = "8.0.mysql_aurora.3.04.0"
  final_snapshot_identifier           = null
  global_cluster_identifier           = null
  iam_database_authentication_enabled = false
  iam_roles                           = ["arn:aws:iam::345215350058:role/itsa-db-rds-proxy-role"]
  iops                                = 0
  kms_key_id                          = "arn:aws:kms:ap-southeast-1:345215350058:key/4dfa1cc5-7d76-4993-858d-9a0f8e754c93"
  manage_master_user_password         = null
  master_password                     = null # sensitive
  master_user_secret_kms_key_id       = null
  master_username                     = "admin"
  network_type                        = "IPV4"
  port                                = 3306
  preferred_backup_window             = "20:20-20:50"
  preferred_maintenance_window        = "thu:18:21-thu:18:51"
  replication_source_identifier       = null
  skip_final_snapshot                 = true
  snapshot_identifier                 = null
  source_region                       = null
  storage_encrypted                   = true
  storage_type                        = null
  tags                                = {}
  tags_all                            = {}
  vpc_security_group_ids              = ["sg-05a445100fc469383"]
  serverlessv2_scaling_configuration {
    max_capacity = 1
    min_capacity = 0.5
  }
}
