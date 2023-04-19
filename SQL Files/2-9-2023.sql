-- Collin Shook
-- 2-9-2023


DROP DATABASE IF EXISTS zdbcasDemo;

CREATE OR REPLACE DATABASE zdbcasDemo;
USE zdbcasDemo;

DROP TABLE IF EXISTS tbl_author;
DROP TABLE IF EXISTS tbl_book;


CREATE TABLE IF NOT EXISTS tbl_author
(
    FName       VARCHAR(255),
    LName       VARCHAR(255),
    Author_ID   INT(7) NOT NULL AUTO_INCREMENT PRIMARY KEY
);


SELECT "*** Describe author table" AS '';
DESCRIBE tbl_author;

CREATE TABLE IF NOT EXISTS tbl_book
(
    Title       VARCHAR(255),
    Author_ID   INT(7),
    Book_ID     INT(7) NOT NULL AUTO_INCREMENT PRIMARY KEY,

    CONSTRAINT fk_bookAuthor
    FOREIGN KEY (Author_ID)
    REFERENCES tbl_author(Author_ID)
    ON DELETE CASCADE
);

SELECT "*** Describe book table" AS '';
DESCRIBE tbl_book;


INSERT INTO tbl_author(FName, LName, Author_ID)
VALUES('Bubba', 'Brown', 1),
    ('Sally', 'Smith', 2),
    ('Charlie', 'Coolidge', 3);


SELECT * FROM tbl_author;


INSERT INTO tbl_book(Title, Author_ID)
VALUES('Baking Brownies', 1),
    ('Basting Beef', 1),
    ('Surfing', 2),
    ('Snowboarding', 2),
    ('Sailing', 2),
    ('Caving', 3),
    ('Carving Wood', 3),
    ('Cycling', 3);
    
    
SELECT * FROM tbl_book;

SELECT FName, LName, Title, tbl_author.Author_ID, Book_ID 
FROM tbl_author JOIN tbl_book
ON tbl_author.Author_ID = tbl_book.Author_ID;

DELETE FROM tbl_author
WHERE Author_ID = 2;


SELECT FName, LName, Title, tbl_author.Author_ID, Book_ID 
FROM tbl_author JOIN tbl_book
ON tbl_author.Author_ID = tbl_book.Author_ID;