resource "aws_kms_key" "log-encryption" {
  description             = "${local.name}-cloudwatch"
  deletion_window_in_days = 30
}
