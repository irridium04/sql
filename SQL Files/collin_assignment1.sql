-- Assignment 1
-- Collin Shook
-- 1/31/2023


TEE c:\\z/logs/assignments/assignement1.sql



-- Section 1 ---------------------------------

CREATE OR REPLACE DATABASE zAssgn1;
USE zAssgn1;


-- Question 1

CREATE TABLE IF NOT EXISTS tbl_books
(
    BookTitle      VARCHAR(255),
    AuthorFN       VARCHAR(255),
    AuthorLN       VARCHAR(255),
    CopyrightYear  INT(4),
    ISBN           INT(13),
    Genre          VARCHAR(255),
    Citation       TEXT(1000),
    Price          DOUBLE(4,2),
    Memo           VARCHAR(255),
    books_pk       INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
);


-- Question 2

CREATE TABLE IF NOT EXISTS tbl_authors
(
    AuthorFN       VARCHAR(255) NOT NULL,
    AuthorLN       VARCHAR(255) NOT NULL,
    Phone          INT(10),
    Email          VARCHAR(255),
    Email2         VARCHAR(255),
    Address1       VARCHAR(255),
    Address2       VARCHAR(255),
    City           VARCHAR(255) DEFAULT "Kalispell",
    ST             CHAR(2),
    ZIP            INT(5),
    Memo           VARCHAR(255),
    authors_pk     INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
    
);


-- Question 3

CREATE TABLE IF NOT EXISTS tbl_bookTour
(
    BookTitle      VARCHAR(255),
    Location       VARCHAR(255),
    LocationType   VARCHAR(255) DEFAULT "Coffee Shop",
    TelePhone      INT(10),
    Address1       VARCHAR(255),
    Address2       VARCHAR(255),
    City           VARCHAR(255),
    ST             CHAR(2),
    ZIP            INT(5),
    SalesCode      CHAR(7),
    Memo           VARCHAR(255)
    
);


-- Question 4

CREATE TABLE IF NOT EXISTS tbl_sales
(
    BookTitle      VARCHAR(255),
    Location       VARCHAR(255),
    Qty            INT(9),
    Price          DOUBLE(4,2),
    OrderDate      DATE(),
    sales_pk       INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
);



-- Section 2 --------------------------------------


-- Question 5

ALTER TABLE tbl_authors
DROP COLUMN Email2;


-- Question 6

ALTER TABLE tbl_bookTour
ADD COLUMN Email VARCHAR(255) AFTER TelePhone;


-- Question 7

ALTER TABLE tbl_bookTour
ADD COLUMN bookTour_pk    INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY


-- Question 8

ALTER TABLE tbl_bookTour
RENAME COLUMN TelePhone TO Phone;


-- Question 9

ALTER TABLE tbl_sales
RENAME TO tbl_orders;


-- Question 10

ALTER TABLE tbl_orders
ADD COLUMN DeliveryDate DATE() AFTER OrderDate;


-- Question 11
ALTER TABLE tbl_orders
DROP COLUMN sales_pk;
ADD COLUMN orders_pk INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY AFTER DeliveryDate;


-- Question 12

SHOW TABLES;


-- Question 13

DESCRIBE tbl_books;


-- Question 14

DESCRIBE tbl_authors;


-- Question 15

DESCRIBE tbl_bookTour;


-- Question 16

DESCRIBE tbl_orders;


-- Question 17

DROP TABLE tbl_books;


-- Question 18

DROP TABLE tbl_authors;


-- Question 19

DROP TABLE tbl_orders;


-- Question 20

DROP DATABASE zAssgn1;



