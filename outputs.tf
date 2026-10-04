output "bucket_name" {
  description = "S3 bucket name for Terraform state"
  value       = yandex_storage_bucket.tfstate.bucket
}

output "bucket_id" {
  description = "S3 bucket ID"
  value       = yandex_storage_bucket.tfstate.id
}
