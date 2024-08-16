variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-2"
}
variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR Range"
  type        = list(string)
}
