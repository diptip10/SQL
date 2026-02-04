
--  the CREATE TABLE statement
CREATE TABLE population
(
    country VARCHAR(50),  -- Country names are expected to be no longer than 50 characters
    total_population INT
);


-- Insert the population of India
INSERT INTO population
  (country, total_population)
VALUES
  ('India', 1428627663);

SELECT * FROM population;

-- Insert the population of all remaining countries

INSERT INTO population
(country, total_population)
VALUES
('China', 1425671352),
('United States', 339996564),
('Indonesia', 277534123),
('Pakistan', 240485658),
('Nigeria', 223804632),
('Brazil', 216422446),
('Bangladesh', 172954319),
('Russia', 144444359),
('Mexico', 128455567); 

SELECT * FROM population;

--  SELECT statements

SELECT country,
       total_population
  FROM population;

SELECT total_population,
       country
  FROM population;

--  WHERE clause

SELECT total_population,
       country
  FROM population
 WHERE country = 'Russia';

--  updating data

SELECT total_population
  FROM population
 WHERE country = 'United States';

UPDATE population
   SET total_population = 341234567
 WHERE country = 'United States';

--  deleting data

DELETE 
  FROM population
 WHERE country = 'Russia';

SELECT *
  FROM population;

DELETE
  FROM population;

--  DROP Table

DROP TABLE population;

SELECT * 
  FROM population;







