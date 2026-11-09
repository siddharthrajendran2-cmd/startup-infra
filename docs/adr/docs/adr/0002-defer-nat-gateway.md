# ADR-0002: Defer NAT Gateway to reduce cost

## Status

Accepted

## Context

Private subnets need a NAT Gateway for outbound internet access (e.g., pulling
container images, calling external APIs). However, NAT Gateways cost approximately
$0.045/hour (~$32/month) plus data transfer charges. This project targets $0 cost
using only AWS Free Tier resources.

## Decision

Deploy private subnets without a NAT Gateway. Private subnets will have a route
table with no outbound internet route. NAT Gateway will be added in Project 2
when ECS containers require outbound access, at which point the learner accepts
the cost trade-off.

## Consequences

- Private subnets cannot reach the internet (no outbound traffic)
- Resources in private subnets cannot pull container images or call external APIs
- This is acceptable because no workloads run in private subnets yet
- The VPC module is designed to accept a NAT Gateway ID as an optional variable for future use
- When NAT is needed, a single line change adds the route to the private route table