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

-- Find the highest sales of all orders.

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

-- Find the total number of rows
-- Find the total number of orders for each customers.
-- Additionally provide details such order Id, orderdate.

SELECT 
OrderID,
OrderDate,
CustomerID,
COUNT(*) OVER() TotalOrders,
COUNT(*) Over(Partition by CustomerID) OrdersByCustomer
FROM Salesdb.Orders;

-- Find the total number of customers.
-- Find the number of scores for the customers.
-- Additionally provide all customer details.

SELECT
*,
COUNT(*) OVER() TotalCustomers,
COUNT(Score) Over() TotalScore
FROM  Salesdb.customers; 

-- Check whether the table 'orders' contains any duplicate rows.

SELECT
	OrderID,
    Count(*) Over (partition by CustomerID) CheckPK
From salesdb.orders;

-- Find the total sales across all orders 
-- And the total sales for each product.
-- Additionally provide details such as order ID and order date.

SELECT
	OrderID,
	OrderDate,
	Sales,
	SUM(Sales) Over() TotalSales,
    SUM(Sales) Over(partition by productid) SalesByProduct
FROM salesdb.orders;

-- Find the average sales across all orders.
-- And find the average  sales for each product.
-- Additionally provide details such orderID, orderDate

SELECT
	OrderID,
	OrderDate,
	Sales,
	AVG(Sales) OVER () AvgSales,
    AVG(Sales) OVER (Partition by ProductID) AvgSalesByProducts
FROM salesdb.orders;

-- Find the average scores of customers.
-- Additionally provide details such CustomerID and Lastname.

SELECT
	CustomerID,
	LastName,
    Score,
	AVG(Score) Over() AvgScore
FROM salesdb.customers;

-- Find all orders where sales are higher than the average sales across all orders.
-- Here used subquerry

SELECT
*
FROM(
	SELECT
		OrderID,
		ProductID,
		Sales,
		AVG(Sales) Over() AvgSales
	From salesdb.orders
)t WHERE Sales > AvgSales;

-- Find the highest and lowest sales of all orders.
-- Find the highest and lowest sales for each product.
-- Additionally  provide details such OrderID, OrderDate.

SELECT
	OrderID,
	OrderID,
	ProductID,
	Max(Sales) Over() HighestSales,
	Min(Sales) Over() LowestSales,
    MAX(Sales) OVER(partition by ProductID) HighestSalesByProduct,
    MIN(Sales) OVER(partition by ProductID) LowestSalesByProduct
FROM salesdb.orders;

-- Show the employees who have the highest salary.

SELECT
*
FROM(
	SELECT
	*,
	MAX(Salary) Over() HighestSalary
	From salesdb.employees
) t where Salary = HighestSalary;

-- Find the deviation of each sales from the minimum and maximum sales amounts

SELECT
	OrderID,
	OrderID,
	ProductID,
    Sales,
	Max(Sales) Over() HighestSales,
	Min(Sales) Over() LowestSales,
    Sales - Min(Sales) Over() DeviationFromMin,
    Max(Sales) Over() - Sales DeviationFromMax
FROM salesdb.orders;

-- Calculate the moving avg of sales for each product over time.

SELECT
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	AVG(Sales) OVER(partition by ProductID) AvgByProduct,
  AVG(Sales) OVER(partition by ProductID order by OrderDate) MovingAvg
From salesdb.orders;
