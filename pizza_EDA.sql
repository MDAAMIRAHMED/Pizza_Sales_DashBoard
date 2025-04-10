USE `pizza_db`;

SELECT * FROM pizza_sales;

-- KEY REQUIREMENTS


-- TOTAL REVENUE
SELECT ROUND(SUM(total_price),2) AS Total_Revenue FROM pizza_sales;

-- TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- AVG ORDER VALUE
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2) AS Avg_Order_Value FROM pizza_sales;

-- TOTAL PIZZAS SOLD
SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;

-- AVG PIZZAS PER ORDER
SELECT ROUND(SUM(quantity)/ COUNT(DISTINCT order_id), 2) AS Avg_Pizzas_Per_Order FROM pizza_sales;


-- CHART REQUIREMENTS


-- DAILY TREND FOR TOTAL ORDERS
SELECT DAYNAME(o_date)
FROM pizza_sales;

SELECT DAYNAME(o_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DAYNAME(o_date) 
ORDER BY 2 DESC;

-- HOURLY TREND FOR TOTAL ORDERS
SELECT HOUR(order_time) 
FROM pizza_sales;

SELECT HOUR(order_time) AS Order_Hour, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);

-- PERCENTAGE OF SALES PER PIZZA CATEGORY

SELECT pizza_category, ROUND(SUM(total_price),2) AS Total_Sales, 
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_category
ORDER BY 3 DESC;

-- PERCENTAGE OF SALES PER PIZZA SIZE
SELECT pizza_size, ROUND(SUM(total_price),2) AS Total_Sales, 
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY 3 DESC;

SELECT pizza_size, ROUND(SUM(total_price),2) AS Total_Sales, 
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE QUARTER(o_date) = 1),2) AS PCT
FROM pizza_sales
WHERE QUARTER(o_date) = 1
GROUP BY pizza_size
ORDER BY 3 DESC;

-- TOTAL PIZZAS SOLD PER PIZZA CATEGORY
SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY 2 DESC;

-- (EXTRA) TOTAL PIZZAS SOLD PER PIZZA SIZE
SELECT pizza_size, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_size
ORDER BY 2 DESC;

-- TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 DESC
LIMIT 5;

-- BOTTOM 5 WORST SELLERS BY TOTAL PIZZAS SOLD
SELECT pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2
LIMIT 5;

select * from pizza_sales;

