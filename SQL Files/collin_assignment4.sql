-- -- Collin Shook
-- -- Assignment 4

TEE c:\z\logs\assignments\assignment4.txt

USE zdbnation;


-- Q1
SELECT *  FROM languages
ORDER BY language ASC;

-- Q2
SELECT COUNT(language) FROM languages;

-- Q3
SELECT * FROM languages
WHERE language LIKE "M%";

-- Q4
SELECT * FROM languages
WHERE language LIKE "%a";

-- Q5
SELECT * FROM languages
WHERE language LIKE "___n%";

-- Q6
SELECT * FROM languages
WHERE language LIKE "___n%h"
ORDER BY language ASC;

-- Q7
SELECT COUNT(language) FROM languages
WHERE language LIKE "M%";


USE zdbauto;

-- Q8
SELECT make, model, year_from FROM tbl_cars;

-- Q9
SELECT make, model, COUNT(year_from) FROM tbl_cars
GROUP BY make, model, year_from;


-- Q10

SELECT make, model FROM tbl_cars
WHERE model LIKE "roadster";

-- Q11
SELECT DISTINCT year_from FROM tbl_cars
WHERE year_from LIKE "____"
ORDER BY year_from ASC
LIMIT 1;



-- Q12
SELECT DISTINCT make FROM tbl_cars
WHERE make LIKE "c%" OR make LIKE "f%";

-- Q13
SELECT DISTINCT make, model, year_from, max_trunk_capacity_cu_ft FROM tbl_cars
ORDER BY max_trunk_capacity_cu_ft DESC
LIMIT 1;

-- Q14
SELECT DISTINCT make, model, year_from, max_trunk_capacity_cu_ft FROM tbl_cars
WHERE max_trunk_capacity_cu_ft LIKE "%_"
ORDER BY max_trunk_capacity_cu_ft ASC
LIMIT 1;


-- Q15
SELECT make, model, year_from, MAX(full_weight_lbs) FROM tbl_cars;

-- Q16
SELECT make, model, year_from FROM tbl_cars
LIMIT 25;


-- Q17
SELECT DISTINCT make, model, year_from, max_speed_mph FROM tbl_cars
ORDER BY max_speed_mph DESC
LIMIT 5;


-- Q18
SELECT DISTINCT make, model, year_from, electric_range_km FROM tbl_cars
ORDER BY electric_range_km DESC
LIMIT 5;


-- Q19
SELECT DISTINCT make, model, year_from, engine_hp FROM tbl_cars
ORDER BY engine_hp DESC
LIMIT 5;

-- Q20
SELECT generation FROM tbl_cars
GROUP BY generation;


-- Q21
SELECT series FROM tbl_cars
GROUP BY series;


notee;