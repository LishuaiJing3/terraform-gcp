provider "google" {
  credentials = file("${path.module}/account.json")
  project     = "looker-evaluation"
  region      = "europe-west1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "lj-demo-bucket-1"
  location      = "EU"
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
