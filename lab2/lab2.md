# Лабораторная работа 2: Использование соединений (JOIN), подзапросов и функций преобразования данных

Номер варианта: 21

## Цель работы
Научиться объединять данные из нескольких таблиц с помощью операторов JOIN и UNION. Освоить применение подзапросов (Subqueries) для сложной фильтрации. Изучить функции очистки и подготовки данных: CASE WHEN, COALESCE, DISTINCT.

---

# Задания

## Задание 2.1: Вывести детали продаж (клиент, товар) для дилера с ID=10.

Скрипт для выполнения запроса:

```sql
SELECT 
    c.first_name, 
    c.last_name, 
    p.model, 
    s.sales_amount, 
    s.sales_transaction_date
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
WHERE s.dealership_id = 10;
```

Выполнение запроса представлено на скриншоте:
<img width="848" height="520" alt="лаб 2 задание 1" src="https://github.com/user-attachments/assets/02ee7d5d-0b37-4bda-a00f-09cd3ea535ab" />

---

## Задание 2.2: Найти клиентов, у которых сумма одной покупки превышала 50 000 с подзапросом.

Скрипт для выполнения запроса:

```sql
SELECT first_name, last_name, email
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM sales
    WHERE sales_amount > 50000
```

Выполнение запроса представлено на скриншоте:
<img width="585" height="515" alt="лаб 2 задание 2" src="https://github.com/user-attachments/assets/92dbc913-725f-4477-ae11-116e232b2b53" />

---

## Задание 2.3: Привести sales_transaction_date к формату 'YYYY-MM-DD'.


Скрипт для выполнения запроса:

```sql
SELECT 
    customer_id, 
    product_id, 
    sales_amount, 
    sales_transaction_date::DATE AS formatted_date
FROM sales
LIMIT 15;
```

Выполнение запроса представлено на скриншоте:
<img width="578" height="521" alt="лаб 2 задание 3" src="https://github.com/user-attachments/assets/c3f33141-d717-4f1e-836b-35f2f657fa46" />

---

# Вывод

В ходе лабораторной работы были:

- выполнены запросы с использованием JOIN для объединения таблиц;

- использована конструкция CASE для классификации данных по заданным условиям.

Файл [lab2.sql](lab2.sql) содержит код с комментариями для выполненных выполненных запросов.


