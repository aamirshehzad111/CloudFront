I have created two modules first for origin access identity named as origin_access_identity and second module for cloud
cloudFront distribution named as cloudFront_cloudFront_distribution that will work with one origin as well as with multiple origins. 

* Module origin access identity will take 2 parameter one is {comment} and second is {bucket_name}. We will get OAI from this module output. This module will also add bucket policy to the buckets.  

* We will get value of OAI from origin_access_identity module and we pass that value to cloudFront_distribution module. 
I have created 2 resources in it. When we have multiple origins it will create a origins group. If we have one origin we cant use origin group 
because origin group needs minimum 2 values so to cope this I have created a new resource that will get executed when we have one origin. Event though i have created 
2 resource but only one of both just get executed (I did this using conditional statements).
We have 2 map varibale one contains s3 buckets and other contains elb. see below

    dynamic_s3_origin_config = {
      "origin1" = "aamir-learning.s3.amazonaws.com"
      "origin2" = "aamir-jenkins-dev-tfstate.s3.amazonaws.com"
    }
    
    custom_origin_config = {
      "origin1" = "test-alb-2110245920.us-east-1.elb.amazonaws.com"
    } 
    
* we use 2 dynamic origin block one for s3 and other elb or custom origin. 
    
    

Steps to executes this module.

1) terraform init
2) Run:  ./stater.sh  
    This script would run terraform plan and than terraform apply
    
