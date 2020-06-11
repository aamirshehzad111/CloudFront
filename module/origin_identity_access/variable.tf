variable "OAI_comment" {
  type = string
  description = "Enter comment to create origin access identity"
}


variable "dynamic_s3_origin_config_policy" {
  description = "Configuration for the s3 origin config to be used in dynamic block"
  default = ""
}