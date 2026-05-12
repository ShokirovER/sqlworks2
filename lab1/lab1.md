# Лабораторная работа №1  
## Основы работы с SQL-запросами: выборка и модификация данных

**Вариант:** 21  

**Цель работы:**  
Научиться формировать запросы на выборку данных (SELECT) с использованием фильтрации, сортировки и логических операторов. Освоить операции манипулирования данными (CRUD: Create, Read, Update, Delete) в безопасной локальной среде.

---

# Задания

## Задание 1.1 — Товары дороже $30000

**Условие:**  
Товары (products) дороже $30000. Сортировка: цена убыв.

Скрипт для выполнения запроса:

```sql
SELECT *
FROM products
WHERE base_msrp > 30000
ORDER BY base_msrp DESC;
```
Выполнение запроса представлено на скриншоте:
<img width="1065" height="216" alt="лаб 1 фото 1" src="https://github.com/user-attachments/assets/2cef4345-96c9-466a-9a2a-23fe6ca95021" />

## Задание 1.2 — Письма, которые отскочили (bounced)

**Условие:**
Письма (emails), которые отскочили (bounced = 't' / 'Yes').

Скрипт для выполнения запроса:

```sql
SELECT *
FROM emails
WHERE bounced = 't';
```

Выполнение запроса представлено на скриншоте:
<img width="1477" height="521" alt="лаб 1 фото 2" src="https://github.com/user-attachments/assets/45d5509a-2aa1-4156-876b-c40f1422330d" />

## Задание 1.3 — Таблица failed_emails

**Условие:**
Таблица failed_emails (на основе emails с bounced).
Добавить столбец retry = 'N'. Удалить записи с темой 'Welcome'.

Скрипт для выполнения запроса:

```sql
DROP TABLE IF EXISTS failed_emails;

CREATE TABLE failed_emails AS 
SELECT * FROM emails;

ALTER TABLE failed_emails 
ADD COLUMN retry CHAR(1);

UPDATE failed_emails
SET retry = 'N';

DELETE FROM failed_emails
WHERE email_subject = 'Welcome';

SELECT * FROM failed_emails LIMIT 10;
```
Пояснение:

- создание таблицы-копии оператором CREATE TABLE

- расширение её структуры столбцом retry через ALTER TABLE

- массовое обновление значений оператором UPDATE

- выборочное удаление записей по условию в блоке WHERE

Выполнение запроса представлено на скриншоте:
<img width="1453" height="362" alt="лаб 1 задание 3" src="https://github.com/user-attachments/assets/30bee8e9-a6ae-4af7-800e-b622735a3de2" />

# Вывод

Выборка данных — сформированы SELECT-запросы с фильтрацией (WHERE) и сортировкой (ORDER BY).

Фильтрация по логическому полю — отработано условие bounced = 't'.

CRUD-операции — создана копия таблицы, добавлен новый столбец, выполнено массовое обновление и удаление по условию.

Все запросы отработали корректно. Полученные результаты соответствуют ожидаемым.

Файл [lab1.sql](lab1.sql) содержит чистый код выполненных запросов.

