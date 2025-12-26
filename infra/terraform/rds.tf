resource "aws_db_instance" "ledger" {
  identifier        = "ledger-db"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  db_name           = "ledger"
  username          = "ledger_user"
  password          = "ChangeMe123!"
  storage_encrypted = true
  kms_key_id        = aws_kms_key.ledger.arn
  skip_final_snapshot = true
}
