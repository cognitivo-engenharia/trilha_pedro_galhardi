output "id" {
  value = aws_instance.web
}

output "ami" {
  value = aws_instance.web.ami

}

output "arn" {
  value = aws_instance.web.arn
}