# ADR-0003: Use OIDC over static IAM keys for CI/CD

## Status

Accepted

## Context

GitHub Actions needs AWS credentials to run Terraform. Options are static IAM access keys stored as GitHub secrets, or OIDC federated identity that issues temporary credentials per workflow run.

## Decision

Use OIDC with `aws-actions/configure-aws-credentials` and an IAM role with a trust policy scoped to this specific repository.

## Consequences

- No static credentials stored anywhere
- Credentials are temporary and scoped per workflow run
- Trust policy must exactly match the repository and branch conditions
- Slightly more complex initial setup but significantly more secure