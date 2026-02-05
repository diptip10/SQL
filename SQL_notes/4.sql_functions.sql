-- SQL FUNCTIONS - 1.USER-DEFINED     2.BUILT-IN FUNCTIONS
-- BUILT-IN ---1.SCALAR --(STRING FUNCTION, MATH FUNCTION, DATE FUNCTION, CONDITIONAL FUNCTIONS)
--             2.AGGREGATE FUNCTIONS--(COUNT)
--             3.WINDOW FUNCTION/ANALYTICAL

-- STRING FUNCTIONS - UPPER, LOWER, CONCAT
SELECT UPPER(country) AS country,
    LOWER(continent) AS continent,
    total_population
 FROM population;

SELECT continent || '-' || country AS coountry,
    total_population
 FROM population;

SELECT 'continent:' || continent || '-' || 'country:' || country AS country,
    total_population
 FROM population;