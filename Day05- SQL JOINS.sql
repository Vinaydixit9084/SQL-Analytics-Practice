/* Retrieve all data from customers and orders 
in two different results. */

SELECT *
FROM mydatabase.customers;

SELECT *
FROM mydatabase.orders;

/* Get all customers along with their orders,
but only for customers who have placed an order. */

-- INNER JOIN 

SELECT 
	customers.id,
    customers.first_name,
    orders.order_id,
    orders.sales
FROM mydatabase.customers
INNER JOIN mydatabase.orders
ON customers.id = orders.customer_id;
    
-- If table name is so lengthy we can use 'AS'

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM mydatabase.customers AS c
INNER JOIN mydatabase.orders AS o
ON c.id = o.customer_id;

/* Get all customers along with their orders,
including those without orders. */

-- LEFT JOIN

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM mydatabase.customers AS c
LEFT JOIN mydatabase.orders AS o
ON c.id = o.customer_id;

/* Get all customers along with their orders,
including orders without matching orders. */

-- RIGHT JOIN

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM mydatabase.customers AS c
RIGHT JOIN mydatabase.orders AS o
ON c.id = o.customer_id;

/* Get all customers and all orders, Even if there's no match. */

-- FULL JOIN

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM mydatabase.customers AS c
LEFT JOIN mydatabase.orders AS o
ON c.id = o.customer_id

UNION

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM mydatabase.customers AS c
RIGHT JOIN mydatabase.orders AS o
ON c.id = o.customer_id;

/* Get all customers who haven't place any order. */

-- LEFT ANTI Join

SELECT *
FROM mydatabase.customers AS c
LEFT JOIN mydatabase.orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

/* Get all orders without matching customers. */

-- RIGHT ANTI Join

SELECT *
FROM mydatabase.customers AS c
RIGHT JOIN mydatabase.orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;

-- Using LEFT JOIN in place of Right.

SELECT *
FROM mydatabase.orders AS o 
LEFT JOIN mydatabase.customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL;

/* Get all customers along with their orders,
but only for customers who have placed an order
without using inner join. */

SELECT * 
FROM mydatabase.customers AS c
LEFT JOIN mydatabase.orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;


/* Generate all possible combinations of customers and orders. */

SELECT *
From mydatabase.customers
CROSS JOIN mydatabase.orders
