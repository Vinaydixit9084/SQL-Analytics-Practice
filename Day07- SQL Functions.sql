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

-- Calculate the length of each customer's first name.

SELECT
first_name,
length(first_name) AS length_name
FROM mydatabase.customers;

-- Retrieve the first two characters of each first name.

SELECT
	first_name,
    LEFT(first_name, 2) first_2_characters
FROM mydatabase.customers;

SELECT
	first_name,
    LEFT(TRIM(first_name), 2) first_2_characters
FROM mydatabase.customers;

-- Retrieve the last two characters of each first name.

SELECT
	first_name,
    LEFT(TRIM(first_name), 2) first_2_characters,
    RIGHT(first_name, 2) last_2_char
FROM mydatabase.customers;

-- Retrieve the list of customer's first names after removing the first character.

SELECT
	first_name,
    substring(TRIM(first_name), 2, 4) AS sub_name
FROM mydatabase.customers;

-- ROUND function

SELECT
3.516,
ROUND(3.516, 2) AS round_2,
ROUND(3.516, 1) AS round_1,
ROUND(3.516, 0) AS round_0;

-- ABS funtion - returns positive number

SELECT
-10,
ABS(-10)

 
