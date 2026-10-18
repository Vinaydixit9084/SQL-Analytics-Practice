-- Aggregate Functions

-- Find the total sales of all orders.

SELECT
COUNT(*) AS total_nr_orders,
SUM(sales) AS total_sales
FROM mydatabase.orders;

-- Find the avg sales of all orders.

SELECT
COUNT(*) AS total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales
FROM mydatabase.orders;

-- Find the highest sales of all orders..

SELECT
COUNT(*) AS total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,
MAX(sales) AS highest_sales
FROM mydatabase.orders;

-- Find the lowest sales of all orders.

SELECT
COUNT(*) AS total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,
MAX(sales) AS highest_sales,
MIN(sales) AS lowest_sales
FROM mydatabase.orders;

