# Day 3 — Bash basics

Дата: 09.09.2026

## Изучил

- Bash и переменные
- $USER
- $SHELL
- $(command)
- $1, $2
- $@
- $?
- if / else / fi
- for / do / done
- && и ||
- chmod +x
- systemctl в Bash-скриптах

## Практика

Создал Bash-скрипты:

- hello.sh
- check_server.sh
- args.sh
- file_check.sh
- service_check.sh

## Что умеют скрипты

### hello.sh

Выводит:
- пользователя
- hostname
- дату

### check_server.sh

Проверяет:
- пользователя
- hostname
- дату
- uptime
- CPU
- RAM
- диск
- SSH

### args.sh

Работает с аргументами $1 и $2.

### file_check.sh

Проверяет существование файлов через $@.

### service_check.sh

Проверяет состояние Linux-сервисов через systemctl.

## Что понял

Bash позволяет объединять Linux-команды,
условия и циклы для автоматизации.

Ошибки при выполнении команд можно анализировать
через код завершения $?.

## Результат

Создал первые рабочие Bash-скрипты
для диагностики сервера и проверки файлов и сервисов.
