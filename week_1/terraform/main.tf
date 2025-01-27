terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.17.0"
    }
  }
}

provider "google" {
  project = "ny-taxi-449004"
  region  = "us-central1"
  credentials = file(var.credentials)
}

resource "google_storage_bucket" "demo-bucket-47" {
  name          = var.gsc_bucket_name
  location      = var.location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id    = var.bq_dataset_name
  friendly_name = "simple datasets"
  description   = "Dataset for the course first week"
  location      = var.location
}