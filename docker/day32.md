# День 32 — GitHub Actions: Environment Variables, Variables и Secrets

## Цель дня

Изучить управление переменными окружения в GitHub Actions, использование Repository Variables и Repository Secrets, а также научиться проверять их доступность в CI без раскрытия конфиденциальных данных.

### Практика 1. Проверка существующего workflow

Проверен файл `.github/workflows/first-ci.yml`.

- Проверено состояние Git-репозитория.
- Изучена структура существующих заданий `basic-check` и `validation`.
- Установлено, что переменные окружения ещё не были настроены.
- Подготовлен существующий workflow к расширению.

**Результат:** определены места для добавления переменных окружения.

### Практика 2. Переменные окружения уровня workflow

В начале `first-ci.yml` добавлен общий блок `env`:

- `APP_NAME=devops-learning`
- `APP_ENV=testing`
- `CI_VERSION=1.0`

В шаг `Check environment` добавлен вывод этих переменных.

Изменения сохранены в Git и отправлены на GitHub.

**Результат:** GitHub Actions успешно вывел значения общих переменных окружения в логах CI.

### Практика 3. Переменная окружения уровня job

В задании `validation` добавлена переменная:

- `VALIDATION_MODE=strict`

В шаг `Validate dependency` добавлен вывод значения `VALIDATION_MODE`.

Изменения отправлены в GitHub Actions.

**Результат:** задание `validation` завершилось успешно, в логах подтверждено `Validation mode: strict`.

### Практика 4. GitHub Repository Variables

В настройках GitHub-репозитория создана переменная:

- `DEPLOY_ENV=staging`

В общий блок `env` workflow добавлена ссылка:

`DEPLOY_ENV: ${{ vars.DEPLOY_ENV }}`

В шаге `Check environment` добавлен вывод `DEPLOY_ENV`.

**Результат:** GitHub Actions завершился успешно и вывел `Deploy environment: staging`.

### Практика 5. Проверка использования Repository Variable

Проверен запуск GitHub Actions после подключения `DEPLOY_ENV`.

- `basic-check` — Success.
- `validation` — Success.
- Артефакт `bash-test-report` — создан.
- В логах подтверждено получение значения из GitHub Repository Variables.

**Результат:** переменная репозитория корректно передаётся в CI.

### Практика 6. GitHub Repository Secrets

В настройках репозитория создан учебный секрет `DEMO_API_TOKEN`.

В задание `basic-check` добавлен шаг `Verify repository secret`.

- Секрет передаётся через `${{ secrets.DEMO_API_TOKEN }}`.
- Bash проверяет наличие непустого значения.
- При отсутствии секрета выполняется `exit 1`.
- Значение секрета не выводится в лог.

При первом запуске обнаружена ошибка YAML из-за неправильного отступа нового шага. Отступ исправлен, изменение закоммичено и отправлено в GitHub.

**Результат:** повторный запуск CI успешен. В логах появилось `Repository secret is available`. Значение секрета не раскрыто.

## Созданные и изменённые файлы

- `.github/workflows/first-ci.yml` — добавлены переменные окружения, использование Repository Variable и проверка Repository Secret.
- `docker/day32.md` — журнал практик дня 32.

## Итог дня

Изучены три уровня управления конфигурацией GitHub Actions:

- Workflow-level `env` — общие переменные.
- Job-level `env` — переменные конкретного задания.
- Repository Variables и Repository Secrets — настройки и конфиденциальные значения из GitHub.

Освоено использование контекстов `vars` и `secrets`, проверка переменных в логах, диагностика ошибок YAML и восстановление работоспособности CI.

**Финальный результат:** оба задания GitHub Actions выполняются успешно, Repository
