# Day 7 — Bash loops, arrays and automation

Дата: 17.09.2026

## Цель

Научиться использовать циклы и массивы Bash
для автоматизации повторяющихся операций.

## Изучаю

- цикл for
- цикл while
- массивы Bash
- перебор элементов массива
- автоматическая проверка нескольких сервисов
- автоматическая обработка файлов и директорий
- автоматизация повторяющихся операций

## Практика

### Практика 1 — цикл for

Создам Bash-скрипт, который последовательно
проверяет несколько Linux-сервисов.

Используется цикл:

```bash
for service in ssh chrony systemd-networkd cron; do
    ...
done

### Практика 2 — цикл while

Создал Bash-скрипт `while_check.sh`.

Скрипт несколько раз выполняет проверку сервера с помощью
цикла `while`.

Пример:

```bash


#!/bin/bash

counter=1

while [ "$counter" -le 5 ]; do
    echo "Check number: $counter"
    uptime
    counter=$((counter + 1))
    sleep 2
done

echo "===== CHECK COMPLETE ====="


### Практика 3 — массив Bash

Создал Bash-скрипт `services_array.sh`.

Скрипт содержит массив Linux-сервисов и последовательно
проверяет каждый сервис с помощью цикла `for`.

Массив:

```bash
services=("ssh" "chrony" "cron" "systemd-networkd")

### Практика 4 — автоматическая проверка файлов

Создал Bash-скрипт `files_array.sh`.

Скрипт использует массив путей к файлам и последовательно
проверяет существование каждого файла.

Массив файлов:

```bash
files=(
    "$HOME/devops-lab/project1.txt"
    "$HOME/devops-lab/project2.txt"
    "$HOME/devops-lab/projects/project2.txt"
    "$HOME/devops-lab/not_exists.txt"
)
