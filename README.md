### Hexlet tests and linter status:
[![Actions Status](https://github.com/mercuriaal/devops-for-programmers-project-77/workflows/hexlet-check/badge.svg)](https://github.com/mercuriaal/devops-for-programmers-project-77/actions)

### Требования для работы с проектом:

ОС: Linux, macOS

[Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) 2.15.2

[GNU Make](https://www.gnu.org/software/make/#download) 4.3

### Генерация переменных terraform
В корневой директории должен лежать файл `.vault-password` с паролем к хранилищу

Генерация выполняется командой `make generate-tf-vars`

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