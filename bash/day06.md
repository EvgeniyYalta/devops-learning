# Day 6 — Linux processes и Bash process checker

Дата: 16.09.2026

## Изучил

- Linux processes
- PID
- ps
- ps aux
- pgrep
- top
- background processes
- `&`
- kill
- SIGTERM
- exit code
- аргументы Bash
- `$1`

## Процессы

Процесс — это выполняющаяся программа.

Каждый процесс имеет PID — уникальный идентификатор процесса.

Пример:

```bash
pgrep sshd

## Bash-функции

Изучил создание и использование функций Bash.

### check_disk()

Проверяет процент использования корневого раздела `/`.

```bash
check_disk() {
    disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

    echo "Disk usage: $disk_usage%"

    if [ "$disk_usage" -lt 80 ]; then
        echo "[OK] Disk usage is normal"
        return 0
    else
        echo "[WARNING] Disk usage is high"
        return 1
    fi
}

### check_memory()

Проверяет процент использования оперативной памяти.

```bash
# Получаем информацию о памяти
free

# Получаем процент использования RAM
memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

# Выводим процент использования памяти
echo "Memory usage: $memory_usage%"

# Проверяем, используется ли меньше 80% памяти
if [ "$memory_usage" -lt 80 ]; then

    # Память используется нормально
    echo "[OK] Memory usage is normal"

    # Возвращаем код 0 — успешно
    return 0

else

    # Память используется слишком сильно
    echo "[WARNING] Memory usage is high"

    # Возвращаем код 1 — ошибка
    return 1
fi

### check_service()

Проверяет состояние Linux-сервиса.

```bash
# $1 — имя сервиса, например ssh или chrony
check_service() {

    # Показываем название проверяемого сервиса
    echo "Checking service: $1"

    # Проверяем, запущен ли сервис
    if systemctl is-active --quiet "$1"; then

        # Сервис работает
        echo "[OK] $1 is running"

        # Возвращаем код 0 — успешно
        return 0
    else

        # Сервис не работает
        echo "[ERROR] $1 is not running"

        # Возвращаем код 1 — ошибка
        return 1
    fi
}

### server_health()

Главная функция, которая объединяет все проверки сервера.

```bash
# Общая проверка состояния сервера
server_health() {

    # Счётчик найденных ошибок
    errors=0

    # Проверяем диск
    echo ">>> Checking disk"
    check_disk

    # Если проверка диска завершилась ошибкой
    if [ $? -ne 0 ]; then
        errors=$((errors + 1))
    fi

    # Проверяем оперативную память
    echo ">>> Checking memory"
    check_memory

    # Если проверка памяти завершилась ошибкой
    if [ $? -ne 0 ]; then
        errors=$((errors + 1))
    fi

    # Проверяем SSH
    echo ">>> Checking SSH"
    check_service ssh

    # Если SSH не работает
    if [ $? -ne 0 ]; then
        errors=$((errors + 1))
    fi

    # Выводим результат проверки
    echo ""
    echo "===== RESULT ====="

    # Если ошибок нет
    if [ "$errors" -eq 0 ]; then
        echo "SERVER STATUS: HEALTHY"
    else
        echo "SERVER STATUS: WARNING"
    fi

    # Показываем количество ошибок
    echo "Errors: $errors"

    # Возвращаем общий результат
    if [ "$errors" -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

### Коды возврата

Изучил использование кодов возврата Bash.

```bash
# Показываем код возврата последней команды
echo $?

# 0 — успешное выполнение
# 1 — ошибка

## Итоговая функция server_health()

Создал отдельный Bash-скрипт `server_health.sh`,
который объединяет несколько проверок сервера.

Скрипт проверяет:

- использование диска;
- использование оперативной памяти;
- состояние SSH;
- состояние Chrony.

### Функция check_service()

Проверяет состояние Linux-сервиса через `systemctl`.

Функция принимает имя сервиса через `$1`.

Пример:

```bash
check_service ssh
check_service chrony
