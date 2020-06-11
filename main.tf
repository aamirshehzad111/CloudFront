
module "origin_access_id_module" {
  source = "./module/origin_identity_access"
  OAI_comment = var.OAI_comment
}


module "cloudFront_distribution" {
  source = "./module/cloudFornt_distribution"
  owner = var.owner
  origin_access_identity = module.origin_access_id_module.origin_access_identity
  dynamic_s3_origin_config = var.dynamic_s3_origin_config
  custom_origin_config = var.custom_origin_config
}

