SELECT *
FROM mydatabase.customers;

SELECT *
FROM mydatabase.orders;

-- Retrieve each cutomer's  name, country and score.

SELECT
	first_name,
	country,
	score
FROM mydatabase.customers;

-- Retrieve the cutomers with a score not equal to zero.

SELECT *
FROM mydatabase.customers
WHERE score != 0;

-- Retrieve cutomers from Germany


SELECT *
FROM mydatabase.customers
WHERE country = 'Germany';

-- Retrive all the customers and sort the results by the highest score first.

SELECT *
FROM mydatabase.customers
order by score DESC;

-- Retrive all the customers and sort the results by the lowest score.

SELECT *
FROM mydatabase.customers
order by score ASC;

-- Retrive all the customers and sort the results by the country and then by the highest scoore.

SELECT *
FROM mydatabase.customers
order by country ASC, score DESC;

-- Find the total score for each country.

SELECT
	country,
    SUM(score) AS total_score
FROM mydatabase.customers
group by country;


-- Find the total score and the total number of customers for each country.

SELECT
	country,
    SUM(score) AS total_score,
    COUNT(id) AS total_customers
FROM mydatabase.customers
group by country;

/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
*/

SELECT 
	country,
    AVG(score) As averge_score
FROM mydatabase.customers
WHERE score != 0
group by country
HAVING  AVG(score) > 430;

-- Return Unique list of all countries.

SELECT DISTINCT country
FROM mydatabase.customers;

-- Retrive the top 3 customers with Highest score.

SELECT *
FROM mydatabase.customers
ORDER BY score DESC
LIMIT 3



   
   
