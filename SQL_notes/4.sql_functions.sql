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

-- NULLS -  EMPTY DATA / MISSING VALUES
/*
 write a SELECT statement to query the table population and output the columns country, continent and total_population  where both the conditions below have been met.

Value of country is NULL

Value of continent is NOT NULL

*/
SELECT country,
    continent,
    total_population
  FROM population
WHERE country IS NULL
AND continent IS NOT NULL;

-- CONDITIONAL FUNCTIONS - IFNULL
-- Set-up data for IFNULL function

DROP TABLE IF EXISTS population;

CREATE TABLE population
(
    country          VARCHAR(50),
    continent       VARCHAR(10),
    total_population_2023 INT,
    total_population_2022 INT
);

INSERT INTO population
(country, continent, total_population_2023, total_population_2022)
VALUES
('India', 'Asia', 1428627663, 1428627663),
('China', 'Asia', 1425671352, 1425671352),
('United States', 'Americas', 339996564, NULL),
('Indonesia', 'Asia', 277534123, 277534123),
('Pakistan', 'Asia', NULL, 240485658),
('Nigeria', 'Africa', 223804632, 223804632),
('Brazil', 'Americas', 216422446, NULL),
('Bangladesh', 'Asia', 172954319, 172954319),
('Russia', 'Europe', NULL, 144444359),
('Mexico', 'Americas', NULL, NULL);

SELECT *
   FROM population;

SELECT country,
      total_population_2023, 
      total_population_2022,
      IFNULL(total_population_2023, total_population_2022) AS total_population
   FROM population;

SELECT country,
      total_population_2023, 
      total_population_2022,
      IFNULL(total_population_2023, total_population_2022) AS total_population,
      IIF(total_population_2023 IS NULL, total_population_2022, total_population_2023)  AS total_population_iif
  FROM population;

/*
write a SELECT statement to query the table population and output the following columns

country - If the value of the country is NULL, then output 'Unknown country'

continent - If the value of the continent is NULL, then output 'Unknown continent'

total_population
*/
SELECT IFNULL(country,'Unknown country') AS country,
       IFNULL(continent,'Unknown continent') AS continent,
       total_population
    FROM population;

-- CONDITIONAL FUNCTIONS - COALESCE - returns first non null value in the list of values supplied
-- Set-up data for COALESCE function

DROP TABLE IF EXISTS population;

CREATE TABLE population
(
    country          VARCHAR(50),
    continent       VARCHAR(10),
    total_population_2023 INT,
    total_population_2022 INT,
    total_population_2021 INT
);

INSERT INTO population
(country, continent, total_population_2023, total_population_2022, total_population_2021)
VALUES
('India', 'Asia', 1428627663, 1428627663, NULL),
('China', 'Asia', 1425671352, 1425671352, NULL),
('United States', 'Americas', 339996564, NULL, NULL),
('Indonesia', 'Asia', 277534123, 277534123, NULL),
('Pakistan', 'Asia', NULL, 240485658, NULL),
('Nigeria', 'Africa', 223804632, 223804632, NULL),
('Brazil', 'Americas', 216422446, NULL, NULL),
('Bangladesh', 'Asia', 172954319, 172954319, NULL),
('Russia', 'Europe', NULL, 144444359, NULL),
('Mexico', 'Americas', NULL, NULL, 128455567);

/*
write a SELECT statement to query the table population and output the following columns
country
continent
latest_population Get the value of the total population from the most recent year for which it's available.
*/
SELECT country,
       continent,
       COALESCE(total_population_2023, total_population_2022, total_population_2021) AS latest_population
    FROM population;

-- CONDITIONAL FUNCTIONS - NULLIF 
-- returns NULL  if both parameter values are the same . Otherwise returns the value of the first parameter
/* write a SELECT statement to query the table population and output the following columns
country
continent - If the value is 'Unknown', output the value as NULL
total_population - If the value is 0, output the value as NULL
*/
SELECT country,
       NULLIF(continent, 'Unknown') AS continent,
       NULLIF(total_population, 0) AS total_population
  FROM population;
    
