USE `pizza_db`;

SELECT * FROM pizza_sales;

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

ALTER TABLE pizza_sales
ADD COLUMN o_date DATE;

SELECT order_date, 
STR_TO_DATE(order_date, '%d/%m/%Y')
FROM pizza_sales;

UPDATE pizza_sales
SET o_date = STR_TO_DATE(order_date, '%d/%m/%Y') WHERE order_date LIKE '%/%';

SELECT o_date 
FROM pizza_sales;

UPDATE pizza_sales
SET o_date = STR_TO_DATE(order_date, '%d-%m-%Y') WHERE order_date LIKE '%-%' AND o_date IS NULL ;

SELECT COUNT(o_date) from pizza_sales;

SELECT o_date FROM pizza_sales;

ALTER TABLE pizza_sales
DROP COLUMN order_date;

select * from pizza_sales;

select order_time,
TIME(order_time)
from pizza_sales;

SELECT STR_TO_DATE(order_time, '%H:%i:%s') FROM pizza_sales;

UPDATE pizza_sales
SET order_time = STR_TO_DATE(order_time, '%H:%i:%s');

SELECT * FROM pizza_sales;

SELECT COUNT(*), count(distinct pizza_id) FROM pizza_sales;