-- VIEW
/*
create a view called vw_continent with the following columns

name - Name of the continent.

population - Total population of the continent . Please use the aggregate function SUM to calculate the total population of the continent (for the 10 countries).
*/

CREATE VIEW vw_continent
AS
SELECT continent AS name,
       SUM(total_population) AS population
 FROM population
GROUP BY continent;

-- 1. Create a view with continent name, the population of the highest populated country in the continent and the population of the lowest populated country in the continent
CREATE VIEW vw_continent
AS 
SELECT continent,
       MAX(total_population) AS highest_cont_population,
       MIN(total_population) AS lowest_cont_population
 FROM population
GROUP BY continent;

/*
-- 2.
write a SELECT statement to query the table population, and produce the result set as shown in the screenshot below.

country

continent

cnty_population - Population of the country

highest_cont_population - Population of the highest populated country in the continent

lowest_cont_population - Population of the lowest populated country in the continent
*/

SELECT p.country,
       p.continent,
       p.total_population AS cnty_population,
       v.highest_cont_population,
       v.lowest_cont_population
 FROM Population p JOIN vw_continent v ON (p.continent = v.continent);
 
 /*
-- 1.
create a view called vw_population with a SELECT statement to join the tables continent  and country using the continent name, and include the following columns

continent_name  - Name of the continent from either of the tables

continent_population  - population of the continent from continent table

country_name - Name of the country from the country table

country_population - population of the country from the country table
*/
CREATE VIEW vw_population
AS 
SELECT cont.name AS continent_name,
       cont.population AS continent_population,
       cnty.name AS country_name,
       cnty.population AS country_population
 FROM continent cont JOIN country cnty ON (cont.name = cnty.cont_name);

/*
-- 2.
write a SELECT statement to query the view created above  vw_population with a filter to include only countries with a population of less than 200 million.
*/
SELECT *
 FROM vw_population
WHERE country_population < 200000000;

/*
 create a VIEW to SELECT statement with JOINs and Common Table Expressions (CTEs)/ Subqueries
to join the tables player  and match_result using player_id/ winner_id
then find total wins by the player

The result set should include the output as below

year

tournament

player_name  - Full name of the player, i.e., first_name and last_name concatenated using a blank space between them.

player_country 

total_wins - Total wins by the player across all the grand slams for which we have the data for (2022 and 2023)

all_player_avg_wins - Average number of wins across all the players who have won any gland slams during 2022 and 2023. This value has to be rounded to include only 2 decimal places
*/
CREATE VIEW vw_player_wins
AS
WITH cte_winner AS 
 (SELECT winner_id,
         COUNT(*) AS total_wins
   FROM match_result
  GROUP BY winner_id),
 cte_avg_wins AS
 (SELECT ROUND(AVG(total_wins), 2) AS all_player_avg_wins
   FROM cte_winner)

SELECT m.year,
       m.tournament,
       p.first_name || ' ' || p.last_name AS player_name,
       p.country AS player_country,
       w.total_wins,
       av.all_player_avg_wins
 FROM player p JOIN match_result m ON (p.player_id = m.winner_id)
 JOIN cte_winner w ON (m.winner_id = w.winner_id)
 JOIN cte_avg_wins av;
 