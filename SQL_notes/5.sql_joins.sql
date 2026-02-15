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

-- RIGHT OUTER JOIN
/*
 write a SELECT statement to join the tables continent  and country using the continent name, and output the following columns as shown in the screenshot below.

The output should include all the records from country table, but only the matching records from the continent table.

continent_name  - Name of the continent from either of the tables
continent_population  - population of the continent from continent table
country_name - Name of the country from the country table
country_population - population of the country from the country table
*/
SELECT co.name AS continent_name,
       co.population AS continent_population,
       cy.name AS country_name,
       cy.population AS country_population
 FROM continent co RIGHT JOIN country cy ON co.name = cy.cont_name;

 -- FULL OUTER JOIN
 /*
 write a SELECT statement to join the tables continent  and country using the continent name, and output the following columns as shown in the screenshot below.

The output should include all the records from both continent and country tables, but joined together when there is a match. 

continent_name  - Name of the continent from either of the tables
continent_population  - population of the continent from continent table
country_name - Name of the country from the country table
country_population - population of the country from the country table
*/
SELECT co.name AS continent_name,
       co.population AS continent_population,
       cy.name AS country_name,
       cy.population AS country_population
 FROM continent co FULL JOIN country cy ON co.name = cy.cont_name;

-- JOIN WITH FILTERS
SELECT *
 FROM continent co JOIN country cy ON co.name = cy.cont_name
WHERE cy.population <= 1000000000;

SELECT *
 FROM continent co JOIN country cy ON co.name = cy.cont_name
WHERE co.name = 'Asia';

SELECT *
 FROM continent co JOIN country cy ON co.name = cy.cont_name
WHERE cy.population > 1000000000
    AND co.name = 'Asia'
    AND cy.name = 'India';

/*
 write a SELECT statement to join the tables continent  and country using the continent name, and output the following columns as shown in the screenshot below.

Also, the result set should only include countries with a population of less than 200 million.

continent_name  - Name of the continent from either of the tables
continent_population  - population of the continent from continent table
country_name - Name of the country from the country table
country_population - population of the country from the country table
*/
SELECT co.name AS continent_name,
       co.population AS continent_population,
       cy.name AS country_name,
       cy.population AS country_population
 FROM continent co JOIN country cy ON co.name = cy.cont_name
WHERE cy.population  < 200000000;

-- OUTER JOIN WITH FILTERS
SELECT *
 FROM continent co LEFT JOIN country cy ON co.name = cy.cont_name
WHERE cont_name = 'Asia';

/*
write a SELECT statement to join the tables continent  and country using the continent name, and output the following columns as shown below.

The result set should include all the records from continent table, but only the matching records from the country table. Also, the result set should only include countries with a population of less than 200 million.

continent_name  - Name of the continent from either of the tables
continent_population  - population of the continent from continent table
country_name - Name of the country from the country table
country_population - population of the country from the country table
*/
SELECT co.name AS continent_name,
       co.population AS continent_population,
       cy.name AS country_name,
       cy.population AS country_population
 FROM continent co LEFT JOIN country cy ON co.name = cy.cont_name AND cy.population < 200000000;

/*
 write a SELECT statement to join the tables continent  and country using the continent name, and output the following columns as shown below.

The result set should include all the records from country table, but only the matching records from the continent table. Also, the result set should only include continents with a population of more than 1 billion.

continent_name  - Name of the continent from either of the tables
continent_population  - population of the continent from continent table
country_name - Name of the country from the country table
country_population - population of the country from the country table
*/
SELECT co.name AS continent_name,
       co.population AS continent_population,
       cy.name AS country_name,
       cy.population AS country_population
 FROM continent co RIGHT JOIN country cy ON co.name = cy.cont_name AND 
 co.population > 1000000000;
 
/*
table - player
columns - player_id , first_name, last_name, country and atp_ranking 

table - match_result 
columns - year, tournament, winner_id and runner_up_id

Relationship - winner_id and runner_up_id in the match_result table relates to the payer table via the player_id

write a SELECT statement to join the tables player  and match_result using player_id/ winner_id, and output the following columns as shown below.

player_name  - Full name of the player, i.e., first_name and last_name concatenated using a blank space between them.

player_country 

number_of_wins - Number of wins by this player in the data provides (i.e., 2022 and 2023).

Note - The output is sorted by the descending order of the number_of_wins.
*/
SELECT p.first_name || ' ' || p.last_name AS player_name,
       p.country AS player_country,
       COUNT(*) AS number_of_wins
 FROM match_result m JOIN player p ON m.winner_id = p.player_id
WHERE m.year IN (2022,2023)
GROUP BY p.first_name, p.last_name, p.country 
ORDER BY number_of_wins DESC;

/*
write a SELECT statement to join the tables player  and result using player_id/ winner_id/ runner_up_id, and output the following columns as shown below.

year 
tournament 
winner_name - Full name of the player & also his country in brackets.
runner_up_name - Full name of the player & also his country in brackets.
*/
SELECT m.year AS year,
       m.tournament AS tournament,
       w.first_name || ' ' || w.last_name || '(' || w.country || ')' AS winner_name,
       r.first_name || ' ' || r.last_name || '(' || r.country || ')' AS runner_up_name
 FROM match_result m 
  JOIN player w ON (m.winner_id = w.player_id)
  JOIN player r ON (r.player_id = m.runner_up_id); 

/*
write a SELECT statement to join the tables player  and result using player_id/ winner_id/ runner_up_id, and output the following columns as shown  below.

year 

tournament 

winner_name - Full name of the player & also his country in brackets. If we don't have the player details in the player table, output the value as Unknown.

runner_up_name - Full name of the player & also his country in brackets. If we don't have the player details in the player table, output the value as Unknown.
*/
SELECT m.year AS year,
       m.tournament AS tournament,
       IIF( w.first_name IS NULL,'Unknown', w.first_name || ' ' || w.last_name || '(' || w.country || ')') AS winner_name,
       IIF(r.first_name IS NULL, 'Unknown', r.first_name || ' ' || r.last_name || '(' || r.country || ')') AS runner_up_name
 FROM match_result m 
  LEFT JOIN player w ON (m.winner_id = w.player_id)
  LEFT JOIN player r ON (m.runner_up_id = r.player_id);
  