resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.bucket_class
}

resource "google_storage_bucket_object" "default" {
  name   = var.startup_script
  source = "${path.root}/${var.startup_script}"
  bucket = google_storage_bucket.bucket.id
}

resource "google_storage_bucket_iam_member" "member" {
  provider = google
  member   = "allUsers"
  role     = "roles/storage.objectViewer"
  bucket   = google_storage_bucket.bucket.name
}
