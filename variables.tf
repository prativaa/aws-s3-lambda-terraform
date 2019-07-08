
variable "fqdn" {
  type        = "string"
  description = "The FQDN of the website and also name of the S3 bucket"
}

variable "region" {}
variable "access_key" {}
variable "secret_key" {}

variable index_document {
  type        = "string"
  description = "HTML to show at root"
  default     = "index.html"
}

variable error_document {
  type        = "string"
  description = "HTML to show on 404"
  default     = "404.html"
}

variable routing_rules {
  type        = "string"
  description = "Routing rules for the S3 bucket"
  default     = ""
}

variable "force_destroy" {
  type        = "string"
  description = "The force_destroy argument of the S3 bucket"
  default     = "false"
}

variable "lambda_at_edge" {
  description = "Set this to true if using Lambda@Edge, to enable publishing, limit the timeout, and allow edgelambda.amazonaws.com to invoke the function"
  type        = bool
  default     = true
}

variable "function_name" {
  type = "string"
}