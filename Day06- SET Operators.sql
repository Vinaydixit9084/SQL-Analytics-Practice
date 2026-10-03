-- SET OPERATORS - UNION

SELECT 
FirstName,
LastName
FROM customers

UNION

SELECT
firstName,
LastName
FROM Employees;



SELECT 
customerid,
LastName
FROM customers

UNION

SELECT
employeeid,
LastName
FROM Employees;


-- Aliases only follow first query 

SELECT 
customerid AS id,
LastName
FROM customers

UNION

SELECT
employeeid,
LastName
FROM Employees;

-- UNION ALL 

-- Combine the data from employees and customers including duplicates.

SELECT 
FirstName,
LastName
FROM employees

UNION ALL

SELECT
FirstName,
LastName
FROM customers;


