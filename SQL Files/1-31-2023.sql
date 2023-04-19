-- Collin Shook
-- 1/31/2023

/* TEE c:\\z/logs/01-31-2023.sql */

CREATE OR REPLACE DATABASE zTrash1;

USE zTrash1;

SHOW DATABASES;

CREATE OR REPLACE TABLE tbl_person
(
    Fname       VARCHAR(50),
    Lname       VARCHAR(50),
    City        VARCHAR(50),
    Person_ID   INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DESCRIBE tbl_person;

CREATE OR REPLACE DATABASE zdbTrash2;

USE zdbTrash2;

SHOW DATABASES;

CREATE OR REPLACE TABLE tbl_person
(
    Fname       VARCHAR(50),
    Lname       VARCHAR(50),
    City        VARCHAR(50),
    Person_ID   INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DESCRIBE tbl_person;