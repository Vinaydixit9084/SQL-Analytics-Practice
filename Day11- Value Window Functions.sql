-- Analyze the month-over-month  performance by finding the percentage change
-- in sales between the current and previous month.

SELECT 
*,
CurrentMonthSales - PreviousMonthSales AS MoM_Change,
(CurrentMonthSales - PreviousMonthSales)/ PreviousMonthSales*100
FROM(
SELECT
	Month(OrderDate) OrderMonth,
    SUM(Sales) CurrentMonthSales,
    LAG(SUM(Sales)) OVER (ORDER BY Month(OrderDate)) PreviousMonthSales
From salesdb.orders
GROUP BY
		Month(OrderDate)
)t;

-- In order to analyze customer loyalty,
-- rank customers based on the average  days between their orders.

SELECT
CustomerID,
AVG( DaysUntilNextOrder) AvgDays,
RANK() Over (ORDER BY AVG(DaysUntilNextOrder)) RankAng
FROM(
SELECT 
ORDERID,
CustomerID,
OrderDate CurrentOrder,
LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) NextOrder,
DATEDIFF(LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate), OrderDate) DaysUntilNextOrder
FROM salesdb.orders
ORDER BY CustomerID, OrderDate
)t
group by
	CustomerID