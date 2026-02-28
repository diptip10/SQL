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

