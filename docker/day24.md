# День 24 — Docker: финальный проект

## Цель
Собрать и проверить Docker Compose-проект из двух сервисов: Nginx и backend. Закрепить работу с сетями, reverse proxy, диагностикой отказов и восстановлением сервисов.

## Практика 1. Подготовка проекта
- Создали каталог `~/docker-lab/day24-final-project`.
- Проверили Docker Engine и Docker Compose.
- Проверили состояние работающих контейнеров.

## Практика 2. Конфигурация Docker Compose
- Создали `compose.yaml`.
- Настроили сервисы `backend` и `nginx`.
- Использовали образы `hashicorp/http-echo:1.0.0` и `nginx:latest`.
- Настроили сеть `app-network`, зависимость сервисов и политику `unless-stopped`.
- Проверили конфигурацию через `docker compose config`.

## Практика 3. Настройка reverse proxy
- Создали `nginx/default.conf`.
- Настроили `proxy_pass http://backend:5678`.
- Опубликовали Nginx на порту `8089`.
- Запустили проект через Docker Compose.
- Получили `200 OK` и `Day 24 Backend OK`.

## Практика 4. Проверка Docker-сети
- Проверили сеть `day24-final-project_app-network`.
- Драйвер: `bridge`.
- Подсеть: `172.26.0.0/16`.
- Backend: `172.26.0.2`.
- Nginx: `172.26.0.3`.

## Практика 5. Проверка связи контейнеров
- Проверили DNS-разрешение имени `backend` внутри Nginx.
- Выполнили HTTP-запрос из Nginx к `http://backend:5678/`.
- Получили `200 OK` и `Day 24 Backend OK`.

## Практика 6. Имитация отказа backend
- Остановили backend через `docker compose stop backend`.
- Убедились, что Nginx продолжает работать.
- При первом запросе получили тайм-аут клиента через 5 секунд.
- Восстановили backend через `docker compose start backend`.
- Подтвердили возвращение `200 OK`.

## Практика 7. Диагностика логов и конфигурации
- Изучили журналы Nginx и backend.
- Обнаружили HTTP `499` при преждевременном закрытии соединения клиентом.
- Проверили `proxy_pass` и конфигурацию Nginx.
- Команда `nginx -t` завершилась успешно.

## Практика 8. Проверка HTTP 502
- Повторно остановили backend.
- Увеличили время ожидания curl до 75 секунд.
- Получили `502 Bad Gateway`.
- Повторно запустили backend.
- Подтвердили восстановление HTTP `200 OK`.

## Практика 9. Финальная диагностика
- Проверили `docker compose config --quiet`.
- Проверили состояние обоих сервисов.
- Подтвердили политику `unless-stopped`.
- Проверили HTTP-доступность приложения.
- В логах Nginx обнаружили `connect() failed (113: No route to host)` во время отказа backend.
- После восстановления получили `200 OK`.

## Созданные файлы
- `~/docker-lab/day24-final-project/compose.yaml`
- `~/docker-lab/day24-final-project/nginx/default.conf`
- `~/devops-learning/docker/day24.md`

## Итог дня
Собран работающий двухконтейнерный проект с Nginx в роли reverse proxy и отдельным backend.

Закреплены:
- Docker Compose и межконтейнерная сеть.
- DNS-обращение по имени сервиса.
- Настройка reverse proxy.
- Диагностика HTTP 499, 502 и логов Nginx.
- Остановка и восстановление backend.
- Проверка restart policy.

**Результат:** оба сервиса работают, приложение доступно через `http://localhost:8089/`, возвращает `200 OK` и `Day 24 Backend OK`.
