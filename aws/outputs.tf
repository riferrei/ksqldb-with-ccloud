###########################################
################# Outputs #################
###########################################

output "ksqlDB_Server" {
  value = "http://${aws_alb.ksqldb_server.dns_name}"
}
