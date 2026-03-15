# ---- Random Password -----
resource "random_password" "master" {
  length = 24
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# ---- Secret Manager ------
resource "aws_secretsmanager_secret" "rds" {
  name                    = "${var.identifier}/rds/master"
  recovery_window_in_days = 7
  tags                    = local.common_tags
}

resource "aws_secretsmanager_secret_version" "rds" {
  secret_id = aws_secretsmanager_secret.rds.id
  secret_string = jsonencode({
    username = var.username
    password = random_password.master.result
    host     = aws_db_instance.main.address
    port     = local.port
    dbname   = var.db_name
  })
}


# ─── KMS key for encryption at rest ───────────────────
resource "aws_kms_key" "rds" {
  description             = "KMS key for ${var.identifier} RDS"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags                    = local.common_tags
}

resource "aws_kms_alias" "rds" {
  name          = "alias/${var.identifier}-rds"
  target_key_id = aws_kms_key.rds.key_id
}