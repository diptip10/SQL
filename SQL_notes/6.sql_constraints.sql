/*
-- CONSTRAINTS -> rules that you can define on a column to ensure correct data is present in the table
1. NOT NULL
2. DEFAULT
3. CHECK
4. UNIQUE

*/

-- NOT NULL
/*
1) Create a table with the following properties
Table Name - population
Column Details
country - data type VARCHAR(50)
continent - data type VARCHAR(50)
total_population - data type INTEGER . 
Please use INTEGER as the data type for total_population, not INT. This is because the Unit test specifically looks for the word INTEGER, rather than the short form INT.
*/
-- 1. Create the table population
CREATE table population
(
    country  VARCHAR(50) NOT NULL,
    continent VARCHAR(50) NOT NULL,
    total_population INTEGER NOT NULL
);

-- 2. Insert the population of India into the table 
-- This INSERT will fail (total_population missing)

INSERT INTO population
(country, continent)
VALUES
('India', 'Asia');

-- This INSERT will succeed

INSERT INTO population(country, continent, total_population)
    VALUES('India', 'Asia', 1428627663);

-- CHECK CONSTRAINT
-- 1. Create the table population
CREATE TABLE population 
(
    country  VARCHAR(50),
    continent  VARCHAR(50) CHECK (continent IN ('Asia', 'Africa','Americas','Antarctica', 'Europe')),
    total_population INTEGER
);

-- 2. Insert the population of India into the table
-- It will not succeed
INSERT INTO population
(country, continent, total_population)
VALUES 
('India', 'South Asia', 1428627663);

-- it will succeed
INSERT INTO population 
(country, continent, total_population)
VALUES
('India','Asia', 1428627663);


