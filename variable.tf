variable "bucket-name" {
  type = string
}

variable "common_tags" {

}

variable "upload_directory" {
  type = string
}

variable "index-page" {
  default = "index.html"
}

variable "error-page-key" {
  default = "error.html"
}