# Лабораторная работа 4. Оконные функции для анализа данных

Номер варианта: 21

## Цель работы
Изучить концепцию оконных функций в SQL и научиться применять их для выполнения сложных аналитических расчетов: ранжирования, вычисления скользящих средних, нарастающих итогов и сравнительного анализа строк без группировки данных.

## Задачи
- Разобрать синтаксис оконных функций: предложение OVER, PARTITION BY, ORDER BY и ROWS/RANGE.
- Научиться использовать функции ранжирования: ROW_NUMBER(), RANK(), DENSE_RANK(), NTILE().
- Освоить функции смещения для доступа к предыдущим и следующим строкам: LAG(), LEAD().
- Применить агрегатные функции в качестве оконных для вычисления накопительных итогов и скользящих статистик.

# Задания

## Задание 4.1: Пронумеровать сотрудников, у которых не указана дата увольнения, по salesperson_id.

Скрипт для выволнения запроса:

```sql
SELECT 
    salesperson_id, 
    first_name, 
    last_name, 
    ROW_NUMBER() OVER(ORDER BY salesperson_id) as employee_rank
FROM salespeople
WHERE termination_date IS NULL;
```

Выполнение запроса представлено на скриншоте:

<img width="556" height="517" alt="лаб 4 задание 1" src="https://github.com/user-attachments/assets/8f9491f4-c2d5-4d88-b990-44dfcfb47b07" />


## Задание 4.2: Для каждого письма показать тему текущего и тему следующего письма клиенту.

Скрипт для выволнения запроса:

```sql
SELECT 
    customer_id, 
    email_subject as current_subject, 
    LEAD(email_subject) OVER(PARTITION BY customer_id ORDER BY email_id) as next_subject
FROM emails;
```

Выполнение запроса представлено на скриншоте:

<img width="857" height="520" alt="лаб 4 задание 2" src="https://github.com/user-attachments/assets/eab15af1-d966-46d8-aac2-b4a24c9b0b94" />


## Задание 4.3: Скользящий подсчет количества продаж (COUNT) за последние 3 дня по каждому дилеру.

Скрипт для выволнения запроса:

```sql
SELECT 
    dealership_id, 
    sales_transaction_date::DATE, 
    sales_amount,
    COUNT(*) OVER(
        PARTITION BY dealership_id 
        ORDER BY sales_transaction_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) as rolling_count
FROM sales;
```

Выполнение запроса представлено на скриншоте:

<img width="698" height="522" alt="лаб 4 задание 3" src="https://github.com/user-attachments/assets/eeddaf0a-79cd-4547-a85e-61f2aed42a4d" />


## Вывод

В ходе выполнения лабораторной работы были получены знания о применении оконные функции с использованием синтаксиса OVER(), PARTITION BY и ORDER BY, использовании функций ранжирования ROW_NUMBER(), RANK(), DENSE_RANK(), а также вычислении скользящих минимумов и максимумов с помощью оконных агрегатных функций.

Файл [lab4.sql](lab4.sql) содержит код с подробными комментариями для выполненных запросов.


