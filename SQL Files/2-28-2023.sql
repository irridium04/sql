USE zdbNation;

SHOW TABLES;

DESCRIBE countries;

-- SELECT * FROM countries
-- LIMIT 10;


-- SELECT name
-- FROM countries
-- WHERE name LIKE  "Germany";


-- SELECT name
-- FROM countries
-- WHERE name LIKE "e%";

-- SELECT name
-- FROM countries
-- WHERE name LIKE "%e";

-- SELECT name
-- FROM countries
-- WHERE name LIKE "___n%";

-- SELECT name
-- FROM countries
-- WHERE name LIKE "_r%c_";

-- SELECT name
-- FROM countries
-- WHERE name LIKE "a%" AND area > 150000;


SELECT name , area, region_id
FROM countries
WHERE (name LIKE "a%" OR name LIKE "f%") AND area > 150000 OR region_id = 24;


SELECT SUM(area)
FROM countries
WHERE (name LIKE "a%" OR name LIKE "f%") 
AND area > 150000 
OR region_id = 24;


SELECT name, MAX(area)
FROM countries
WHERE (name LIKE "a%" OR name LIKE "f%") 
AND area > 150000 
OR region_id = 24;

SELECT CONCAT(SUM(AREA), " Miles") as "Total Area" , 
CONCAT(MIN(AREA), " Miles") as "Min Area", 
CONCAT(MAX(AREA), " Miles") as "Max Area"
FROM countries
WHERE (name LIKE "a%" OR name LIKE "f%") 
AND area > 150000
 OR region_id = 24;



SELECT region_id, COUNT(region_id)
FROM countries
WHERE (name LIKE "a%" OR name LIKE "f%" OR name LIKE "b%") 
AND area > 150000 
OR region_id = 24
GROUP BY region_id ASC;