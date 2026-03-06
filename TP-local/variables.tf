variable container_name {
  type        = string
  default     = "nginx-terraform"
  description = "Image name"
}

variable image_name {
  type        = string
  default     = "nginx:latest"
  description = "Container name"
}

variable internal_port {
  type        = number
  default     = 80
  description = "Internal port"
}

variable external_port {
  type        = number
  default     = 8080
  description = "External port"
}
