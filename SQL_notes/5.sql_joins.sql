-- JOINS
-- SELECT --> FROM --> JOIN --> ON
-- Set-up the tables required for this section of the course

DROP TABLE IF EXISTS continent;

CREATE TABLE continent
(
    name          VARCHAR(50),
    population  INT
);

INSERT INTO continent
(name, population)
VALUES
('Africa'	, 1460481785),
('Asia', 4753082503),
('Americas', 1043901539),
('Oceano', 45575773),
('Europe', 742272147);


DROP TABLE IF EXISTS country;

CREATE TABLE country
(
    name          VARCHAR(50),
    cont_name  VARCHAR(50),
    population  INT
);

INSERT INTO country
(name, cont_name, population)
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

SELECT * FROM continent;

SELECT * FROM country;

/*
write a SELECT statement to join the tables continent  and country using the continent name, and output the following columns as shown below.

continent_name  - Name of the continent from either of the tables
continent_population  - population of the continent from continent table
country_name - Name of the country from the country table
country_population - population of the country from the country table
*/
SELECT co.name AS continent_name,
       co.population AS continent_population,
       cy.name AS country_name,
       cy.population AS country_population
 FROM continent co JOIN country cy ON co.name = cy.cont_name;

 -- CARTESIAN PRODUCT
/*
write a SELECT statement to join the tables continent  and country without any join conditions, and output the following columns as shown below.

continent_name  - Name of the continent from either of the tables
continent_population  - population of the continent from continent table
country_name - Name of the country from the country table
country_population - population of the country from the country table
*/
SELECT co.name AS continent_name,
       co.population AS continent_population,
       cy.name AS country_name,
       cy.population AS country_population
 FROM continent co CROSS JOIN country cy;

-- TYPES OF JOINS - 1. INNER 2.OUTER(LEFT, RIGHT, FULL)

-- LEFT OUTER JOIN
-- Set-up data to demonstrate Left Outer Join

DROP TABLE IF EXISTS continent;

CREATE TABLE continent
(
    name          VARCHAR(50),
    population  INT
);

INSERT INTO continent
(name, population)
VALUES
('Africa'	, 1460481785),
('Asia', 4753082503);


DROP TABLE IF EXISTS country;

CREATE TABLE country
(
    name          VARCHAR(50),
    cont_name  VARCHAR(50),
    population  INT
);

INSERT INTO country
(name, cont_name, population)
VALUES
('India', 'Asia', 1428627663),
('China', 'Asia', 1425671352),
('Brazil', 'Americas', 216422446),
('Russia', 'Europe', 144444359);

/*
write a SELECT statement to join the tables continent  and country using the continent name, and output the following columns as shown below.

The output should include all the records from continent table, but only the matching records from the country table.

continent_name  - Name of the continent from either of the tables
continent_population  - population of the continent from continent table
country_name - Name of the country from the country table
country_population - population of the country from the country table
*/
SELECT co.name AS continent_name,
       co.population AS continent_population,
       cy.name AS country_name,
       cy.population AS country_population
 FROM continent co LEFT OUTER JOIN country cy ON co.name = cy.cont_name;
