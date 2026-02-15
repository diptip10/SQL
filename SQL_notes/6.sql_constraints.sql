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


--  UNIQUE Constraints
-- 1. Create the table population
CREATE TABLE population
(
country VARCHAR(50) UNIQUE,
continent VARCHAR(50) ,
total_population INTEGER 
);

-- 2. Insert the population of India into the table
-- This will successfully execute
INSERT INTO population
(country, continent, total_population)
VALUES 
('India', 'Asia', 1428627663);

--  INSERT statement will fail as it violates the UNIQUE constraint.
INSERT INTO population
(country, continent, total_population)
VALUES 
('India', 'South Asia', 1428627663),
('India', 'South Asia', 1428627663);

-- DEFAULT Constraints
-- 1. Create the table population
CREATE TABLE population
(
    country VARCHAR(50),
    continent VARCHAR(50) DEFAULT('Unknown'),
    total_population INTEGER
);

-- 2. Insert the population of India into the table without the continent
INSERT INTO population
(country, total_population)
VALUES 
('India', 1428627663);

-- PRIMARY KEY, FOREIGN KEY
-- 1. Create the table country
CREATE TABLE country
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    population INTEGER NOT NULL
);

-- 2. Populate the country table with the population of India
INSERT INTO country(name,population)
VALUES('India',1428627663);

-- 3. Populate the country table with the population of Nigeria
INSERT INTO country(name,population)
VALUES('Nigeria',223804632);

--  Foreign Key Relationships
-- 1. Create the table city
CREATE TABLE city
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    population INTEGER NOT NULL,
    country_id INTEGER NOT NULL,
    FOREIGN KEY(country_id) REFERENCES country(id)
);

-- 2. Populate the city table with the population of Mumbai
INSERT INTO city(name, population, country_id)
VALUES('Mumbai', 12691836, 1);

-- MODIFYING A TABLE
DROP TABLE IF EXISTS continent;

CREATE TABLE continent
(
    name          VARCHAR(50) NOT NULL,
    population   INTEGER NOT NULL
);

INSERT INTO continent VALUES ('Asia', 3545273115);

SELECT * FROM continent;

-- RENAME TABLE

ALTER TABLE continent RENAME TO continents;

SELECT * FROM continents;

-- Add New Column

ALTER TABLE continents ADD COLUMN area INTEGER;

UPDATE continents
SET area = 44614000
WHERE name = 'Asia';

SELECT * FROM continents;

-- RENAME COLUMN
ALTER TABLE continents RENAME COLUMN area TO land_area;

-- DROP THE TABLE
ALTER TABLE continents DROP COLUMN land_area;

-- write ALTER TABLE statements to make changes to the table population as below
-- 1. Rename the table population to country
ALTER TABLE population RENAME TO country;

-- 2. Rename the column country to country_name
-- Hint: Remember to use the new table name as you have renamed that in step1. 
ALTER TABLE country RENAME COLUMN country TO country_name;

-- 3. Rename the column total_population to country_population
ALTER TABLE country RENAME COLUMN total_population TO country_population;

-- 4.Add a new column called income_level with data type as VARCHAR(50) and a default value of 'Unknown'
ALTER TABLE country ADD COLUMN income_level VARCHAR(50) DEFAULT 'Unknown';


-- 5. Write a SELECT statement to select all the data from country table
SELECT * FROM country;

-- TASK
-- 1. Create the table player
CREATE TABLE player
(
    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

-- 2.Insert data into the player table 
INSERT INTO player(first_name,last_name)
VALUES('Novak', 'Djokovic'),
      ('Carlos', 'Alcaraz');

-- 3. Create the match_result table 
CREATE TABLE match_result
(
    result_id INTEGER PRIMARY KEY AUTOINCREMENT,
    year INTEGER,
    tournament VARCHAR(50) CHECK(tournament IN('Wimbledon','Australian Open', 'French Open', 'U.S.Open')),
    winner_id INTEGER NOT NULL,
    runner_up_id INTEGER NOT NULL,
    FOREIGN KEY(winner_id) REFERENCES player(player_id),
    FOREIGN KEY(runner_up_id) REFERENCES player(player_id)
);

-- 4. Insert data into the match_result table
INSERT INTO match_result(year, tournament, winner_id, runner_up_id)
VALUES(2023, 'Wimbledon', 2, 1);
