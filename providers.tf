provider "google" {
  region  = var.region
  project = var.project
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
    local = {
      source = "hashicorp/local"
    }
  }
  required_version = ">= 0.13"
}