

CREATE OR REPLACE DATABASE zbooks;

USE zbooks;

CREATE OR REPLACE TABLE tbl_author
(
    AuthFN     VARCHAR(255), 
    AuthLN     VARCHAR(255), 
    Address1   VARCHAR(255), 
    Address2   VARCHAR(255), 
    City       VARCHAR(255), 
    ST         CHAR(2), 
    ZIP        INT(5), 
    Memo       TEXT,
    Modified   TIMESTAMP,
    Author_ID  INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY 
);

DESCRIBE tbl_author;

CREATE OR REPLACE TABLE tbl_book
(
    Title       VARCHAR(255),
    Genre       VARCHAR(255),
    ISBN        CHAR(13),
    PubDate     DATE,
    Citation    TEXT,
    Memo        TEXT,
    Author_ID   INT(9),
    Book_ID     INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

    CONSTRAINT fk_bookAuthor
    FOREIGN KEY (Author_ID)
    REFERENCES tbl_author(Author_ID)
);

DESCRIBE tbl_book;


CREATE OR REPLACE TABLE tbl_bookstore
(
    BookStore       VARCHAR(255),
    ManagerFN       VARCHAR(255), 
    ManagerLN       VARCHAR(255), 
    Address1        VARCHAR(255), 
    Address2        VARCHAR(255), 
    City            VARCHAR(255), 
    ST              CHAR(2), 
    ZIP             INT(5), 
    Phone           CHAR(10),
    Memo            TEXT,
    Modified        TIMESTAMP,
    BookStore_ID    INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DESCRIBE tbl_bookstore;


CREATE OR REPLACE TABLE tbl_inventory
(
    Qty             INT(9),
    Price           DOUBLE(9,2), 
    Book_ID         INT(9), 
    Modified        TIMESTAMP,
    BookStore_ID    INT(9),
    Inventory_ID    INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

    CONSTRAINT fk_inventoryBook
    FOREIGN KEY (Book_ID)
    REFERENCES tbl_book(Book_ID),

    CONSTRAINT fk_inventoryBookStore
    FOREIGN KEY (BookStore_ID)
    REFERENCES tbl_bookstore(BookStore_ID)
);

DESCRIBE tbl_inventory;