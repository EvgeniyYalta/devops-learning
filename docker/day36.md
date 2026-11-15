# День 36 — GitHub Actions: передача результатов между jobs

## Цель дня

Научиться передавать результаты выполнения одного задания GitHub Actions другому, проверять успешные и ошибочные сценарии, использовать outputs и зависимости между jobs.

### Практика 1. Передача outputs между jobs

- Изучена передача данных через `$GITHUB_OUTPUT`.
- В job `basic-check` добавлен шаг `Export check result` с идентификатором `export_result`.
- Настроен output `check_result` со значением `passed`.
- В job `validation` результат получен через `needs.basic-check.outputs.check_result`.
- Добавлена проверка полученного результата командой `test`.

**Результат:** workflow `#37` завершился успешно, в логах `validation` отображалось `Basic check result: passed`.

### Практика 2. Проверка ошибочного результата

- В шаге `Export check result` значение `status=passed` временно заменено на `status=failed`.
- Изменения сохранены в Git и отправлены на GitHub.
- Проверено поведение зависимого задания `validation`.

**Результат:** workflow `#38` завершился с ошибкой. Job `basic-check` выполнился успешно, а `validation` завершился с `exit code 1`. В логах отображалось `Basic check result: failed`.

### Практика 3. Восстановление успешного результата

- Значение output возвращено на `status=passed`.
- Изменения сохранены в Git и отправлены на GitHub.
- Повторно проверено выполнение обоих jobs.

**Результат:** workflow `#39` завершился успешно. Оба задания — `basic-check` и `validation` — выполнились без ошибок.

## Изменённые файлы

- `.github/workflows/first-ci.yml` — добавлены job outputs, передача результата и проверка зависимости.
- `docker/day36.md` — журнал выполненных практик.

## Git-коммиты

- `f2537f3` — `Day 36: Pass outputs between GitHub Actions jobs`
- `f71abb2` — `Day 36: Test failed job output`
- `7acb7c4` — `Day 36: Restore successful job output`

## Итог дня

Освоена передача результатов между заданиями GitHub Actions с использованием `$GITHUB_OUTPUT`, `steps`, `jobs` и `needs`.

Проверены оба сценария: успешный результат `passed` и ошибочный результат `failed`. Подтверждено, что зависимое задание может использовать результат предыдущего задания для проверки и завершаться с соответствующим кодом возврата.

Рабочий CI восстановлен до успешного состояния.
