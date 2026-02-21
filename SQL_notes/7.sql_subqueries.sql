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

