--  Window Functions

-- Find the total sales accross all orders.

SELECT
SUM(Sales) AS total_sales
from orders;

-- Find the total sales for each product.

SELECT
	ProductID,
	SUM(Sales) AS total_sales
from orders
GROUP BY ProductID;

/*  Find the total sales for each product
Additionally provide details such order ID, order date*/

SELECT
	OrderID,
    OrderDate,
	ProductID,
	SUM(Sales) OVER(partition by ProductID) TotalSaleByProducts
from salesdb.orders;

-- Find the total sales accross all orders 
-- additionally provide details such order id & order date.

SELECT
OrderId,
OrderDate,
SUM(Sales) OVER()  TotalSales
From orders;

-- Find the total sales for each product 
-- additionally provide details such order id & order date.

SELECT
OrderId,
OrderDate,
ProductID,
SUM(Sales) OVER(partition by ProductID)  TotalSales
From orders;

-- Find the total sales accross all orders 
-- Find the total sales for each product 
-- additionally provide details such order id & order date.

SELECT
OrderId,
OrderDate,
ProductID,
Sales,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(partition by ProductID)  TotalSalesByProducts
From orders;

-- Find the total sales accross all orders 
-- Find the total sales for each product 
-- Find the total sales for each combination of product and order status.
-- additionally provide details such order id & order date.

SELECT
OrderId,
OrderDate,
ProductID,
OrderStatus,
Sales,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(partition by ProductID)  SalesByProducts,
SUM(Sales) OVER(partition by ProductID, OrderStatus)  TotalSalesByProductsAndStatus
From orders;


-- Rank each order based on their sales from highest to lowest.
-- Additionally provide details such order ID, order date.

SELECT
	OrderId,
    OrderDate,
    Sales,
    Rank() OVER(ORDER BY Sales DESC) RankSales
FROM Orders;

-- FRAME

SELECT
Orderid,
OrderDate,
OrderStatus,
Sales,
SUM(Sales) Over(PARTITION BY OrderStatus ORDER BY OrderDate ROWS between current row and 2 following
) TotalSales
FROM orders;

SELECT
Orderid,
OrderDate,
OrderStatus,
Sales,
SUM(Sales) Over(PARTITION BY OrderStatus ORDER BY OrderDate ROWS between 2 preceding and  current row
) TotalSales
FROM orders;

-- Rank the orders based on their sales from highest to lowest.

SELECT
OrderId,
ProductID,
sales,
ROW_Number() Over(order by Sales DESC) SalesRank_Row
FROM salesdb.orders;

-- Rank the orders based on their sales from highest to lowest.

SELECT
OrderId,
ProductID,
sales,
ROW_Number() Over(order by Sales DESC) SalesRank_Row,
RANK() Over(order by Sales DESC) SalesRank_Rank
FROM salesdb.orders;

-- Rank the orders based on their sales from highest to lowest.

SELECT
OrderId,
ProductID,
sales,
ROW_Number() Over(order by Sales DESC) SalesRank_Row,
RANK() Over(order by Sales DESC) SalesRank_Rank,
DENSE_RANK() Over(order by Sales DESC) SalesRank_Dense
FROM salesdb.orders;

-- Find the top highest sales for each product.

SELECT*
FROM (
SELECT
OrderID,
ProductID,
sales,
row_number() Over(partition by ProductId order by Sales DESC) RankByproduct
From salesdb.orders
)t where RankByProduct = 1;

-- Find the lowest 2 customers based on their total sales.

SELECT *
FROM(
SELECT
	CustomerId,
    Sum(Sales) TotalSales,
    ROW_Number() OVER(order by SUM(sales)) RankCustomers
FROM salesdb.Orders
GROUP BY
CustomerID
)t WHERE RankCustomers <= 2;

-- In order to export the data, divide the orders into 2 groups.

SELECT
    ORDERID,
    NTILE(2) OVER (ORDER BY ORDERID) AS Buckets
FROM salesdb.orders;

-- Find the products that fall within the highest 40% of the prices.

SELECT *
FROM(
	SELECT
		Product,
		Price,
		CUME_DIST() OVER (ORDER BY Price DESC) DistRank
	FROM salesdb.products
    )t
WHERE DistRank <= 0.4;

