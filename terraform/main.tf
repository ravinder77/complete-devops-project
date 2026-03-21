
module "rds" {
  source = "./modules/rds"

  identifier        = "myapp-prod"
  engine            = "postgres"
  engine_version    = "15.4"
  instance_class    = "db.t3.medium"
  db_name           = "myapp"
  username          = "dbadmin"
  allocated_storage = 50

  subnet_ids                 = module.vpc.private_subnet_ids
  vpc_id                     = module.vpc.vpc_id
  allowed_security_group_ids = [module.app.security_group_id]

  multi_az                = true
  create_read_replica     = true
  backup_retention_period = 14
  deletion_protection     = true

  parameters = [
    { name = "log_connections",    value = "1" },
    { name = "log_disconnections", value = "1" }
  ]

  alarm_actions = [aws_sns_topic.alerts.arn]

  tags = {
    Environment = "production"
    Team        = "platform"
  }
}