output "instances" {
  description = "all instance appear"
  value       = aws_instance.web.*.id
}
