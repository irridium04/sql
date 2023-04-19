
USE zdbnation;

SHOW TABLES;

DESCRIBE countries;

-- 

SELECT name
FROM countries
WHERE name LIKE  "Canada";


SELECT name
FROM countries
WHERE name Like "__i%"
ORDER BY name ASC;


SELECT name
FROM countries
WHERE name Like ""
ORDER BY name ASC;

SELECT name, region_id
FROM countries
ORDER BY region_id DESC, name ASC;


SELECT MAX(area) AS max_area
FROM countries;

SELECT MIN(area) AS min_area
FROM countries;

SELECT SUM(area) AS sum_area
FROM countries;

SELECT AVG(area) AS avg_area
FROM countries;

SELECT STD(area) AS std_area
FROM countries;


SELECT region_id, count(region_id), sum(area)
FROM countries
GROUP BY region_id
ORDER BY sum(area) DESC;

