# Terraform Bootstrap

Bootstrap-модуль Terraform для дипломного практикума в Yandex.Cloud.
Создаёт сервисный аккаунт, ключи и S3-бакет для хранения state основной инфраструктуры.

**Автор:** Дудников Даниил
**Группа:** FOPS-41

---

## Что создаётся

- Сервисный аккаунт `diploma-terraform-sa` с ролями:
  - `compute.admin`
  - `vpc.admin`
  - `k8s.admin`
  - `storage.admin`
  - `iam.serviceAccounts.user`
  - `logging.writer`
  - `iam.admin`
  - `resource-manager.admin`
- Авторизованный ключ для SA
- S3-ключ для backend
- S3-бакет `diploma-tfstate-dudnikov-7efeef` с:
  - версионированием
  - lifecycle (удаление старых версий через 30 дней)
  - лимитом 1 GB

---

## Структура

```
.
├── main.tf
├── versions.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

## Применение

```bash
terraform init
terraform plan
terraform apply
```

---

## Ссылки

- [Основной проект diploma-app](https://github.com/DudnikovDaniil/diploma-app)
- [terraform-infrastructure](https://github.com/DudnikovDaniil/terraform-infrastructure)

---

## Лицензия

Учебный проект. Свободное использование в образовательных целях.

© 2026, Дудников Даниил
