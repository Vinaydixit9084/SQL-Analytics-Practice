-- CASE WHEN Statement

/* Create report showing total sales for each  of the following categories:
   High (sales over 50), Medium(sales 20-50), and Low (sales 200 or less)
   Sort the categories from highest sales to lowest */

SELECT
Category,
SUM(Sales) AS TotalSales
FROM(
	SELECT
	OrderId,
	Sales,
	CASE
		WHEN Sales > 50 Then 'High'
		WHEN Sales > 20 Then 'Medium'
		ELSE 'Low'
	END Category
	FROM salesdb.orders
)t
GROUP BY Category
ORDER BY TotalSales DESC;

-- Retrieve employee details with gender displayed as full text.

SELECT
EmployeeID,
FirstName,
LastName,
Gender,
CASE
	When Gender = 'F' Then 'Female'
    When Gender = 'M' Then 'Male'
    ELSE 'NA'
END GenderFullText
FROM salesdb.Employees;

-- Retrieve customers details with abbreviated country code.

SELECT
	CustomerID,
	FirstName,
	LastName,
	Country,
    CASE
		WHEN Country = 'Germany' THEN 'DE'
        WHEN Country = 'USA' THEN 'US'
        ELSE  'N/A'
	END CountryAbbr
From salesdb.customers;

-- Find the average scores of customers and treat Nulls as 0
-- Additionally proide details such CustomerID and LastName.

SELECT
CustomerID,
LastName,
Score,
CASE
	WHEN Score IS NULL THEN 0
    ELSE Score 
END ScoreClean,
AVG(Score) Over() AvgCustomer
FROM salesdb.customers;

-- Count how many times each customer has made and order with sales greater than 30

SELECT
    CustomerID,
    SUM(CASE
		 When Sales > 30 Then 1
         ELSE 0
	END) TotalOrderHighSales,
    COUNT(*) TotalOrders
FROM salesdb.orders
GROUP BY CustomerID