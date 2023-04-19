/*

USE zdbauto;

SHOW TABLES;




CREATE OR REPLACE VIEW vRoadsters AS
SELECT make, model, series FROM tbl_cars
WHERE series LIKE "Roadster";



-- SELECT * FROM vRoadsters;

SELECT make, model, COUNT(model) FROM vRoadsters
GROUP BY make, model
HAVING model LIKE "SL-Class" OR make LIKE "Porsche";


CREATE OR REPLACE VIEW vModernCars as
SELECT DISTINCT make, model, series, year_from FROM tbl_cars
WHERE year_from >= 1960 AND year_from < 1970
ORDER BY make, model, series;



SELECT count(model) FROM vModernCars;
*/

use classicmodels;


SELECT productName, buyPrice FROM products
WHERE buyPrice > (SELECT avg(buyPrice) from products)
ORDER BY buyPrice ASC;
