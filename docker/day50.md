# День 50 — GitHub Actions: Branch Protection и Rulesets

## Цель

Освоить защиту основной ветки репозитория, обязательные CI-проверки и публикацию изменений через Pull Request.

### Практика 1. Проверка существующей конфигурации

- Проверено состояние локального репозитория.
- Проверены триггеры GitHub Actions в файле `.github/workflows/first-ci.yml`.
- Подтверждено наличие событий `push`, `pull_request` и `workflow_dispatch`.
- Изучены настройки Branch Protection и Rulesets.
- Установлено отсутствие существующих правил защиты ветки.

### Практика 2. Создание Ruleset

В настройках GitHub создано правило `Protect main branch`.

Настроены параметры:

- Enforcement status — Active.
- Target branches — Default (`main`).
- Bypass list — пустой.
- Restrict deletions — включено.
- Block force pushes — включено.
- Require a pull request before merging — включено.
- Required approvals — 0.
- Require status checks to pass — включено.
- Require branches to be up to date before merging — включено.

Добавлены обязательные CI-проверки:

- `basic-check`
- `validation`
- `matrix-check (testing, 3.11)`
- `matrix-check (testing, 3.12)`
- `matrix-check (staging, 3.12)`

Проверка `staging-check` не включена в список обязательных, поскольку выполняется условно.

Правило успешно создано и активировано.

### Практика 3. Проверка блокировки прямого push

Создан пустой тестовый коммит в ветке `main`.

```bash
git commit --allow-empty -m "Day 50: Test branch protection" # Создание тестового коммита
git push origin main # Проверка возможности прямой публикации
```

GitHub отклонил публикацию с ошибкой GH013.

Причины отказа:

- Изменения должны публиковаться через Pull Request.
- Необходимо прохождение пяти обязательных CI-проверок.

Тестовый коммит сохранён в отдельной ветке.

```bash
git branch day50-protection-test # Сохранение тестового коммита в отдельной ветке
git reset --keep origin/main # Восстановление локальной main
git switch day50-protection-test # Переход в тестовую ветку
```

Результат: защита основной ветки работает.

### Практика 4. Проверка обязательных CI-проверок

Тестовая ветка опубликована на GitHub.

```bash
git push -u origin day50-protection-test # Публикация тестовой ветки
```

Создан Pull Request №6 — `Day 50: Test branch protection`.

GitHub Actions автоматически запустил CI.

Результаты:

- Пять обязательных проверок успешно пройдены.
- Все обязательные проверки отмечены статусом Required.
- Условная проверка staging-check пропущена.
- Слияние Pull Request разрешено.

### Практика 5. Завершение Pull Request и итоговая проверка

Pull Request №6 успешно объединён с веткой main.

Merge commit: `87f3ac6`.

После слияния автоматически запущен CI №92.

Результаты:

- Статус — Success.
- Пять успешных проверок.
- Одна пропущенная проверка.
- Время выполнения — 16 секунд.
- Артефакт `bash-test-report` успешно создан.

Выполнена синхронизация локального репозитория.

```bash
git switch main # Переход в основную ветку
git pull --ff-only # Получение изменений с GitHub
git branch -d day50-protection-test # Удаление локальной тестовой ветки
git fetch --prune # Очистка устаревших ссылок на удалённые ветки
git branch -a # Проверка списка веток
git status # Проверка состояния репозитория
git log -3 --oneline # Проверка истории коммитов
```

Локальная и удалённая ветки синхронизированы. Рабочая директория чистая.

## Созданные файлы и конфигурации

- `docker/day50.md` — журнал обучения.
- `Protect main branch` — активное правило защиты ветки в GitHub.

## Итог дня

- Изучены GitHub Rulesets и Branch Protection.
- Настроена защита основной ветки.
- Заблокирован прямой push в main.
- Заблокированы принудительная публикация и удаление защищённой ветки.
- Настроены обязательные CI-проверки.
- Проверена публикация изменений через Pull Request.
- Проверена автоматическая работа CI после слияния.
- Освоен защищённый Git workflow.

Результат: защита основной ветки настроена, блокировка прямого push подтверждена экспериментально, публикация через Pull Request успешно проверена.
