-- DDL Commands 

CREATE TABLE mydatabase.persons (
	id  INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY(id)
)

SELECT *
FROM mydatabase.persons;

-- Add new column called email to the persons table.

ALTER TABLE mydatabase.persons
ADD email VARCHAR(50) NOT NULL;

SELECT *
FROM mydatabase.persons;

-- Remove the column phone from the persons table.

ALTER TABLE mydatabase.persons
DROP phone;

SELECT *
FROM mydatabase.persons;

-- Delete the table persons from the database.

DROP TABLE mydatabase.persons;
 

-- DML Commands

-- INSERT command

INSERT INTO mydatabase.customers (id, first_name, country, score)
VALUES
	(6, 'Anna', 'USA', NULL),
    (7, 'Joy', NULL, 100);

SELECT * From mydatabase.customers;

INSERT INTO mydatabase.customers (id, first_name)
VALUES
	(8, 'Sam');
    

-- Insert data from customers into persons.

INSERT INTO mydatabase.persons (id, person_name, birth_date, phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM mydatabase.customers;

SELECT * From mydatabase.persons;

-- UPDATE Command

/* Change the score of customer 6 to 0 */

UPDATE mydatabase.customers
SET score = 0
Where id = 6;

SELECT * FROM mydatabase.customers;

/* Change the score of customer 8 to 0
and update the country to UK */

UPDATE mydatabase.customers
SET score = NULL,
	country = 'UK'
Where id = 8;

SELECT * FROM mydatabase.customers;

-- DELETE command

-- Delete all customers with an ID greater than 5.

DELETE FROM mydatabase.customers
WHERE id > 5;

SELECT * from mydatabase.customers;

-- Delete all data from the table persons.

TRUNCATE TABLE mydatabase.customers


