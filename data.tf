data "aws_caller_identity" "current" {}

locals {
  mime_types = {
    htm   = "text/html"
    html  = "text/html"
    css   = "text/css"
    ttf   = "font/ttf"
    js    = "application/javascript"
    map   = "application/javascript"
    json  = "application/json"
    jpg   = "image/jpeg"
    jpeg  = "image/jpeg"
    woff  = "font/woff"
    woff2 = "font/woff2"
    eot   = "application/vnd.ms-fontobject"
    svg   = "image/svg+xml"
    png   = "image/png"
    txt   = "text/plain"
  }
}