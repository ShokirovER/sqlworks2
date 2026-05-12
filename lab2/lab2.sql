-- Лабораторная работа 2, вариант 21

-- 2.1 Вывести детали продаж (клиент, товар) для дилера с ID=10.
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
-- выбор целевых столбцов из таблиц продаж, клиентов и продуктов
-- соединение таблицы sales с таблицей customers по идентификатору клиента
-- дополнительное объединение с таблицей products для получения названий моделей товаров
-- фильтрация итоговой выборки по идентификатору дилерского центра


-- 2.2 Найдите клиентов, у которых сумма одной покупки превышала 50 000 (подзапрос).
SELECT first_name, last_name, email
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM sales
    WHERE sales_amount > 50000
);
-- формирование внутреннего подзапроса для поиска уникальных ID клиентов в таблице sales
-- установка фильтра во вложенном запросе по сумме сделки свыше 50 000 единиц
-- передача полученного списка идентификаторов во внешний запрос через оператор IN
-- извлечение контактных данных соответствующих клиентов из основной таблицы customers


-- 2.3 Приведите sales_transaction_date к формату 'YYYY-MM-DD' (через ::DATE).
SELECT 
    customer_id, 
    product_id, 
    sales_amount, 
    sales_transaction_date::DATE AS formatted_date
FROM sales
LIMIT 15;
-- определение набора выводимых полей из таблицы транзакций
-- применение оператора приведения типов ::DATE к столбцу sales_transaction_date
-- назначение псевдонима formatted_date для модифицированного столбца
