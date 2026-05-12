-- Лабораторная работа 4, вариант 21

-- 4.1 Пронумеровать сотрудников, у которых не указана дата увольнения, по salesperson_id.
SELECT 
    salesperson_id, 
    first_name, 
    last_name, 
    ROW_NUMBER() OVER(ORDER BY salesperson_id) as employee_rank
FROM salespeople
WHERE termination_date IS NULL;
-- фильтрация данных в блоке WHERE для исключения уволенных сотрудников
-- определение порядка нумерации через ORDER BY внутри оконной функции по идентификатору сотрудника


-- 4.2 Для каждого письма показать тему текущего и тему следующего письма клиенту.
SELECT 
    customer_id, 
    email_subject as current_subject, 
    LEAD(email_subject) OVER(PARTITION BY customer_id ORDER BY email_id) as next_subject
FROM emails;
-- применение функции смещения LEAD для доступа к значению из следующей строки результирующего набора
-- использование PARTITION BY для группировки писем по конкретным клиентам


-- 4.3 Скользящий подсчет количества продаж (COUNT) за последние 3 дня по каждому дилеру.
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
-- расчет агрегатной функции COUNT в оконном режиме
-- использование оконного фрейма ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
