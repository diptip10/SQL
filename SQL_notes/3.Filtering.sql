
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