variable "name" {
  type        = string
  description = "Repository Name"
}

variable "config" {
  type = object({
    checks = list(string)
  })
}