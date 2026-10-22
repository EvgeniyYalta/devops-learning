# День 18 — Docker Compose: Healthcheck и управление зависимостями

## Цель

Изучить проверку работоспособности контейнеров с помощью Docker Healthcheck, управление зависимостями сервисов через `depends_on`, диагностику неисправностей и восстановление приложения.

## Практика 1. Подготовка окружения

- Проверены Docker Engine, Docker Compose и состояние контейнеров.
- Установлено, что порт 8084 свободен.
- Создан проект `~/docker-lab/day18-compose` на основе проекта предыдущего дня.
- Подготовлены конфигурации Nginx и Docker Compose.

## Практика 2. Подготовка backend для Healthcheck

- Изучены особенности минимального образа `hashicorp/http-echo:1.0.0`.
- Установлено, что образ не содержит `/bin/sh`.
- Создан собственный Dockerfile на основе Alpine 3.20.
- Добавлен `curl` для HTTP-проверок.
- Собран образ `day18-backend:1.0`.
- Проверена работа приложения через порт 9001.

## Практика 3. Настройка Docker Compose

- Настроен сервис backend с проверкой здоровья.
- Для Nginx настроена зависимость `depends_on` с условием `service_healthy`.
- Проверена итоговая конфигурация Docker Compose.
- Выполнена сборка и запуск приложения командой `docker compose up -d --build`.
- Подтверждено состояние backend `healthy`.
- Через Nginx получен ответ `HTTP 200 OK` на порту 8084.

## Практика 4. Диагностика Healthcheck

- Изучены результаты `docker inspect`.
- Проверены параметры `Status`, `FailingStreak`, `ExitCode` и `Log`.
- Подтверждено успешное выполнение периодических HTTP-проверок.
- Изучены настройки `interval`, `timeout`, `retries` и `start_period`.

## Практика 5. Отказ и восстановление backend

- Выполнена остановка backend через `docker compose stop backend`.
- Подтверждено, что Nginx продолжает работать.
- Получен ожидаемый ответ `502 Bad Gateway`.
- Backend повторно запущен.
- Подтверждено восстановление состояния `healthy`.
- Получен ответ `200 OK`.

## Практика 6. Моделирование состояния unhealthy

- Создан временный файл `compose.health-fail.yaml`.
- Healthcheck временно перенастроен на недоступный порт 5999.
- Проверена объединённая конфигурация Compose.
- Backend пересоздан с временными настройками.
- Подтверждено состояние `status=running health=unhealthy`.
- Восстановлена основная конфигурация Healthcheck.
- Подтверждено состояние `status=running health=healthy`.
- Повторно получен HTTP-ответ `200 OK`.

## Созданные файлы

- `~/docker-lab/day18-compose/compose.yaml`
- `~/docker-lab/day18-compose/.env`
- `~/docker-lab/day18-compose/backend/Dockerfile`
- `~/docker-lab/day18-compose/nginx/default.conf`
- `~/docker-lab/day18-compose/compose.health-fail.yaml`
- `~/devops-learning/docker/day18.md`

## Итог дня

Освоены Docker Healthcheck, использование собственного Docker-образа с диагностическими инструментами, управление запуском зависимых сервисов, диагностика состояния контейнеров и восстановление приложения после отказа.

**Результат:** многоконтейнерное приложение работает через Nginx на порту 8084. Backend находится в состоянии `healthy`. Успешно воспроизведены и устранены ошибки `502 Bad Gateway` и `unhealthy`.
