variable "sg_id" {
  description = "SG ID comes from sg-output"
  type        = string
}

variable "subnets" {
  description = "Subnet for EC2"
  type        = list(string)
}

variable "ec2_names" {
  description = "EC2 names"
  type        = list(string)
  default     = ["web-server-1", "web-server-2"]
}
