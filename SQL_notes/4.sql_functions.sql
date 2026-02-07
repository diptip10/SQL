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

-- table my_table 
-- columns - col1, col2, col3
-- write a SELECT statement query the data from table my_table and output the following columns in the result set.
-- col1_abs - Absolute value of col1
-- col2_ceil - Ceiling of the value of col2
-- col2_floor - Floor of the value of col2
-- col3_power - Value of col3 powered by 2
-- col3_sqrt - Square root of col3.
SELECT ABS(col1) AS col1_abs,
       CEIL(col2) AS col2_ceil,
       FLOOR(col2) AS col2_floor,
       POWER(col3,2) AS col3_power,
       SQRT(col3) AS col3_sqrt
 FROM  my_table;

-- NESTED FUNCTIONS
-- EX1 :  PYTHON FUNDAMENTALS TO SQL FUNDAMENTALS
SELECT UPPER(REPLACE('Python fundamentals', 'Python','SQL')) AS output;

-- INPUT - FULL NAME  VENUS WILLIAMS, SERENA WILLIAMS
-- OUTPUT -- FIRST NAME, SURNAME
SELECT SUBSTR('Venus Williams',1, INSTR('Venus Williams',' ') - 1) AS first_name,
      SUBSTR('Venus Williams',INSTR('Venus Williams',' ') + 1) AS surname

CREATE TABLE person;

INSERT INTO person(full_name)
  VALUES('Venus Williams'),
        ('Serena Williams'),
        ('Roger Federer'),
        ('Rafael Nadal');

SELECT SUBSTR(full_name,1, INSTR(full_name,' ') - 1) AS first_name,
      SUBSTR(full_name, INSTR(full_name,' ') + 1) AS surname
 FROM person;

--  table called population with 2 columns country_continent and total_population
--  SELECT statement to query all the data from the table population and separate the country and continent as 2 separate columns.
SELECT SUBSTR(country_continent,1,INSTR(country_continent,'-') - 1) AS country,
       SUBSTR(country_continent,INSTR(country_continent,'-') + 1) AS continent,
       total_population
 FROM  population;

-- table - contact_details
-- columns - name, email
-- Write a SELECT statement to query the table contact_details and produce a result set with the following columns.
-- first_name - First word of the name
-- surname - Second word of the name
-- email - email as it is from the table
-- domain_name - Domain name derived from the email address. Domain name is usually the part of the email address after the @ symbol.
SELECT SUBSTR(name, 1, INSTR(name,' ') - 1) AS first_name,
       SUBSTR(name,INSTR(name,' ') + 1) AS surname,
       email,
       SUBSTR(email,INSTR(email,'@') + 1) AS domain_name
 FROM contact_details;

-- table -- contact_details
-- columns -- first_name, surname, company_name
-- Write a SELECT statement to query the table contact_details and produce a result set with the following columns.
-- full_name - first_name and surname combined with a space between them
-- email_address - Email address follows the format - first_name.surname@company_name.com. Email address uses only lowercase characters
SELECT first_name || ' ' || surname AS full_name,
      LOWER(first_name) || '.' || LOWER(surname) || '@' || LOWER(company_name) || '.com' AS email_address
 FROM contact_details;  

-- CONDITIONAL FUNCTIONS - IIF
SELECT country,
       total_population,
       IIF(total_population > 250000000,'High','Medium') AS population_category
  FROM population;

SELECT country,
       total_population,
       IIF(total_population > 250000000,
       'High',
       IIF(total_population > 150000000
            'Medium',
            'low')
        ) AS population_category
  FROM population;

-- TABLE - POPULATION
-- COLUMNS - COUNTRY, CONTINENT, TOTAL_POPULATION
/*
write a SELECT statement to query the table population and output the following columns as shown in the screenshot below
country
total_population
population_category - This is a column derived from total_population using the rules below. Please use IIF function to implement this.

1. population greater than or equal to 1 billion - Output 'Very High'

2. population greater than or equal to  250 million but less than 1 billion - Output 'High'

3. population greater than or equal to  150 million but less than 250 million - Output 'Medium'

4. population less than 150 million - Output 'Low'
*/
SELECT country,
    total_population,
    IIF(total_population  >= 1000000000,
    'Very High',
        IIF(total_population >= 250000000 
        AND total_population < 1000000000,
        'High',
            IIF(total_population >= 150000000 AND
            total_population < 250000000,
            'Medium', 'Low')
            )
        ) AS population_category 
 FROM population;

-- SIMPLE CASE EXPRESSION
SELECT country,
      total_population,
      CASE Country
        WHEN 'India' THEN 'Asia'
        WHEN 'United States' THEN 'Americas'
        ELSE 'Unknown'
      END AS continent
  FROM Population;

/*
write a SELECT statement query the table population and output the following columns as shown in the screenshot below

1) country

2) continent - Please use the rules as below

     For United States and Mexico - North America

     For Brazil - South America

     For all other countries, leave the continent as is.

3) total_population
*/
SELECT country,
    CASE country
        WHEN 'United States' THEN 'North America'
        WHEN 'Mexico' THEN 'North America'
        WHEN 'Brazil' THEN 'South America'
        ELSE continent
    END AS continent,
        total_population
 FROM population;

-- use case expressions instead of iff functions
SELECT country,
  total_population,
  CASE
    WHEN total_population > 250000000
    THEN 'High'
    WHEN total_population > 150000000
    THEN 'Medium'
    ELSE 'Low'
  END AS population_category
 FROM population;

/*
write a SELECT statement to query the table population and output the following columns as shown in the screenshot below
country
total_population

 population_category - This is a column derived from total_population using the rules below. Please use CASE expression to implement this.
1. population greater than or equal to 1 billion - Output 'Very High'
2. population greater than or equal to  250 million but less than 1 billion - Output 'High'
3. population greater than or equal to  150 million but less than 250 million - Output 'Medium'
4. population less than 150 million - Output 'Low'
*/
SELECT country,
   total_population,
   CASE
     WHEN total_population > 1000000000
     THEN 'Very High'
     WHEN total_population > 250000000
     THEN 'High'
     WHEN total_population > 150000000
     THEN 'Medium'
     ELSE 'Low'
  END AS population_category
 FROM population;

