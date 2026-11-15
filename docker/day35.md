
# День 35 — GitHub Actions: условное выполнение шагов

## Цель
Научиться управлять выполнением шагов GitHub Actions с помощью условий `if` и параметров ручного запуска.

### Практика 1. Проверка существующего workflow
- Проверен `.github/workflows/first-ci.yml`.
- Подтверждены автоматический запуск через `push` и ручной запуск через `workflow_dispatch`.
- Проверен параметр `target_environment` со значениями `testing` и `staging`.
- Подтверждено чистое состояние Git перед изменениями.

### Практика 2. Добавление условий if
- Добавлены два шага: `Check testing environment` и `Check staging environment`.
- Для каждого шага настроено условие `if`.
- Использовано выражение `inputs.target_environment || 'testing'`.
- Проверены отступы YAML и изменения через `git diff --check` и `git diff`.

### Практика 3. Автоматический запуск CI
- Изменения сохранены в Git, коммит `7e336c4`.
- Изменения отправлены в GitHub.
- Запуск GitHub Actions #33 завершился успешно.
- Шаг `Check testing environment` выполнен.
- Шаг `Check staging environment` пропущен.
- Задания `basic-check` и `validation` завершились успешно.

### Практика 4. Ручной запуск с testing
- Выполнен ручной запуск GitHub Actions #34 с параметром `testing`.
- Шаг `Check testing environment` завершился успешно.
- Шаг `Check staging environment` пропущен.
- На момент проверки `basic-check` завершился успешно, `validation` ещё выполнялся.

### Практика 5. Ручной запуск с staging
- Выполнен ручной запуск GitHub Actions #35 с параметром `staging`.
- Workflow завершился успешно.
- Шаг `Check testing environment` пропущен.
- Шаг `Check staging environment` выполнен успешно.
- В логах подтверждено: `Running checks for STAGING environment`.
- Задания `basic-check` и `validation` завершились успешно.

### Практика 6. Итоговая проверка
- Проверены условия `if` в `.github/workflows/first-ci.yml`.
- Проверен последний коммит `7e336c4`.
- Подтверждена синхронизация ветки `main` с `origin/main`.
- Подтверждено отсутствие незакоммиченных изменений до создания журнала.

## Изменённые и созданные файлы
- `.github/workflows/first-ci.yml` — добавлены условия для окружений.
- `docker/day35.md` — журнал обучения.

## Итог дня
- Изучены условия `if` в GitHub Actions.
- Освоено условное выполнение и пропуск шагов.
- Проверена работа условий при автоматическом и ручном запуске.
- Подтверждено переключение между окружениями `testing` и `staging`.
- Существующие проверки CI сохранены и продолжают работать.

