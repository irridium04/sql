-- Collin Shook

TEE c:\\z/logs/assignments/assignment2.txt;

SHOW DATABASES;

DROP DATABASE IF EXISTS zdbVal;
CREATE DATABASE zdbVal;

USE zdbVal;


CREATE OR REPLACE TABLE tbl_person (
    FN              VARCHAR(255),
    LN              VARCHAR(255),
    Person_ID       INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO zdbVal.tbl_person()
VALUES("Bubba", "Brown", 1),
("Jaquavis", "Rondarius", 2),
("Ree", "Todd", 3),
("Jim", "Goudy", 4);

SELECT * FROM zdbVal.tbl_person;

CREATE OR REPLACE TABLE tbl_cars (
    Make                VARCHAR(255),
    Model               VARCHAR(255),
    Color               VARCHAR(255),
    Person_ID           INT(9),
    Car_ID              INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

    CONSTRAINT fk_carsPerson
    FOREIGN KEY (Person_ID)
    REFERENCES tbl_person(Person_ID)
    ON DELETE CASCADE

);

INSERT INTO zdbVal.tbl_cars()
VALUES('Buick', 'B', 'Black', 1, 1),
('BMW', 'A', 'Brown', 1, 2),
('Jaguar', 'J', 'Red', 2, 3),
('JCar', 'JModel', 'Jcolor', 2, 4),
('Rolls Royce', 'RModel', 'Red', 3, 5),
('RCar', 'RModel2', 'Rose', 3, 6),
('Goudy Mobile', 'V1', 'Gold', 4, 7),
('Goudy Racer', '1500', 'Matte Black', 4, 8);

SELECT * FROM zdbVal.tbl_cars;

SELECT FN, LN, Make, Model, Color,tbl_person.Person_ID, Car_ID 
FROM tbl_person JOIN tbl_cars
ON tbl_person.Person_ID = tbl_cars.Person_ID;


CREATE OR REPLACE TABLE tbl_repairs (
    Repair              VARCHAR(255),
    Car_ID              INT(9),
    Repair_ID           INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

    CONSTRAINT fk_repairCars
    FOREIGN KEY (Car_ID)
    REFERENCES tbl_cars(Car_ID)
    ON DELETE CASCADE
);

INSERT INTO zdbVal.tbl_repairs()
VALUES('Oil Change', 7, 1),
('Blinker Fluid Top Off', 7, 2),
('Transmission Flush', 2, 3),
('Oil Change', 2, 4);

SELECT * FROM zdbVal.tbl_repairs;

/*
SELECT FN, LN, Make, Model, Color, Repair, tbl_repairs.Car_ID, Repair_ID 
FROM tbl_person JOIN tbl_cars OUTER JOIN tbl_repairs
ON (tbl_person.Person_ID = tbl_cars.Person_ID) 
AND (tbl_cars.Car_ID = tbl_repairs.Car_ID);
*/

CREATE TABLE IF NOT EXISTS tbl_book
(
    Title       VARCHAR(255),
    Person_ID   INT(9),
    Book_ID     INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

    CONSTRAINT fk_bookPerson
    FOREIGN KEY (Person_ID)
    REFERENCES tbl_person(Person_ID)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tbl_chapters
(
    ChapterTitle    VARCHAR(255),
    Book_ID         INT(9),
    Chapter_ID      INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

    CONSTRAINT fk_chaptersBook
    FOREIGN KEY (Book_ID)
    REFERENCES tbl_book(Book_ID)
    ON DELETE CASCADE
);

INSERT INTO tbl_book(Title, Person_ID)
    VALUES("Big Book", 2),
    ("Homage to the Panda", 4),
    ("Homage to the Panda II", 4),
    ("To Kill a Mockingbird", 1);

INSERT INTO tbl_chapters(ChapterTitle, Book_ID)
    VALUES("Chapter 1", 1),
   ("Chapter 2", 1),
   ("Chapter 3", 1),
   ("Many Weeks Of Programming", 2),
   ("Will Save You Hours Of Planning", 2),
   ("Good Evening Developers!", 2),
   ("TKAM 1", 4),
   ("TKAM 2", 4),
   ("TKAM 3", 4);

SELECT * FROM tbl_person;
SELECT * FROM tbl_cars;
SELECT * FROM tbl_repairs;


DELETE FROM tbl_cars WHERE Car_ID = 2;
DELETE FROM tbl_repairs WHERE Repair_ID = 1;
DELETE FROM tbl_person WHERE Person_ID = 3;

SELECT * FROM tbl_person;
SELECT * FROM tbl_cars;
SELECT * FROM tbl_repairs;
SELECT * FROM tbl_book;
SELECT * FROM tbl_chapters;

SELECT FN, LN, Title, tbl_person.Person_ID, Book_ID 
FROM tbl_person JOIN tbl_book
ON tbl_person.Person_ID = tbl_book.Person_ID;

SELECT Title, ChapterTitle, tbl_book.Book_ID, Chapter_ID 
FROM tbl_book JOIN tbl_chapters
ON tbl_book.Book_ID = tbl_chapters.Book_ID;

DELETE FROM tbl_book WHERE Title LIKE "Homage to the Panda II";

SELECT Title, ChapterTitle, tbl_book.Book_ID, Chapter_ID 
FROM tbl_book JOIN tbl_chapters
ON tbl_book.Book_ID = tbl_chapters.Book_ID;

DELETE FROM tbl_person WHERE Person_ID = 2;

SELECT * FROM tbl_person;
SELECT * FROM tbl_cars;
SELECT * FROM tbl_repairs;
SELECT * FROM tbl_book;
SELECT * FROM tbl_chapters;

SELECT FN, LN, Title, tbl_person.Person_ID, Book_ID 
FROM tbl_person JOIN tbl_book
ON tbl_person.Person_ID = tbl_book.Person_ID;

SELECT Title, ChapterTitle, tbl_book.Book_ID, Chapter_ID 
FROM tbl_book JOIN tbl_chapters
ON tbl_book.Book_ID = tbl_chapters.Book_ID;

notee;