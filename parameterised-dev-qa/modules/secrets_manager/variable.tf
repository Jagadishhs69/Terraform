variable "secret_name" {
  description = "Name of the secret"
  type        = string
}

variable "secret_value" {
  description = "The actual secret string"
  type        = string
  sensitive   = true
}

variable "env" {
  description = "Environment (dev, qa, etc.)"
  type        = string
}
