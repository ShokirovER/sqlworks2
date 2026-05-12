-- Лабораторная работа 3, вариант 21

-- 3.1 Найти среднеквадратичное отклонение продаж.
SELECT 
    STDDEV(sales_amount) as sales_stddev
FROM sales;
-- использование STDDEV для расчета среднеквадратичного отклонения


-- 3.2 Сгруппировать продукты по первой букве типа, найти среднюю цену.
SELECT 
    LEFT(product_type, 1) as type_first_letter, 
    AVG(base_msrp) as average_price
FROM products
GROUP BY LEFT(product_type, 1);
-- использование функции LEFT для извлечения первого символа из названия типа продукта
-- расчет средней стоимости с помощью функции AVG по столбцу base_msrp
-- группировка результатов по вычисленному первому символу


-- 3.3 Вывести штаты, где разница между max и min продажей > 1000.
SELECT 
    d.state
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
GROUP BY d.state
HAVING (MAX(s.sales_amount) - MIN(s.sales_amount)) > 1000;
-- объединение таблицы продаж sales и таблицы дилерских центров dealerships
-- группировка данных по столбцу state
-- вычисление разницы между максимальным и минимальным чеком внутри каждого штата
-- фильтрация групп с помощью оператора HAVING
