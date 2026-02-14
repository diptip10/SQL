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


