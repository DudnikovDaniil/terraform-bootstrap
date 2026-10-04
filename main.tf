# S3 bucket для хранения terraform state основной инфраструктуры
resource "yandex_storage_bucket" "tfstate" {
  bucket = var.bucket_name

  # Запрещаем публичный доступ
  anonymous_access_flags {
    read        = false
    list        = false
    config_read = false
  }

  # Версионирование — чтобы можно было откатить state при поломке
  versioning {
    enabled = true
  }

  # Максимальный размер бакета (защита от раздувания)
  max_size = 1073741824  # 1 GB

  # Автоматически удалять старые версии state через 30 дней
  lifecycle_rule {
    id      = "cleanup-old-versions"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }

  tags = {
    Project     = "diploma"
    Environment = "bootstrap"
    ManagedBy   = "terraform"
  }
}
