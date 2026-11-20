-- Step1: Find the total sales per customer.

WITH CTE_Total_Sales AS
(
SELECT
	CustomerID,
	SUM(Sales) 	AS TotalSales
FROM salesdb.orders
GROUP BY CustomerID
)

-- Main Query
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales
FROM salesdb.customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID

