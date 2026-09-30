-- Comaparison Operators
-- Retrieve all customers from Germany

SELECT *
FROM mydatabase.customers
WHERE country = 'USA';

-- Retrieve all customers who are not from Germany.

SELECT *
FROM mydatabase.customers
WHERE country <> 'USA';

-- Retrieve all customers with a score greater than 500.

SELECT *
FROM mydatabase.customers
WHERE score > 500;

-- Retrieve all customers with a score of 500  or more.

SELECT *
FROM mydatabase.customers
WHERE score >= 500;

-- Retrieve all customers with a score less than 500.

SELECT *
FROM mydatabase.customers
WHERE score < 500;

-- Retrieve all customers with a score of 500  or less.

SELECT *
FROM mydatabase.customers
WHERE score <= 500;

-- Logical Operators - AND, OR , NOT

/* Retrieve all customers who are from USA 
and have a score greater than 500. */

SELECT *
From mydatabase.customers
WHERE country = 'USA' AND score > 500;

/* Retrieve all customers who are either from USA 
or have a score greater than 500. */

SELECT *
From mydatabase.customers
WHERE country = 'USA' OR score > 500;

-- Retrieve all customers with a score NOT less than 500.

SELECT *
From mydatabase.customers
WHERE NOT score < 500;

-- RANGE Operator - BETWEEN
-- Retrieve all customers whose score falls in the range between 100 and 500.

SELECT *
FROM mydatabase.customers
WHERE score BETWEEN 100 AND 500;

SELECT *
FROM mydatabase.customers
WHERE score >= 100 AND score <= 500;

-- Memebership Operator - IN, NOT IN

-- Retrieve all customers from either Germany or USA.

SELECT *
FROM mydatabase.customers
WHERE country = 'Germany' OR country = 'USA';

-- IN Operator

SELECT *
FROM mydatabase.customers
WHERE country IN ('Germany', 'USA');

-- Search Operator(Imp) - LIKE

-- Find all customers whose first name starts with M.

SELECT *
FROM mydatabase.customers
WHERE first_name LIKE 'M%';

-- Find all customers whose first name ends with n.

SELECT *
FROM mydatabase.customers
WHERE first_name LIKE '%n';	

-- Find all customers whose first name contains 'r'

SELECT *
FROM mydatabase.customers
WHERE first_name LIKE '%r%';	

-- Find all customers whose first name has 'r' in the third position.

SELECT *
FROM mydatabase.customers
WHERE first_name LIKE '__r%';	


