-- Find the products that have a price higher than the  avg price of all products.
-- Main Query
SELECT
*
FROM
-- Subquery
	(SELECT
	ProductID,
	Price,
	AVG(Price) Over() AvgPrice
    FROM salesdb.Products)t
WHERE Price > AVGPrice;

-- Rank Customers based on their total amount of sales.

SELECT
*,
RANK() OVER (ORDER BY TotalSales DESC) CustomerRank
FROM
	(SELECT
	CustomerID,
	SUM(Sales) Totalsales
	FROM salesdb.Orders
	group by CustomerID)t;
    
-- Show the productIDs, Product Names, prices and the total number of orders.

SELECT
ProductID,
Product,
Price,

	(SELECT Count(*)  FROM salesdb.orders) AS TotalOrders
FROM salesdb.Products;

-- Find the products that have a price higher than the average price of all products.

SELECT
ProductID,
Price,
(SELECT AVG(Price) FROM salesdb.Products) AVGPrice
FROM salesdb.Products
WHERE Price > (SELECT AVG(Price) FROM salesdb.Products);

-- Show the details of orders made by customers in Germany.

SELECT
* 
FROM salesdb.Orders
WHERE CustomerID IN
	(SELECT
	CustomerID
	FROM salesdb.Customers
	WHERE Country = 'Germany');
    
-- Find female employees whose salaries are greater than the salaries of any male employees

SELECT
	EmployeeID,
    FirstName,
    Salary
FROM salesdb.Employees
WHERE Gender = 'F'
And SALARY > ANY (Select SALARY FROM salesdb.Employees WHERE GENDER = 'M');

Select FirstName, SALARY FROM salesdb.Employees WHERE GENDER = 'M';




