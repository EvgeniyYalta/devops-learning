# День 11 — Docker: основы

## Цель

Освоить базовые операции Docker: образы, контейнеры, сети, volumes, bind mounts и Dockerfile.

## Практики

1. **Установка и проверка Docker** — установлен Docker Engine, проверена работа Docker через `hello-world`.

2. **Образы** — изучены `docker images`, `docker pull`, просмотр информации об образе и его размерах.

3. **Контейнеры** — изучены запуск, остановка, удаление и просмотр контейнеров через `docker run`, `docker start`, `docker stop`, `docker rm`, `docker ps`.

4. **Inspect и состояние контейнера** — через `docker inspect` проверены статус, exit code, используемый образ и параметры контейнера.

5. **Docker networking** — просмотрены стандартные сети `bridge`, `host`, `none`; исследована сеть `bridge` и адрес контейнера `172.17.0.2`.

6. **Работа внутри контейнера** — использован `docker exec`; проверена таблица маршрутизации и hosts внутри контейнера.

7. **Docker volumes** — создан `app-data`, проверен через `docker volume ls` и `docker volume inspect`; данные записаны в volume и прочитаны из другого контейнера.

8. **Bind mount** — каталог хоста подключён в Nginx-контейнер через `-v`; содержимое проверено через `curl`. Также проверен режим `:ro` — запись из контейнера запрещена.

9. **Dockerfile** — создан собственный Dockerfile на базе `nginx:latest` с копированием пользовательского `index.html`.

10. **Сборка собственного образа** — собран образ `my-nginx:1.0` командой `docker build`.

11. **Запуск собственного образа** — контейнер `my-nginx-test` запущен с публикацией порта `8081:80`; через `curl` получен пользовательский HTML.

12. **Логи и история образа** — просмотрены `docker logs`, `docker history` и параметры собственного образа через `docker image inspect`.

## Созданные файлы

- `docker-lab/site/index.html`
- `docker-lab/dockerfile-practice/Dockerfile`
- `docker-lab/dockerfile-practice/index.html`
- `docker/day11.md`

## Результат

Docker установлен и проверен.

Освоены базовые операции с образами и контейнерами, Docker networking, volumes и bind mounts.

Создан собственный Docker image `my-nginx:1.0` на базе Nginx, запущен контейнер и проверена выдача пользовательского HTML через опубликованный порт.
