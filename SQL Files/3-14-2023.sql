USE zdbjoins;

CREATE OR REPLACE TABLE tbl_hunters
(
    FName           VARCHAR(50),
    LName           VARCHAR(50),
    Type            VARCHAR(50),
    Hunter_id       INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE OR REPLACE TABLE tbl_fishermen
(
    FName               VARCHAR(50),
    LName               VARCHAR(50),
    Type                VARCHAR(50),
    Fisherman_id        INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
);


INSERT INTO tbl_hunters(FName, LName, type)
VALUES ("Bob","Barker","hunter"),
("Ali","Allison","hunter"),
("Car","Carlson","hunter"),
("Dan","Dunsford","hunter"),
("Jon","Jones","hunter"),
("Tom","Troves","hunter"),
("Sam","Smith","hunter"),
("Tim","Truvers","hunter");

SELECT * FROM tbl_hunters
ORDER BY FName, LName;

INSERT INTO tbl_fishermen(FName, LName, type)
VALUES ("Bobby","Barnes","fisherman"),
("Alley","Allsford","fisherman"),
("Carrie","Cooper","fisherman"),
("Dan","Dunsford","fisherman"),
("Jon","Jones","fisherman"),
("Tom","Troves","fisherman"),
("Sammy","Smothers","fisherman"),
("Thomas","Tuffy","fisherman");

SELECT * FROM tbl_fishermen
ORDER BY FName, LName;


SELECT FName, LName, type FROM tbl_hunters
UNION
SELECT FName, LName, type FROM tbl_fishermen
ORDER BY FName, LName;


SELECT FName, LName FROM tbl_hunters
UNION ALL
SELECT FName, LName FROM tbl_fishermen
ORDER BY FName, LName;

SELECT FName, LName FROM tbl_hunters
UNION DISTINCT
SELECT FName, LName FROM tbl_fishermen
ORDER BY FName, LName;

SELECT FName, LName FROM tbl_hunters
INTERSECT
SELECT FName, LName FROM tbl_fishermen
ORDER BY FName, LName;


/*
SELECT FName, LName FROM tbl_hunters
EXCEPT
SELECT FName, LName FROM tbl_fishermen
ORDER BY FName, LName;
*/

SELECT FName, LName, type FROM tbl_hunters
WHERE LName LIKE "A%"
UNION
SELECT FName, LName, type FROM tbl_fishermen
WHERE LName LIKE "T%"
ORDER BY FName, LName;

