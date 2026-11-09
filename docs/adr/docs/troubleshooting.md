# Troubleshooting Log

## Issue 1: CIDR Overlap Error During VPC Deployment

**Error:** Terraform returned an error about overlapping CIDR blocks when an invalid subnet CIDR was used.

**Root Cause:** Subnet CIDRs were not properly allocated within the VPC CIDR range without overlap.

**Fix:** Corrected subnet CIDRs to non-overlapping ranges within 10.0.0.0/16: public subnets 10.0.1.0/24 and 10.0.2.0/24, private subnets 10.0.10.0/24 and 10.0.11.0/24.