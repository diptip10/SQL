
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

--  the DISTINCT Keyword

SELECT DISTINCT 
            country,
            total_population
  FROM population;

INSERT INTO population
  (country, total_population)
VALUES 
  ('China', 1391234561);

SELECT DISTINCT 
            country,
            total_population
  FROM population;

SELECT DISTINCT 
            country
  FROM population;


SELECT SUBSTR(country, 3), 
            total_population
  FROM population
ORDER BY SUBSTR(country, 3) DESC;

-- ORDER BY Keyword

DROP TABLE population;

CREATE TABLE population
(
    country          VARCHAR(50),
    continent       VARCHAR(10),
    total_population BIGINT
);

INSERT INTO population
(country, continent, total_population)
VALUES
('India', 'Asia', 1428627663),
('China', 'Asia', 1425671352),
('United States', 'Americas', 339996564),
('Indonesia', 'Asia', 277534123),
('Pakistan', 'Asia', 240485658),
('Nigeria', 'Africa', 223804632),
('Brazil', 'Americas', 216422446),
('Bangladesh', 'Asia', 172954319),
('Russia', 'Europe', 144444359),
('Mexico', 'Americas', 128455567);

SELECT *
  FROM population
ORDER BY total_population;

-- Sorting based on multiple columns

SELECT continent,
            country,
            total_population
  FROM population
ORDER BY continent ASC, country DESC;

SELECT continent,
            country,
            total_population
  FROM population
ORDER BY 1 ASC, 2 DESC;

--  LIMIT Clause

SELECT *
   FROM population
   LIMIT 2;

SELECT *
  FROM population
ORDER BY total_population
   LIMIT 2;

SELECT *
  FROM population
WHERE continent = 'Asia'
ORDER BY total_population
   LIMIT 2;
