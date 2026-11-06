#!/bin/bash

# Прерываем выполнение при ошибке команды
set -e

# Каталог для результатов CI
REPORT_DIR="ci/reports"

# Создаём каталог, если его нет
mkdir -p "$REPORT_DIR"

# Файл итогового отчёта
REPORT_FILE="$REPORT_DIR/test-report.txt"

# Проверяем синтаксис Bash-скрипта
bash -n ci/scripts/file_check.sh

# Формируем отчёт
{
    echo "DevOps CI Test Report"
    echo "====================="
    echo "Date: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo "Bash syntax check: PASSED"
    echo "Tested script: ci/scripts/file_check.sh"
    echo "Report generation: SUCCESS"
} > "$REPORT_FILE"

# Показываем результат
echo "CI report created: $REPORT_FILE"
cat "$REPORT_FILE"
