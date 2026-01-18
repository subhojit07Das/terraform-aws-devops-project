variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "project_name" {
  description = "Project tag name"
  type        = string
  default     = "terraform-devops-project"
}
