output "EC2_info" {
  value = {
    internal_ip = "${aws_instance.bit-runner.private_ip}"
    tags = "${aws_instance.bit-runner.tags_all}"
  }
}