# День 38 — GitHub Actions: передача результатов между заданиями

## Цель
Научиться передавать результаты между заданиями GitHub Actions через outputs, использовать зависимости `needs` и проверять условное выполнение заданий для разных окружений.

### Практика 1. Проверка staging-check
- Изучена существующая конфигурация `.github/workflows/first-ci.yml`.
- Проверены `needs: validation`, условие запуска для `staging` и runner `ubuntu-latest`.
- Подтверждена корректность исходного workflow.

### Практика 2. Проверка зависимости validation
- Проверена зависимость `validation` от `basic-check`.
- Изучена передача результата через `needs.basic-check.outputs.check_result`.
- Проверена переменная `BASIC_CHECK_RESULT` и условие успешного результата `passed`.

### Практика 3. Передача результата validation
- В `validation` добавлен output `validation_result`.
- Добавлен шаг `Export validation result` с записью `status=passed` в `$GITHUB_OUTPUT`.
- В `staging-check` добавлена переменная `VALIDATION_RESULT`.
- Добавлен шаг `Verify validation result`, проверяющий значение `passed`.
- Изменения проверены через `git diff --check` и `git diff`.

### Практика 4. Проверка staging
- Обновлённый workflow отправлен в GitHub.
- Выполнен ручной запуск GitHub Actions #46 для `staging`.
- Все три задания завершились успешно.
- Подтверждён вывод `Validation result: passed`.

### Практика 5. Проверка testing
- Выполнен ручной запуск GitHub Actions #47 для `testing`.
- `basic-check` — Success.
- `validation` — Success.
- `staging-check` — Skipped.
- Общий результат workflow — Success.

## Изменённые и созданные файлы
- `.github/workflows/first-ci.yml` — передача output из `validation` в `staging-check`.
- `docker/day38.md` — журнал практик дня 38.

## Итог дня
Освоена передача результатов между заданиями GitHub Actions с использованием `$GITHUB_OUTPUT`, `outputs` и `needs`. Проверена работа условного задания для окружений `staging` и `testing`. Workflow успешно выполняется в обоих сценариях.
