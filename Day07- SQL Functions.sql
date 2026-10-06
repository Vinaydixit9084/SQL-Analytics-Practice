-- SQL Funtions

-- Show a list of customers' first name together with their country in one column.

SELECT 
first_name,
country,
CONCAT(first_name, '-',  country) AS name_country
FROM mydatabase.customers;

-- Convert the first nane to lowercase

SELECT 
first_name,
country,
CONCAT(first_name, '-',  country) AS name_country,
LOWER(first_name) AS lower_name
FROM mydatabase.customers;

-- Convert the first nane to uppercase

SELECT 
first_name,
UPPER(first_name) AS up_name
FROM mydatabase.customers;

-- Find customers whose first name contains leading or trailing spaces.

SELECT 
	first_name,
    length(first_name) len_name,
    length(TRIM(first_name)) length_trim_name
FROM mydatabase.customers;
-- WHERE first_name != TRIM(first_name)

-- REPLACE Function

SELECT 
'123-456-7890' AS Phone No,
REPLACE('123-456-7890', '-', '') AS Clean_ph;


