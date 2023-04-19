USE zdbauto;

SHOW TABLES;


CREATE OR REPLACE VIEW v1980sCars as
SELECT DISTINCT make, model, series, year_from, number_of_cylinders FROM tbl_cars
WHERE year_from >= 1980 AND year_from <= 1990
ORDER BY year_from, make, model, series;

-- SELECT * FROM v1980sCars;


-- SELECT DISTINCT series FROM v1980sCars;


-- SELECT DISTINCT make, model, series, year_from FROM v1980sCars
-- WHERE year_from = 1985 OR series LIKE "Pickup%";

-- SELECT DISTINCT * FROM v1980sCars
-- WHERE number_of_cylinders = 4 AND year_from = 1990;

SELECT year_from, count(number_of_cylinders) FROM tbl_cars
WHERE number_of_cylinders = 4
GROUP BY year_from;