output "id" {
  value = aws_instance.os.*.id
}

output "private_dns" {
  value = aws_instance.os.*.private_dns
}
