data "aws_caller_identity" "current" {}

variable "region" {
  type = string
  description = "The region you want to deploy in"
  default     = "us-east-1"
}

variable "dynamic_s3_origin_config" {
  description = "Configuration for the s3 origin config to be used in dynamic block"
}


variable "custom_origin_config" {
  description = "Configuration for the elb origin config to be used in dynamic block"
}

variable "dynamic_s3_origin_config_policy" {
  description = "Configuration for the s3 origin config to be used in dynamic block"
}

variable "owner" {
  type = string
  description = "The owner email, this will be applied as a tag to objects"
}

variable "OAI_comment" {
  type = string
  description = "Enter comment to create origin access identity"
}