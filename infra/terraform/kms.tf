resource "aws_kms_key" "ledger" {
  description             = "KMS key for regulated payments ledger"
  deletion_window_in_days = 10
}
