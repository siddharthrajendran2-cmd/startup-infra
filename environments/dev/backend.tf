terraform {
  backend "s3" {
    bucket       = "siddharth-startup-infra-tfstate"
    key          = "environments/dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}