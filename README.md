# startup-infra

Production-grade Terraform GitOps foundation on AWS.

## Structure

- `bootstrap/` - State bucket and OIDC provisioning
- `modules/vpc/` - Reusable VPC module
- `environments/dev/` - Dev environment configuration
- `docs/adr/` - Architecture Decision Records
- `.github/workflows/` - CI/CD pipelines