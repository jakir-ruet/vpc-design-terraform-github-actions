variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDRs"
  type        = list(string)
}

variable "subnet_names" {
  description = "Name of Subnets"
  type        = list(string)
  default     = ["public-subnet-1", "public-subnet-2"]
}
