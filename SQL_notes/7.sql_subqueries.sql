-- SUBQUERIES
-- subqueries can return single value, multiple value or multiple rows of data

-- find the countries with a population higher than the average population of all countries
SELECT * 
 FROM population
WHERE total_population > (SELECT AVG(total_population) 
                           FROM population);

/*
table - population
columns - country, continent, total_population
write a SELECT statement to query the table population , and produce a result set with the lowest populated country and it's total_population
*/

SELECT country,
       total_population
 FROM population
WHERE total_population = (SELECT MIN(total_population)
 FROM population);

 /*
write a SELECT statement to query the table population , identify the continents with more than 1 country in this table, and produce a result set
*/

SELECT country,
       continent,
       total_population
 FROM population
WHERE continent IN (SELECT continent
                     FROM population
                    GROUP BY continent
                    HAVING COUNT(*) > 1);

/*
write a SELECT statement to query the table population , identify the lowest populated country in each continent, and produce the result set
*/

SELECT country,
       continent,
       total_population
 FROM population
 WHERE (continent, total_population) IN (SELECT continent,
                                                MIN(total_population)
                                         FROM population
                                        GROUP BY continent);


/*
 write a SELECT statement to query the table population , and filter the result set to include

only the countries in Americas and Africa,

and only the countries with the population of over 200 million
*/

SELECT country,
       continent,
       total_population
 FROM (SELECT country,
              continent,
              total_population
        FROM population
       WHERE continent IN ('Americas', 'Africa'))
WHERE total_population > 200000000;

/*
write a SELECT statement to query the table population , and produce a result set as below

country
continent
cnty_population - total_population of the country
highest_cnty_population - total_population of the highest populated country in the continent
lowest_cnty_population - total_population of the lowest populated country in the continent

Order the result by country name ascending

*/

SELECT cnty.country,
       cnty.continent,
       cnty.total_population AS cnty_population,
       cont.highest_cnty_population,
       cont.lowest_cnty_population
 FROM population cnty
 JOIN (SELECT continent,
              MAX(total_population) AS highest_cnty_population,
              MIN(total_population) AS lowest_cnty_population
        FROM population 
        GROUP BY continent) cont ON (cnty.continent = cont.continent)
ORDER BY cnty.country ASC;
       
-- CORRELATED SUBQUERIES -- depends on the main query
-- correlated subquery is executed for each record from the result set of the main query.

/*
write a SELECT statement (with correlated subquery) to query the table population , and  find all the countries with the population that is greater than or equal to the average population countries in that continent.

The result set includes the columns country, continent and total_population
*/
SELECT m.country,
       m.continent,
       m.total_population
 FROM population m
WHERE m.total_population >= (SELECT AVG(s.total_population)
                            FROM population s
                           WHERE s.continent = m.continent);


/*
table1 - player
columns - player_id, first_name, last_name, country, population

table2 - match_result
columns - year, tournament, winner_id, runner_up_id

relationship - winner_id and runner_up_id in match_result table relates to player table via player_id


write a SELECT statement with JOINs and Subqueries
to join the tables player  and match_result using player_id/ winner_id
then find all the players who won exactly 2 grand slams
The result set should include the output as below
year
tournament
player_name  - Full name of the player, i.e., first_name and last_name concatenated using a blank space between them.
player_country

*/
SELECT m.year,
       m.tournament,
       P.first_name || ' ' || P.last_name AS player_name,
       p.country AS player_country
 FROM match_result m JOIN player p ON (p.player_id = m.winner_id)
WHERE m.winner_id IN (SELECT winner_id 
                       FROM match_result 
                      GROUP BY winner_id
                      HAVING COUNT(*) = 2 ); 

