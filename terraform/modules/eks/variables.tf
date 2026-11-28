variable "kubernetes_version" {
  description = "kubernetes version"
  default     = 1.33
}
variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
