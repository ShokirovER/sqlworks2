--Лабораторная работа 1. Вариант 21
--1.1 Товары (products) дороже $30000. Сортировка: цена убыв.
SELECT *
FROM products
WHERE base_msrp > 30000
ORDER BY base_msrp DESC;
--Для формирования выборки используется оператор SELECT совместно с предложением WHERE, в котором задано условие фильтрации base_msrp > 30000. Для упорядочивания данных по стоимости от дорогих к дешевым применена конструкция ORDER BY с параметром DESC.

--1.2 Письма (emails), которые отскочили (bounced = 't'/'Yes').
SELECT *
FROM emails
WHERE bounced = 't';
--Для формирования выборки используется оператор SELECT совместно с предложением WHERE, в котором задано условие фильтрации bounced = 't'. Данное условие позволяет извлечь из таблицы emails только те записи, которые имеют логический признак возврата письма.

--1.3 Таблица failed_emails (bounced). Добавить retry='N'. Удалить тему 'Welcome'.

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

--создание таблицы-копии оператором CREATE TABLE
--расширение её структуры столбцом retry через ALTER TABLE
--массовое обновление значений оператором UPDATE
--выборочное удаление записей по условию в блоке WHERE
