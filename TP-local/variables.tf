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

variable machines {
  type = list(object({
    name      = string
    vcpu      = number
    disk_size = number
    region    = string
  }))
  description = "List of virtual machines to deploy"
  
  validation {
    condition = alltrue([
      for machine in var.machines : machine.vcpu >= 2 && machine.vcpu <= 64
    ])
    error_message = "vCPU count must be between 2 and 64."
  }
  
  validation {
    condition = alltrue([
      for machine in var.machines : machine.disk_size >= 20
    ])
    error_message = "Disk size must be at least 20 GB."
  }
  
  validation {
    condition = alltrue([
      for machine in var.machines : contains(["eu-west-1", "us-east-1", "ap-southeast-1"], machine.region)
    ])
    error_message = "Region must be one of: eu-west-1, us-east-1, ap-southeast-1."
  }
}

