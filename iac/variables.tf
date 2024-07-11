provider "google" {
  credentials = var.google_credentials
  project     = var.project_id
  region      = var.region
}

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}

variable "google_credentials" {
  description = "Google Cloud credentials JSON"
  type        = string
}

variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Google Cloud Storage bucket name"
  type        = string
}
