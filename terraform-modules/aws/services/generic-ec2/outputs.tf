output "EC2_info" {
  value = {
    internal_ip = "${aws_instance.main.private_ip}"
    tags        = "${aws_instance.main.tags_all}"
  }
}