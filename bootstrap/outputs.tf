output "state_bucket_name" {
  description = "Name of the S3 bucket storing Terraform state"
  value       = aws_s3_bucket.terraform_state.id
}

output "state_bucket_arn" {
  description = "ARN of the S3 bucket storing Terraform state"
  value       = aws_s3_bucket.terraform_state.arn
}

output "github_actions_role_arn" {
  description = "ARN of the IAM role for GitHub Actions to assume via OIDC"
  value       = aws_iam_role.github_actions_terraform.arn
}

output "setup_instructions" {
  description = "Next steps after bootstrap"
  value       = <<-EOT
    Bootstrap complete. Next steps:
    1. Add the role ARN as a GitHub repository secret named AWS_ROLE_ARN:
       ${aws_iam_role.github_actions_terraform.arn}
    2. Configure your backend in environments/dev/backend.tf with:
       bucket = "${aws_s3_bucket.terraform_state.id}"
  EOT
}