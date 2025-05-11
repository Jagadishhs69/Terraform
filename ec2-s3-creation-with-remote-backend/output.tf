output "publicip" {
  value = aws_instance.jags9999[*].public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.mybucket.bucket_domain_name
}