# День 16 — Nginx Reverse Proxy и Docker Networking

## Цель
Настроить Nginx как обратный прокси для backend-приложения в Docker, изучить взаимодействие контейнеров по сети, обработку ошибок и передачу HTTP-заголовков.

## Практика 1. Запуск backend
- Проверены свободные порты 8082 и 9000.
- Загружен образ hashicorp/http-echo:1.0.0.
- Запущен контейнер backend-day16 на порту 9000.
- HTTP-запрос подтвердил ответ 200 OK и текст Hello from DevOps Backend.

## Практика 2. Docker Networking
- Создана пользовательская bridge-сеть day16-network.
- Backend подключён к сети.
- Через docker network inspect проверены параметры сети и IP-адрес контейнера.
- Проверено обращение к backend по имени контейнера внутри Docker-сети.

## Практика 3. Nginx Reverse Proxy
- Создан файл nginx-day16/conf.d/default.conf.
- Настроен proxy_pass на backend-day16:5678.
- Добавлена передача заголовков Host, X-Real-IP, X-Forwarded-For и X-Forwarded-Proto.
- Запущен контейнер nginx-day16 в сети day16-network с публикацией порта 8082.
- Проверка nginx -t выполнена успешно.
- Запрос через Nginx вернул 200 OK и ответ backend-приложения.

## Практика 4. Диагностика и HTTP-заголовки
- Проверена работа backend через Nginx и напрямую.
- Остановлен backend-day16 для моделирования сбоя.
- Nginx вернул 502 Bad Gateway; ошибка подтверждена в логах.
- После запуска backend работа прокси восстановлена, получен 200 OK.
- Проверена обработка запроса с заголовком Host: devops.local.
- Запущен временный диагностический контейнер headers-day16.
- Проверена фактическая передача заголовков Host, X-Real-IP, X-Forwarded-For и X-Forwarded-Proto.
- Исходная конфигурация proxy_pass восстановлена.
- Диагностический контейнер удалён.
- Финальная проверка Nginx вернула 200 OK и Hello from DevOps Backend.

## Созданные файлы
- ~/docker-lab/nginx-day16/conf.d/default.conf — конфигурация обратного прокси.
- ~/docker-lab/nginx-day16/default.conf.backup — резервная копия конфигурации.
- docker/day16.md — учебный дневник.

## Итог дня
Освоена настройка Nginx Reverse Proxy в Docker, взаимодействие контейнеров через пользовательскую сеть, передача HTTP-заголовков и диагностика ошибки 502 Bad Gateway. Основной backend и Nginx работают, конфигурация восстановлена и проверена.

