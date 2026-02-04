
--  Select Clause

-- Select literal values

SELECT 'Hello World!', 1234;

SELECT country,
            total_population,
            'World Bank'
  FROM population;
  
-- Selecting Expressions

SELECT country,
            total_population,
            total_population / 1000000
  FROM population;

-- Select using functions

SELECT UPPER(country),
            total_population,
            total_population / 1000000
  FROM population;

-- Putting it all together

SELECT UPPER(country),
            total_population,
            ROUND(CAST(total_population AS REAL) / 1000000, 2)
  FROM population;


--  Alias

SELECT country AS country_name,
            total_population
  FROM population;

SELECT UPPER(country) AS country_name,
            ROUND(CAST(total_population AS REAL) / 1000000, 2) AS total_population
  FROM population;

-- Set-up for DISTINCT . 
DELETE FROM population;

INSERT INTO population
  (country, total_population)
VALUES
  ('India', 1428627663),
  ('India', 1428627663),
  ('China', 1425671352),
  ('United States', 339996564);





















