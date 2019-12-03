###########################################
################## AWS ####################
###########################################

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = local.region
}

variable "aws_access_key" {
}

variable "aws_secret_key" {
}

data "aws_availability_zones" "available" {
  state = "available"
}

###########################################
############# Confluent Cloud #############
###########################################

variable "bootstrap_server" {
}

locals {
  region = split(".", var.bootstrap_server)[1]
}

variable "cluster_api_key" {
}

variable "cluster_api_secret" {
}

variable "schema_registry_url" {
}

variable "schema_registry_basic_auth" {
}

###########################################
############## ksqlDB Server ##############
###########################################

variable "global_prefix" {
  default = "aws-reinvent"
}

variable "ksqldb_server_image" {
  default = "confluentinc/ksqldb-server:0.6.0"
}

variable "automatic_scaling" {
  type = bool
  default = true
}

variable "min_desired_count" {
  type = number
  default = 1
}

variable "max_desired_count" {
  type = number
  default = 8
}
