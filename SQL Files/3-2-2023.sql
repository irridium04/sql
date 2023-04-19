USE zdbauto;

ALTER TABLE cardb RENAME TO tbl_cars;


SELECT MIN(year_from) FROM tbl_cars
WHERE year_from IS NOT NULL;

SELECT year_from FROM tbl_cars
WHERE year_from LIKE "1950"
ORDER BY year_from ASC;

SELECT year_from, count(year_from) FROM tbl_cars
GROUP BY year_from;

SELECT year_from, make, model, count(year_from) FROM tbl_cars
WHERE year_from LIKE '1960'
OR year_from LIKE "1970"
GROUP BY year_from, make, model;

SELECT DISTINCT year_from, make, model, count(year_from) FROM tbl_cars
WHERE year_from LIKE '196_'

GROUP BY year_from, make, model;