# ADR-0001: Use Terraform with S3-native lockfile for state management

## Status

Accepted

## Context

We need an Infrastructure as Code tool to manage AWS resources reproducibly.
The state must be stored remotely so that both local development and CI/CD
pipelines operate on the same source of truth. State locking is required to
prevent concurrent modifications that could corrupt infrastructure.

Options considered:
- AWS CloudFormation (native, no state management needed, but vendor lock-in and limited modularity)
- Terraform with DynamoDB state locking (traditional approach, requires a DynamoDB table)
- Terraform with S3-native lockfile (new in Terraform 1.10+, uses .tflock file in S3)

## Decision

Use Terraform with the S3 backend and `use_lockfile = true` for state locking.

Rationale:
- Terraform is cloud-agnostic and modular, skills transfer to any employer
- S3-native lockfile eliminates the need for a DynamoDB table (simpler, cheaper)
- DynamoDB-based locking is officially deprecated and will be removed in a future Terraform minor version
- The S3 lockfile approach requires only S3 permissions (GetObject, PutObject, DeleteObject on .tflock)
- Terraform 1.15.8 fully supports this feature

## Consequences

- All team members and CI/CD must use Terraform >= 1.10
- No DynamoDB table to manage or pay for
- State locking operates via a .tflock file stored alongside the state in S3
- IAM policies need s3:GetObject, s3:PutObject, s3:DeleteObject on the .tflock path
- Legacy tutorials using dynamodb_table will not apply to this project