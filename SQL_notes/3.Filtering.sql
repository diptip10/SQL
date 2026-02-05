
-- WHERE CLAUSE
-- write a SELECT statement query the table population and
-- 1. filter only countries with with the population greater than or equal to that of Indonesia's which is 277534123
-- 2. include country and total_population in the result set.
-- >= OPERATOR
SELECT country,
    total_population
 FROM population
WHERE total_population >= 277534123;

--  WHERE - BETWEEN OPERATOR
-- write a SELECT statement query the table population and
-- 1. filter only countries with with the population between 100 million and 200 million
-- 2. include country and total_population in the result set.

SELECT country, 
    total_population
 FROM population
WHERE total_population
BETWEEN 100000000 AND 200000000;

-- WHERE - LIKE OPERATOR 
-- % - Zaro or any character
-- _ - Exactly one character
-- Please write a SELECT statement to output all the columns from the table population with their continent name starting with the letter A (upper case A) and ending with a (lower case a).
SELECT * 
 FROM population
WHERE continent LIKE 'A%a';

-- select country starting with character 'B'
SELECT * 
 FROM population
WHERE country LIKE 'B%';

-- select country  ending with character '%ia'
SELECT *
 FROM population
WHERE country LIKE '%ia'

-- select country starting with character 'In' and ending with character '%ia'
SELECT * 
 FROM population
WHERE country LIKE 'In%ia'

-- select country starting with character 'In' and ending with character '%ia' and only one character between 'In' and 'ia'
SELECT *
 FROM population
WHERE country LIKE 'In_ia';

-- write a SELECT statement to output all the columns from the table population with their continent
-- name starting with the letter A (upper case A) and ending with a (lower case a) and the continent name
-- is only 4 characters in total.
SELECT * 
 FROM population 
WHERE continent LIKE 'A__a';

-- write a SELECT statement to output all the columns from the table population with their continent
-- name with r as the 4th character from the end (i.e, r is followed by 3 other characters).
-- There can be any number of characters before the character r.
SELECT *
 FROM population
WHERE continent LIKE '%r___';

-- WHERE - IN OPERATOR
--  write a SELECT statement to output all the columns from the table population with their continent name is Europe or Africa.
SELECT * 
 FROM population
WHERE continent IN ('Europe','Africa');

-- WHERE - MULTIPLE CONDITIONS
--  write a SELECT statement to output all the columns from the table population that satisfies the following conditions
-- 1. continent is in either Americas or Europe
-- 2.total_population is greater than or equal to 100 million and less than or equal to 200 million
SELECT * 
 FROM population
WHERE continent IN ('Americas','Europe')
 AND total_population BETWEEN 100000000 AND 200000000;

-- WHERE - OR OPERATOR
-- write a SELECT statement to output all the columns from the table population, where the country's total_population is either greater than 1 billion or less than 200 million.
SELECT * 
 FROM population
WHERE total_population > 1000000000
    OR total_population < 200000000;

-- AND and OR OPERATOR TOGETHER
-- write a SELECT statement to output all the columns from the table population that satisfies the following conditions
-- 1. continent is Americas
-- 2. total_population is either greater than 300 million or less than 200 million
SELECT * 
 FROM population
WHERE continent = 'Americas'
    AND (total_population > 300000000 
    OR total_population < 200000000);

-- WHERE - NEGATED CONDITIONS
-- select statement to get the output of countries other than 'India' and 'China'
SELECT *
 FROM population
WHERE country NOT IN ('india', 'China');

-- fetch all columns from population table where country names do not starts with 'I' 
SELECT *
 FROM population
WHERE country NOT LIKE 'I%';

-- select records having the total population less than 200 billion and greater than 300 billion
SELECT *
 FROM population
WHERE total_population NOT BETWEEN 200000000 AND 300000000;

--  write a SELECT statement to output all the records from the table population  where the continent is NOT in Asia or Europe.
SELECT * 
 FROM population
WHERE continent NOT IN ('Asia', 'Europe');

-- FILTERS IN DELETE AND UPDATE
-- update table population with new total_population of country 'United States'
UPDATE population
    SET total_population = 340000000
WHERE country = 'United States';


-- delete the records from the table where total_population is less than 1 billion(1000000000)
DELETE
    FROM population
WHERE total_population < 1000000000;

-- Update the population of Brazil to 220 million 
UPDATE population
    SET total_population = 220000000
WHERE country = 'Brazil';

-- Delete the records for countries with population less than 200 million  */
DELETE
    FROM population
WHERE total_population < 200000000;

-- Write a SELECT statement to query the table popular_databases and produce a result set that satisfies the following conditions.
-- 1. database_name either starts with the string 'SQL' or ends with the string 'SQL' 
-- 2. number_of_votes is less than 32,000
-- Result set should include the columns database_name and number_of_votes
SELECT database_name,
    number_of_votes
 FROM popular_databases
WHERE (database_name LIKE 'SQL%' OR 
database_name LIKE '%SQL')
    AND number_of_votes < 32000;

-- Write a SELECT statement to query the table popular_databases and produce a result set that satisfies the following conditions.
-- database_name is not 'MySQL' or 'Microsoft SQL Server'
-- number_of_votes is greater than or equal to 20000 and less than or equal to 30000
-- Result set should include the columns database_name and number_of_votes
SELECT database_name,
    number_of_votes
 FROM popular_databases
WHERE (database_name <> 'MySQL' 
    OR database_name <> 'Microsoft SQL Server')
AND (number_of_votes >= 20000
    AND number_of_votes <= 30000);  

