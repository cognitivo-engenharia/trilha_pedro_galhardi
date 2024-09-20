output "bucket_names" {
  value = aws_instance.server.*.public_ip
}

output "instances_names" {

  value = join(",", aws_instance.server.*.tags.Name)
  
}