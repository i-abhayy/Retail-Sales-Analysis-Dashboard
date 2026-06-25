USE ecommerce_project;
SHOW TABLES;
SELECT * FROM sales_data
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM sales_data;
DESCRIBE sales_data;

SELECT 
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS missing_profit,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS missing_qty
FROM sales_data;

SELECT `Order ID`, `Product ID`, COUNT(*)
FROM sales_data
GROUP BY `Order ID`, `Product ID`
HAVING COUNT(*) > 1;

SELECT SUM(Sales) AS total_revenue
FROM sales_data;

SELECT AVG(Sales) AS avg_sales
FROM sales_data;

SELECT COUNT(*) AS total_orders
FROM sales_data;

SELECT Product, SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Product
ORDER BY total_sales DESC
LIMIT 5;

SELECT Category, SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Category
ORDER BY total_sales DESC;

DESCRIBE sales_data;

ALTER TABLE sales_data
MODIFY `Order Date` DATE;

ALTER TABLE sales_data
MODIFY `Ship Date` DATE;

SELECT 
    DATE_FORMAT(Order_Date_Clean, '%Y-%m') AS month,
    SUM(Sales) AS monthly_sales
FROM sales_data
GROUP BY month
ORDER BY month;

SELECT * FROM sales_data LIMIT 5;


UPDATE sales_data
SET Order_Date_Clean = STR_TO_DATE(`Order Date`, '%m-%d-%Y');

UPDATE sales_data
SET Ship_Date_Clean = STR_TO_DATE(`Ship Date`, '%m-%d-%Y');

SELECT *
FROM sales_data
WHERE Profit < 0
ORDER BY Profit ASC;

SELECT `Customer Name`, SUM(Sales) AS total_spent
FROM sales_data
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 10;

SELECT Region, SUM(Sales) AS sales, SUM(Profit) AS profit
FROM sales_data
GROUP BY Region;

SELECT Category,
       SUM(Profit)/SUM(Sales)*100 AS profit_margin
FROM sales_data
GROUP BY Category;

SELECT `Ship Mode`, AVG(Profit) AS avg_profit
FROM sales_data
GROUP BY `Ship Mode`;