-- table -- popular_databases
-- columns - vote_percentage_2023, vote_percentage_2022, vote_percentage_2021
/* write a SELECT statement to query the table popular_databases and output the following columns

database_name

vote_year - This column is populated with the latest year for which the data is available for. If the data is available for none of the years, please output the value 'N/A'

vote_percentage - This column should have the vote percentage for the latest year for which the data is available. If the data is available for none of the years, please output the value
    'N/A'

*/
SELECT database_name,
    CASE 
      WHEN vote_percentage_2023 IS NOT NULL THEN 2023
      WHEN vote_percentage_2022 IS NOT NULL THEN 2022
      WHEN vote_percentage_2021 IS NOT NULL THEN 2021
      ELSE 'N/A'
    END AS vote_year,
      
    CASE 
      WHEN vote_percentage_2023 IS NOT NULL THEN vote_percentage_2023
      WHEN vote_percentage_2022 IS NOT NULL THEN vote_percentage_2022
      WHEN vote_percentage_2021 IS NOT NULL THEN vote_percentage_2021
      ELSE 'N/A'
    END AS vote_percentage
 FROM popular_databases;
-- OR
SELECT database_name,
    CASE 
      WHEN vote_percentage_2023 IS NOT NULL THEN 2023
      WHEN vote_percentage_2022 IS NOT NULL THEN 2022
      WHEN vote_percentage_2021 IS NOT NULL THEN 2021
      ELSE 'N/A'
    END AS vote_year,
    COALESCE(vote_percentage_2023, 
             vote_percentage_2022, 
             vote_percentage_2021,
             'N/A') AS vote_percentage
  FROM popular_databases;

/*
 write a SELECT statement to query the table popular_languages and output the following columns

language

vote_year -  This column is populated with the latest year for which the data is available for. If the data is available for none of the years, please output the value 'N/A'

vote_percentage - This column should have the vote percentage for the latest year for which the data is available. If the data is available for none of the years, please output the value 'N/A'

*/
SELECT language,
    CASE 
        WHEN (vote_percentage_2023 > 0) THEN 2023
        WHEN (vote_percentage_2022 > 0) THEN 2022
        WHEN (vote_percentage_2021 > 0) THEN 2021
        ELSE 'N/A'
    END AS vote_year,
   COALESCE(NULLIF(vote_percentage_2023, 0),
            NULLIF(vote_percentage_2022, 0),
            NULLIF(vote_percentage_2021, 0), 
            'N/A') AS vote_percentage
 FROM popular_languages;
/*
-- DATE FUNCTION
-- DATE MANIPULATION - add or substract from a date
                     - Get first day of the month for the given date
                     - get the 1st weekday of the given date

-- DATE FORMATTING - format to a local date format
                   - Exctact year, month, etc from date                  
*/
-- date manipulation functions -- DATE , TIME , DATETIME
SELECT DATE('now');
SELECT DATE('09-02-2026', '-10 days')
SELECT DATE('09-02-2026','start of year', '-5 days')

SELECT DATE('now') AS oredr_date,
       DATE('now','15 days') AS payment_due_date,
       DATE('now','28 days') AS return_eligibility_date,
       DATE('now','2 years') AS warrenty_expiry_date;

-- TIME FUNCTION
SELECT TIME('now')

SELECT TIME('now','1 hour','1 minute', '1 second')

-- create table for DATETIME FUNCTION
SELECT DATETIME('now')
SELECT DATETIME('now', '1 day')

CREATE TABLE orders (
    order_no   INT,
    order_date DATE
);
INSERT INTO orders (order_no, order_date) VALUES
(1, '2024-01-20'),
(1, '2024-01-25'),
(1, '2024-03-10'),
(1, '2024-04-11');

/*write a SELECT statement to query the table orders and output the following columns
order_no
order_date
payment_due_date - 14 days from the order date
return_eligibility_date - 1 month from the order date
warranty_expiry_date - 2 years from the order date
*/
SELECT order_no,
       order_date,
       DATE(order_date,'14 days') AS payment_due_date,
       DATE(order_date,'1 months') AS return_eligibility_date,
       DATE(order_date,'2 years') AS warranty_expiry_date
 FROM orders ;

-- MySQL 
SELECT
    order_no,
    order_date,
    DATE_ADD(order_date, INTERVAL 14 DAY)  AS payment_due_date,
    DATE_ADD(order_date, INTERVAL 1 MONTH) AS return_eligibility_date,
    DATE_ADD(order_date, INTERVAL 2 YEAR)  AS warranty_expiry_date
FROM orders;

-- DATE FORMATTING FUNCTIONS
SELECT STRFTIME('%d-%m-%Y','now');
SELECT STRFTIME('%d-%m-%Y', '2026-02-09')
SELECT STRFTIME('%d-%m-%Y', '2026-02-09','start of year', '10 days')

-- in MySQL
SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y');
SELECT DATE_FORMAT('2026-02-09', '%d-%m-%Y');
SELECT DATE_FORMAT(DATE_ADD(
        DATE_FORMAT('2026-02-09', '%Y-01-01'),
        INTERVAL 10 DAY),'%d-%m-%Y');
