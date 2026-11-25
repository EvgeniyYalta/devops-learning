# День 47 — GitHub Actions: управление версиями Actions

## Цель дня

Изучить управление версиями GitHub Actions,
обновление зависимостей CI и фиксацию версий
через commit SHA для повышения безопасности.

### Практика 1. Аудит используемых версий Actions

Проверено состояние репозитория и существующего workflow.

```bash
git status --short # Проверка состояния репозитория
git log -1 --oneline # Просмотр последнего коммита
grep -n 'uses:' .github/workflows/first-ci.yml # Поиск используемых Actions
```

Обнаружены следующие зависимости:

- actions/checkout@v4
- actions/upload-artifact@v4
- actions/setup-python@v5

### Практика 2. Анализ доступных обновлений

Проанализированы предупреждения об устаревшем Node.js 20.

Подобраны версии Actions с поддержкой Node.js 24.

Проверена совместимость с GitHub Actions Runner 2.338.2.

### Практика 3. Обновление Actions

Обновлены версии зависимостей:

- checkout: v4 -> v5
- upload-artifact: v4 -> v6
- setup-python: v5 -> v6

Изменения проверены и отправлены на GitHub.

Коммит: 17c78ad.

Workflow #82 завершился успешно за 17 секунд.
Предупреждения Node.js 20 исчезли.
Артефакт bash-test-report успешно создан.

### Практика 4. Фиксация версий через commit SHA

Получены SHA используемых версий Actions.

```bash
git ls-remote https://github.com/actions/checkout.git refs/tags/v5 # Получение SHA checkout
git ls-remote https://github.com/actions/upload-artifact.git refs/tags/v6 # Получение SHA upload-artifact
git ls-remote https://github.com/actions/setup-python.git refs/tags/v6 # Получение SHA setup-python
```

Выполнена дополнительная проверка ссылок тегов
с использованием grep и регулярных выражений.

Теги версий заменены полными SHA коммитов.
Комментарии с номерами версий сохранены.

Изучен принцип SHA pinning и его применение
для повышения безопасности цепочки поставки ПО.

### Практика 5. Итоговая проверка CI

Изменения отправлены на GitHub.

Workflow #83 завершился успешно за 18 секунд.

Результаты:

- basic-check — Success.
- Все три matrix-check — Success.
- validation — Success.
- staging-check — Skipped.
- Артефакт bash-test-report создан.
- Предупреждения Node.js 20 отсутствуют.

Работоспособность CI после фиксации версий подтверждена.

## Итог дня

- Освоен аудит зависимостей GitHub Actions.
- Изучено управление версиями Actions.
- Выполнено обновление зависимостей.
- Изучена команда git ls-remote.
- Изучена проверка ссылок Git-тегов.
- Освоена фиксация зависимостей через commit SHA.
- Изучены основы Software Supply Chain Security.
- Проверена работоспособность CI после обновления.

## Созданные и изменённые файлы

- .github/workflows/first-ci.yml — изменён.
- docker/day47.md — создан.

## Результат

Все используемые Actions обновлены до версий
с поддержкой Node.js 24 и зафиксированы через SHA.

CI работает успешно без прежних предупреждений.
Дальнейшие обновления зафиксированных зависимостей
необходимо контролировать отдельно.
