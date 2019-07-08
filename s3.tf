resource "aws_s3_bucket" "main" {
  bucket = "${var.fqdn}"
  acl = "public-read"
  policy = "${data.aws_iam_policy_document.bucket_policy.json}"

  website {
    index_document = "${var.index_document}"
    error_document = "${var.error_document}"
    routing_rules  = "${var.routing_rules}"
  }

  force_destroy = "${var.force_destroy}"
}


data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadForGetBucketObjects"

    actions = [
      "s3:GetObject"
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::${var.fqdn}/*",
    ]

    principals {
      type = "*"
      identifiers = ["*"]
    }
  }

  # statement {
  #   sid = "IPDeny"

  #   actions = [
  #     "s3:PutObject"
  #   ]

  #   effect = "Deny"

  #   principals {
  #     type = "*"
  #     identifiers = ["*"]
  #   }

  #   resources = [
  #     "arn:aws:s3:::${var.fqdn}/*"
  #   ]
  # }
}