/* write a SELECT statement to query the table orders and output the following columns
order_no
order_date
payment_due_date - 14 days from the order date
return_eligibility_date - 1 month from the order date
warranty_expiry_date - 2 years from the order date
All the dates to be formatted as DD-MM-YYYY
*/
SELECT order_no,
       STRFTIME('%d-%m-%Y',order_date) AS order_date,
       STRFTIME('%d-%m-%Y',order_date,'14 days') AS payment_due_date,
       STRFTIME('%d-%m-%Y',order_date,'1 months') AS return_eligibility_date,
       STRFTIME('%d-%m-%Y',order_date,'2 years') AS warranty_expiry_date
 FROM orders ;

-- Calculate Age of Someone

SELECT (strftime('%Y', 'now') - strftime('%Y', '1975-03-17')) - (strftime('%m-%d', 'now') < strftime('%m-%d', '1975-08-17'));

/*
-- table - registration
-- columns - user_name, date_of_birth, registration_date
SELECT statement to query the table registration and calculate the age of all of the users as at the date of registration_date so that we can identify whether the user is above or below the age limit for the social media site which is 18 years.
*/
SELECT user_name,
       date_of_birth,
       registration_date,
       (STRFTIME('%Y-%m-%d',registration_date) - STRFTIME('%Y-%m-%d',date_of_birth)) -  (STRFTIME('%m-%d',registration_date ) < STRFTIME('%m-%d', date_of_birth)) AS age_on_registration_date
 FROM registration ;

/*Identify all the customers who turned 60 before 4th January 2024 so that we can send out letter to them to say that they are eligible for pension payouts. The result set should include the following columns

customer_name

date_of_birth - Formatted to the local format DD/MM/YYYY

age - The customer's age on the 4th January 2024.
*/
SELECT customer_name,
       STRFTIME('%d/%m/%Y',date_of_birth) AS date_of_birth,
       (STRFTIME('%Y','2024-01-04') -  STRFTIME('%Y', date_of_birth)) - (STRFTIME('%m-%d','2024-01-04') < STRFTIME('%m-%d',date_of_birth)) AS age
 FROM customer
    WHERE 
     (STRFTIME('%Y','2024-01-04') -  STRFTIME('%Y', date_of_birth)) - (STRFTIME('%m-%d','2024-01-04') < STRFTIME('%m-%d',date_of_birth)) > 60;
       
-- AGGREAGATE FUNCTIONS -  MAX, MIN, SUM, AVG, COUNT
SELECT MAX(total_population) AS highest_population,
       MIN(total_population) AS lowest_population,
       AVG(total_population) AS average_population,
       SUM(total_population) AS sum_population
  FROM Population;

SELECT MAX(ROUND(CAST(total_population AS REAL)/1000000,2)) AS highest_population ,
       MIN(ROUND(CAST(total_population AS REAL)/1000000,2)) AS lowest_population,
       ROUND(AVG(CAST(total_population AS REAL)/1000000),2)AS average_population,
       ROUND(SUM(CAST(total_population AS REAL)/1000000),2) AS total_population
 FROM population

/* write a SELECT statement to query the table population , apply the filter to include only countries in the continent Asia, and output the following columns 
1) highest_population - Population of the highest populated country in Asia
2) lowest_population - Population of the lowest populated country in Asia
3) average_population - Average population of all the countries in Asia
4) total_population - Total population of all the countries in Asia
*/
SELECT MAX(ROUND(CAST(total_population AS REAL)/1000000,2)) AS highest_population ,
       MIN(ROUND(CAST(total_population AS REAL)/1000000,2)) AS lowest_population,
       ROUND(AVG(CAST(total_population AS REAL)/1000000),2)AS average_population,
       ROUND(SUM(CAST(total_population AS REAL)/1000000),2) AS total_population
 FROM population
  WHERE continent = 'Asia'; 

-- AGGREAGATE FUNCTION - NULLS
/*write a SELECT statement to query the table population , apply the filter to include only countries in the continent Americas, and output the following columnS

highest_population - Population of the highest populated country in Americas
lowest_population - Population of the lowest populated country in Americas
average_population - Average population of all the countries in Americas
total_population - Total population of all the countries in Americas
*/
SELECT MAX(total_population) AS highest_population,
       MIN(total_population) AS lowest_population,
       AVG(total_population) AS average_population,
       SUM(total_population) AS total_population
 FROM population
   WHERE continent = 'Americas'
