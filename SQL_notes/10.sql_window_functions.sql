-- Set-up the tables for window functions
DROP TABLE IF EXISTS sales;

CREATE TABLE sales
(
    company    VARCHAR(20),
    year           INTEGER,
    quarter       CHAR(2),
    volume      INTEGER
);

INSERT INTO sales
    (company, year, quarter, volume)
VALUES
    ('BYD', 2022,'Q1',143223),
    ('BYD', 2022,'Q2',180296),
    ('BYD', 2022,'Q3',258610),
    ('BYD', 2022,'Q4',329011),
    ('BYD', 2023,'Q1',264647),
    ('BYD', 2023,'Q2',352163),
    ('BYD', 2023,'Q3',431603),
    ('BYD', 2023,'Q4',526409),    
    ('Tesla', 2022,'Q1',310048),
    ('Tesla', 2022,'Q2',254695),
    ('Tesla', 2022,'Q3',343830),
    ('Tesla', 2022,'Q4',405278),
    ('Tesla', 2023,'Q1',422875),
    ('Tesla', 2023,'Q2',466140),
    ('Tesla', 2023,'Q3',435059),
    ('Tesla', 2023,'Q4',484507)    ;	
    
SELECT * FROM sales;
