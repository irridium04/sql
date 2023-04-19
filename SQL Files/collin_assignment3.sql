-- Collin Shook
-- Feb 21, 2023
-- Movie Assignment


TEE c:\z\logs\assignments\assignment3.txt

-- Q1

DROP DATABASE IF EXISTS zdb_movies;

CREATE DATABASE IF NOT EXISTS zdb_movies;
USE zdb_movies;

CREATE TABLE IF NOT EXISTS tbl_person (
    FirstName       VARCHAR(255),
    LastName        VARCHAR(255),
    Person_ID       INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

CREATE TABLE IF NOT EXISTS tbl_account (
    Account_Number      VARCHAR(255),
    Billing_Street      VARCHAR(255),
    Billing_City        VARCHAR(255),
    Billing_Zip         VARCHAR(255),
    Person_ID           INT(9),
    Account_ID          INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT fk_personAccount
    FOREIGN KEY (Person_ID)
    REFERENCES tbl_person(Person_ID)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tbl_movie (
    
    MovieTitle          VARCHAR(255),
    MovieGenre          VARCHAR(255),
    MovieYear           CHAR(4),
    MovieRating         VARCHAR(255),
    MovieComments       TEXT,
    Movie_ID            INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
    
);

CREATE TABLE IF NOT EXISTS tbl_library (
    
    Person_ID           INT(9),
    Movie_ID            INT(9),
    Library_ID          INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT fk_personLibrary
    FOREIGN KEY (Person_ID)
    REFERENCES tbl_person(Person_ID)
    ON DELETE CASCADE,

    CONSTRAINT fk_movieLibrary
    FOREIGN KEY (Movie_ID)
    REFERENCES tbl_movie(Movie_ID)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tbl_actor (
    
    FName               VARCHAR(255),
    LName               VARCHAR(255),
    Actor_Comments      BIGINT,
    Actor_ID            INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
    
);

CREATE TABLE IF NOT EXISTS tbl_movieActors (
    
    Movie_ID            INT(9),
    Actor_ID            INT(9),
    MovieActors_ID      INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT fk_movieMovieActors
    FOREIGN KEY (Movie_ID)
    REFERENCES tbl_movie(Movie_ID)
    ON DELETE CASCADE,

    CONSTRAINT fk_movieActor
    FOREIGN KEY (Actor_ID)
    REFERENCES tbl_actor(Actor_ID)
    ON DELETE CASCADE
);








-- Q2

INSERT INTO 
tbl_person(FirstName,LastName)
VALUES("Jim", "Goudy"), 
("Jaquavis", "Dondavis"),
("Bubba", "Smith"),
("Bill", "Bob");





-- Q3

INSERT INTO 
tbl_account(Account_Number, Billing_Street, Billing_City, Billing_Zip, Person_ID)
VALUES("4223854", "424 Rose St", "Kalispell, MT", "59901", 1),
("456353", "2234 Main St", "Missoula, MT", "59801", 2),
("64774", "244 6th St", "Kalispell, MT", "59901", 3),
("595984", "533 West St", "Hamilton, MT", "59840", 4);







-- Q4
INSERT INTO
tbl_movie()
VALUES("Homage To The Panda", "Action", "2020", "PG13", "Many Weeks OF Programming Will Save You Hours Of Planning", 1),
("Homage To The Panda 3D", "Action", "2021", "PG13", "The Panda In 3D", 2),
("Avengers", "Action", "2007", "PG13", "Marvel Movie", 3),
("Star Wars", "Action", "1977", "PG13", "Star Wars" , 4),
("Homage To The Panda II", "Romance", "2023", "R", "Hes back for more", 5),
("Potato JR", "Comedy", "2015", "R", "Spud", 6),
("Potato JR II", "Comedy", "2017", "R", "Spuddy", 7),
("Another Movieeeeee", "Horror", "2000", "PG13", "---", 8);


INSERT INTO
tbl_library(Person_ID, Movie_ID)
VALUES(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6),
(4,7),
(4,8);



-- Q5

INSERT INTO
tbl_actor(FName, LName)
VALUES("Actor","1"),
("Actor","2"),
("Actor","3"),
("Actor","4"),
("Actor","5"),
("Actor","6"),
("Actor","7"),
("Actor","8"),
("Actor","9"),
("Actor","10"),
("Actor","11"),
("Actor","12"),
("Actor","13"),
("Actor","14"),
("Actor","15"),
("Actor","16");

INSERT INTO
tbl_movieActors(Movie_ID, Actor_ID)
VALUES (1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16);

-- Q6

DELETE FROM tbl_person
WHERE Person_ID = 2;

-- Q7

DELETE FROM tbl_library
WHERE Library_ID = 3;



-- Q8
DELETE FROM tbl_movie
WHERE Movie_ID = 5;


-- Q9
DELETE FROM tbl_actor
WHERE Actor_ID = 9;




SELECT * FROM tbl_person;
SELECT * FROM tbl_library;
SELECT * FROM tbl_movie;
SELECT * FROM tbl_actor;


notee;