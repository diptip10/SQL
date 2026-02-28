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
 
 