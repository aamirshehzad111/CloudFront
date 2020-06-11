region = "us-east-1"
owner = "dummy@dummy.com"
OAI_comment = "OAI-1s"
dynamic_s3_origin_config = {
  "origin1" = "aamir-learning.s3.amazonaws.com"
  "origin2" = "aamir-jenkins-dev-tfstate.s3.amazonaws.com"
}
custom_origin_config = {
  "origin1" = "test-alb-2110245920.us-east-1.elb.amazonaws.com"
}

dynamic_s3_origin_config_policy     = {
  "origin1" = "aamir-learning"
  "origin2" = "aamir-jenkins-dev-tfstate"
}
