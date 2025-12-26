resource "aws_msk_cluster" "ledger" {
  cluster_name           = "ledger-msk"
  kafka_version          = "3.5.1"
  number_of_broker_nodes = 2
}
