output "bucket-id" {
  value = aws_s3_bucket.main-bucket.id
}

output "bucket-arn" {
  value = aws_s3_bucket.main-bucket.arn
}

output "website-endpoint" {
  value = aws_s3_bucket_website_configuration.static-website-configuration.website_endpoint
}