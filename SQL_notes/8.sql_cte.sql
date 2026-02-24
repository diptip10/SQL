-- CTEs -- COMMON TABLE EXPRESSIONS are mainly used to replace subqueries to make the SQL more readable 
-- and avoid  duplication of code.

/*
write a SELECT statement using Common Table Expressions (CTE) to query the table population, and produce the result set as shown in the screenshot below.

country

continent

cnty_population - Population of the country

highest_cont_population - Population of the highest populated country in the continent

lowest_cont_population - Population of the lowest populated country in the continent
*/

WITH cte_cont AS 
 (SELECT continent,
        MAX(total_population) AS highest_cont_population,
        MIN(total_population) AS lowest_cont_population
  FROM Population  
 GROUP BY continent)
SELECT cnty.country,
       cnty.continent,
       cnty.total_population AS cnty_population,
       cont.highest_cont_population,
       cont.lowest_cont_population
 FROM Population cnty JOIN cte_cont cont
ON (cnty.continent = cont.continent);
       
 /*
  write a SELECT statement using Common Table Expressions (CTE) to query the table population, and produce the result set as shown in the screenshot below.

country

continent

cnty_population - Population of the country

highest_cont_population - Population of the highest populated country in the continent

highest_world_population - Population of the highest populated country in the entire table
*/

WITH cte_continent AS 
 (SELECT continent,
        MAX(total_population) AS highest_cont_population
  FROM Population
 GROUP BY continent),
  cte_world AS 
  (SELECT MAX(total_population) AS highest_world_population
    FROM Population)
SELECT cnty.country,
       cnty.continent,
       cnty.total_population AS cnty_population,
       cont.highest_cont_population,
       cte_world.highest_world_population
 FROM Population cnty
JOIN cte_continent cont ON (cnty.continent = cont.continent)
JOIN cte_world;

