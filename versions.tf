terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/http"
      version = ">= 2.2.0"
    }
  }
}
