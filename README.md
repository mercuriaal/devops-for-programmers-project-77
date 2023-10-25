### Hexlet tests and linter status:
[![Actions Status](https://github.com/mercuriaal/devops-for-programmers-project-77/workflows/hexlet-check/badge.svg)](https://github.com/mercuriaal/devops-for-programmers-project-77/actions)

### Требования для работы с проектом:

ОС: Linux, macOS

[Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) 2.15.2

[GNU Make](https://www.gnu.org/software/make/#download) 4.3

### Подготовка к работе:
Для корректной работы терраформу нужно передать следующие файлы с секретами:
1. secret.backed.tfvars

```commandline
access_key         = "ydb acces key"
secret_key         = "ydb secret key"
dynamodb_endpoint  = "ydb endpoint"
dynamodb_table     = "table name"
bucket             = "bucker name"
```
2. secret.datadog.tfvars
```commandline
datadog_api_key    = "api key"
datadog_app_key    = "app key"
```
3. secret.yc.tfvars
```commandline
yc_token = "token"
yc_cloud_id = "cloud id"
yc_folder_id = "folder id"
```
Файлы необходимо положить в директорию ./terraform

### Команды для работы с проектом:

```commandline
make install_roles   # установка ролей и коллекций
make tf-init         # инициализация терраформа
make tf-apply        # создание инфраструктуры
make prepare         # подготовка серверов для деплоя приложения
make deploy          # деплой приложения
make dd              # подключение datadog
```

[Ссылка на задеплоенное приложение](https://mercurial-learning-app.ru/)