-- Queries / Procedures
-- Name:

-- MAKE SURE TO INCLUDE THE QUESTION AS A COMMENT 
-- IN YOUR SQL FILE

-- In some cases you might need to query on a view.
-- Include that intermediate query.

-- Start all views with the prefix vw
-- Start all stored procedures with sp

-- Be aware that you might have to use
-- different types of joins in some cases.


-- Collin Shook
-- 4/18/2023


USE classicmodels;
/*
-- Q1
-- List customerName, payments.amount, and productLine
-- for those customers who payed more than 50000

SELECT customerName, amount, productLine FROM customers
LEFT JOIN payments
ON customers.customerNumber = payments.customerNumber
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
LEFT JOIN products
ON orderdetails.productCode = products.productCode
WHERE amount > 50000
ORDER BY amount DESC;


-- Q2
-- List the the customerName, quantityOrdered for all
-- customers who ordered quantities 10 or more 
-- above the average. Try to write this as a sub query

SELECT DISTINCT customerName, quantityOrdered FROM customers
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE quantityOrdered >= (SELECT avg(quantityOrdered) FROM orderdetails) + 10
ORDER BY quantityOrdered ASC;


-- Q3
-- create a stored procedure that returns the
-- customerName, orderNumber, and productLine.
-- Write the store procedure so that it can take an input
-- for the productLine.  (Meaning when you call the 
-- stored procedure, you have to give it a productLine)

DELIMITER //

CREATE OR REPLACE PROCEDURE spQ3(IN pLine VARCHAR(50))

    BEGIN

        SELECT DISTINCT customerName, orders.orderNumber, productLine FROM customers
        LEFT JOIN orders
        ON customers.customerNumber = orders.customerNumber
        LEFT JOIN orderdetails
        ON orders.orderNumber = orderdetails.orderNumber
        LEFT JOIN products
        ON orderdetails.productCode = products.productCode
        WHERE productLine LIKE pLine
        ORDER BY customerName ASC;
    END  //

DELIMITER ;

call spQ3('Trains');


-- Q4
-- Write a stored procedure that shows ALL of the
-- customers [customerName, contactLastName, contactFirstName]
-- and any orderNumbers (No nulls in customers)

DELIMITER //

CREATE OR REPLACE PROCEDURE spQ4()

    BEGIN

        SELECT DISTINCT customerName, contactLastName, contactFirstName, orders.orderNumber FROM customers
        LEFT JOIN orders
        ON customers.customerNumber = orders.customerNumber
        ORDER BY customerName ASC;
        
    END  //

DELIMITER ;

call spQ4();


-- Q5
-- Write a view that shows the productName,productLine,
-- quantityInStock,buyPrice, and textDescription.
-- Order it by productLine and productName

CREATE OR REPLACE VIEW vwQ5 AS
SELECT productName, products.productLine, quantityInStock, buyPrice, textDescription FROM products
LEFT JOIN productlines
ON products.productLine = productlines.productLine
ORDER BY productLine, productName;


-- SELECT * FROM vwQ5;

-- Q6
-- Write a stored procedure that queries the view in previous
-- question, but only shows the products that are below
-- the average buy price. Try to write this with an embedded query

DELIMITER //

CREATE OR REPLACE PROCEDURE spQ6()

    BEGIN

        SELECT productName, buyPrice FROM vwQ5
        WHERE buyPrice < (SELECT avg(buyPrice) FROM products);
    END  //

DELIMITER ;

call spQ6();
-- Q7
-- Write a view that shows the employees lastName, firstName,
-- and country.  Order it by country, lastname, firstname.

CREATE OR REPLACE VIEW vwQ7 AS
SELECT lastName, firstName, country FROM employees
LEFT JOIN offices
ON employees.officeCode = offices.officeCode
ORDER BY country, lastname, firstname;

--SELECT * FROM vwQ7;

-- Q8
-- Write a stored procedure that allows input of a specific country 
-- thta shows the employees lastName, firstName,
-- and country.  Order it by country, lastname, firstname.
-- Test with a country of your choice.

DELIMITER //

CREATE OR REPLACE PROCEDURE spQ8(IN cntry VARCHAR(50))

    BEGIN
    
        SELECT lastName, firstName, country FROM vwQ7
        WHERE country LIKE cntry
        ORDER BY country, lastName, firstName;
        
    END  //

DELIMITER ;

call spQ8('Japan');


*/

-- Q9
-- Write a view that shows the country and lists the
-- number of people in that country.

CREATE OR REPLACE VIEW vwQ9 AS
SELECT country, count(firstName) FROM offices
LEFT JOIN employees
ON offices.officeCode = employees.officeCode
GROUP BY country;

-- Q10
-- Write a stored procedure that counts all the orders 
-- for each customerName, the average spent and the max amount.
-- Use the price each.
/*
DELIMITER //

CREATE OR REPLACE PROCEDURE spQ10()

    BEGIN
    
        SELECT count()
        
    END  //

DELIMITER ;

call spQ10();


-- Q11
-- Write a view that shows all the employee lastnames, country, state
-- and the total/sum of the orderedOrdered for each productline.
-- For example I want to see that Smith from Germany (may or maynot have)
-- a state, had a total of 800 classic cars. (NOTE the real data will
-- be different) (NOTE: not all employees may have a country or 
-- state designated - but all the employees have to be listed)

-- Q12
-- Write a view that lists ALL of the productName, ProductDescription, 
-- quantityStock,buyPrice and any textDescriptions that go with them.
-- (NOTE: Note all products may have a description, but all products
-- mus be shown)
