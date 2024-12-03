/*resource "aws_s3_bucket" "mys3bucket" {

    for_each = {
      "dev" = "my-dapp-bucket-xyz"
      "qa" = "my-qapp-bucket-xyz"
      "stg" = "my-sapp-bucket-xyz"
      "prdo" = "my-papp-bucket-xyz"
    }

    bucket = "${each.key}-${each.value}"
    tags = {
      Environment = each.key
      bucketname =  "${each.key}-${each.value}"
      eachvalue = each.value
    }

  
}*/