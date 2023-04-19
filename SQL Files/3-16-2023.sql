USE classicmodels;

/*
SELECT contactLastName, city, state FROM customers
WHERE state IS NULL;


SELECT productName, productLine FROM products
ORDER BY productName;

SELECT contactLastName, productName, productLine
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode;



SELECT contactFirstName, contactLastName, COUNT(contactLastName)
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE productLine LIKE "Planes"
GROUP BY productLine, contactLastName 
ORDER BY contactLastName, productName;


SELECT contactFirstName, contactLastName, addressLine1, city, state, country, productLine, COUNT(contactLastName)
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
GROUP BY contactLastName, productLine;


SELECT contactFirstName, contactLastName, sum(amount)
FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY contactLastName
ORDER BY sum(amount) DESC;

select customerName, sum(amount) as total, max(amount) as max, count(amount)
from customers left join payments
on customers.customerNumber = payments.customerNumber
group by customerName; 

select customerName, sum(amount) as total, max(amount) as max, count(amount)
from customers left join payments
on customers.customerNumber = payments.customerNumber
where amount is null 
group by customerName; 

select customerName, sum(amount) as total, min(amount) as min, max(amount) as max, count(amount)
from customers left join payments
on customers.customerNumber = payments.customerNumber
where amount <= 5000
group by customerName; 

select customerName, sum(amount) as total, min(amount) as min, max(amount) as max, count(amount)
from payments right join customers
on customers.customerNumber = payments.customerNumber
where amount <= 5000
group by customerName;


SELECT country, lastName
FROM offices RIGHT JOIN employees
ON offices.officeCode = employees.officeCode;

*/


SELECT DISTINCT customerName, productLine, productName
FROM customers
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
LEFT JOIN products
ON orderdetails.productCode = products.productCode
WHERE productLine LIKE "Vintage Cars"
GROUP BY customerName, productLine;