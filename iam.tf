data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = slice(list("lambda.amazonaws.com", "edgelambda.amazonaws.com"), 0, "${var.lambda_at_edge}" ? 2 : 1)
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${var.function_name}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
}
