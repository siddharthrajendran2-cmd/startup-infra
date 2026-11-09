variable "aws_region" {
  description = "AWS region for the state bucket and OIDC resources"
  type        = string
  default     = "us-east-1"
}

variable "state_bucket_name" {
  description = "Globally unique name for the Terraform state S3 bucket"
  type        = string
}

variable "github_org" {
  description = "GitHub organization or username that owns the repository"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name (e.g., startup-infra)"
  type        = string
  default     = "startup-infra"
}