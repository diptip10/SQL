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


/*
write a SELECT statement to query the table sales , and produce a result set with an additional column called total_voume as below.

total_volume  - populated with total volume of cars delivered across all the years.
*/
SELECT company,
       year,
       quarter,
       volume,
       SUM(volume) OVER()AS total_volume
 FROM sales ;

/*
write a SELECT statement to query the table sales , and produce a result set with the additional columns as below

yearly_sales  - total volume of cars delivered by the company in that year.

company_sales -  total volume of cars delivered by the company during all years.

industry_sales - total volume of cars delivered by all the companies during all year.
*/

SELECT company,
       year,
       quarter,
       volume,
       SUM(volume) OVER(PARTITION BY company, year) AS yearly_sales,
       SUM(volume) over(PARTITION BY company) AS company_sales,
       SUM(volume) OVER() AS industry_sales
 FROM sales;

/*
 write a SELECT statement to query the table sales , and produce a result set with an additional column called sales_rank as below.

sales_rank  - Rank given based on the volume of sales. The record with the highest volume gets rank 1.
*/

SELECT company,
       year,
       quarter,
       volume,
       RANK() OVER(ORDER BY volume DESC) AS sales_rank
 FROM sales;

/*
write a SELECT statement to query the table sales , and produce a result set with the additional columns as below



yearly_rank  - Rank based on the sale volume within the company/ year. Highest sale volume is ranked as 1.

company_rank  -  Rank based on the sale volume within the company. Highest sale volume is ranked as 1.

industry_rank - Rank based on the sale volume across all the records. Highest sale volume is ranked as 1.

*/
SELECT company,
       year,
       quarter,
       volume,
       RANK() OVER(PARTITION BY company, year ORDER BY volume DESC) AS yearly_rank,
       RANK() OVER(PARTITION BY company ORDER BY volume DESC) AS company_rank ,
       RANK() OVER(ORDER BY volume DESC) AS industry_rank
 FROM sales;

 /*
write a SELECT statement to query the table sales , and produce a result set with the additional column as below

yoy_growth  - Increase in sales volume compared to the previous year/ quarter for this company. If there isn't a previous year, please leave the value as NULL.
*/
SELECT company,
       year,
       quarter,
       volume,
       volume - LAG(volume, 4) OVER(PARTITION BY company ORDER BY year, quarter) AS yoy_growth
 FROM sales;

/*write a SELECT statement to query the table sales , and produce a result set with the additional column as below

next_quarter_volume  - Sales volume from the next quarter for this company. If we don't have data for next quarter. Please report as NULL.

growth_pct  - Percentage increase in sales volume from this quarter to next for this company. If we don't have data for next quarter. Please report as NULL. Also, please report the percentage with upto 2 decimal places as below.
*/
SELECT company,
       year,
       quarter,
       volume,
       LEAD(volume) OVER(PARTITION BY company ORDER BY year, quarter) AS next_quarter_volume,
        ROUND(((LEAD(volume) OVER(PARTITION BY company ORDER BY year, quarter) - volume) / (CAST(volume AS REAL))) * 100, 2) AS growth_pct
 FROM sales;

 /*write a SELECT statement to query the table sales , and produce a result set with the additional column as below

sale_rank  - Rank based on the volume of sales. Record with the highest volume is assigned the value 1. If there is a tie, skip the next rank.

sale_dense_rank  - Rank based on the volume of sales. Record with the highest volume is assigned the value 1. Do not skip any ranks even if there is a tie.
*/
SELECT company,
       year,
       quarter,
       volume,
       RANK() OVER(ORDER BY volume DESC) AS sale_rank,
       DENSE_RANK() OVER(ORDER BY volume DESC) AS sale_dense_rank
 FROM sales;

/*write a SELECT statement to query the table sales , and produce a result set with only the unique
 records based on company, year & quarter. For each company, year, quarter, the record with the latest 
 created_date is the correct one, and the earlier one should be removed from the result set.
*/
WITH cte_dup
AS 
(SELECT company,
        year,
        quarter,
        volume,
       ROW_NUMBER() OVER(PARTITION BY company, year, quarter ORDER BY created_date DESC) AS rn
 FROM sales)
 SELECT company,
        year,
        quarter,
        volume
  FROM cte_dup 
 WHERE rn = 1;

/*
write a SELECT statement to query the table sales , and produce a result set with this data 
split into 4 buckets for each company as shown below. The buckets should be allocated based on
 the year and quarter, both in ascending order.
*/
SELECT company,
       year, 
       quarter,
       volume,
       NTILE(4) OVER(PARTITION BY company ORDER BY year, quarter) AS bucket
 FROM sales;

