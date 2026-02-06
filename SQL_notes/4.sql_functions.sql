-- SQL FUNCTIONS - 1.USER-DEFINED     2.BUILT-IN FUNCTIONS
-- BUILT-IN ---1.SCALAR --(STRING FUNCTION, MATH FUNCTION, DATE FUNCTION, CONDITIONAL FUNCTIONS)
--             2.AGGREGATE FUNCTIONS--(COUNT)
--             3.WINDOW FUNCTION/ANALYTICAL

-- STRING FUNCTIONS - UPPER, LOWER, CONCAT
SELECT UPPER(country) AS country,
    LOWER(continent) AS continent,
    total_population
 FROM population;

SELECT continent || '-' || country AS coountry,
    total_population
 FROM population;

-- We can use || or CONCAT for string concatenation
-- || (PostgreSQL, Oracle, SQLite)
SELECT 
  'continent:' || continent || '-country:' || country AS country,
  total_population
FROM population;

-- CONCAT (MySQL, SQL Server)
SELECT 
  CONCAT('continent:', continent, '-country:', country) AS country,
  total_population
FROM population;


-- write a SELECT statement to output all the records from the table population  with a column containing the output as below. Alias the output column to be result.
-- Note - Ensure to use the right amount of spaces so that the tests succeed.
-- Example output - Population of INDIA is: 1428627663
SELECT 'Population of ' || UPPER(country) || ' is: ' || total_population AS result
 FROM population;
-- OR
SELECT CONCAT('Population of ', UPPER(country), ' is: ', total_population) AS result
FROM population;

-- STRING FUNCTIONS -- REPLACE, TRIM, LTRIM, RTRIM
SELECT REPLACE('I am learning SQL fundamentals','SQL','Python') AS output;

SELECT TRIM('      TESTING TRIM     ') AS output;   -- O/P - 'TESTING TRIM'
SELECT LTRIM('      TESTING TRIM     ') AS output;  -- O/P - 'TESTING TRIM     '
SELECT RTRIM('      TESTING TRIM     ') AS output;  -- O/P - '      TESTING TRIM'
SELECT LTRIM(RTRIM('      TESTING TRIM     ')) AS output;  -- O/P - 'TESTING TRIM'

-- 1. country United Kingdom is incorrect. The second word Kingdom should be replaced with States
-- 2. Some of the continent values have leading spaces.
-- Please write a SELECT statement query the data in the table population and fix both of these issues to output the result.

SELECT REPLACE(country,'Kingdom','States') AS country,
    LTRIM(continent) AS continent,
    total_population
 FROM population;

-- STRING FUNCTIONS - SUBSTR, INSTR, LENGTH
SELECT country,
    continent,
    total_population,
    SUBSTR(country,1,3) AS country_start,
    SUBSTR(country,4) AS country_end,
    INSTR(country,'ia') AS start_pos_ia
    INSTR(country,' ') AS start_pos_space
    LENGTH(country) AS country_length
  FROM population;

-- write a SELECT statement query the table population and output the following columns as shown in the screenshot below
-- 1) country
-- 2) First 3 characters of the country.  Name this column to country_name_start
-- 3) Find the position of spaces in the country name. Name this column as start_pos_space
-- 4) Find the length of the country name. Name this column as country_name_length
-- 5) total_population
SELECT country,
    SUBSTR(country,1,3) AS country_name_start,
    INSTR(country,' ') AS start_pos_space,
    LENGTH(country) AS country_name_length,
    total_population
 FROM population;

-- MATH FUNCTIONS
-- MATH FUNCTIONS -- ABS(ABSOLUTE/POSITIVE)-- RETURNS ABSOLUTE VALUE OF NUMBER SUPPLIED
-- ROUND
-- CEIL - ROUND UP TO NEAREST INTEGER NUMBER
-- FLOOR - ROUNDS DOWN TO NEAREST INTEGER
-- SQUARE, POWER 
-- MOD - RETURN REMINDER WHEN DIVIDING ONE NUMBER BY ANOTHER 
SELECT ABS(-100) AS abs,
      CEIL(12.2) AS ceil,
      FLOOR(12.2) AS flopr,
      POWER(5,2) AS power,
      SQRT(25) AS sqrt,
      MOD(30/5) AS mod;