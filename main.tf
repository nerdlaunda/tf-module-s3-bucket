resource "aws_s3_bucket" "main-bucket" {
  bucket = "${data.aws_caller_identity.current.account_id}-${var.bucket-name}"
  tags   = var.common_tags
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.main-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allread_policy" {
  bucket     = aws_s3_bucket.main-bucket.id
  policy     = templatefile("${path.module}/templates/s3-bucket-policy.json", { bucket = aws_s3_bucket.main-bucket.id })
  depends_on = [aws_s3_bucket_public_access_block.public_access_block]
}

resource "aws_s3_bucket_website_configuration" "static-website-configuration" {
  bucket = aws_s3_bucket.main-bucket.id

  index_document {
    suffix = var.index-page
  }
  error_document {
    key = var.error-page-key
  }
}

resource "aws_s3_object" "website_files" {
  for_each     = fileset(var.upload_directory, "**/*.*")
  bucket       = aws_s3_bucket.main-bucket.id
  key          = replace(each.value, var.upload_directory, "")
  source       = "${var.upload_directory}${each.value}"
  etag         = filemd5("${var.upload_directory}${each.value}")
  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}