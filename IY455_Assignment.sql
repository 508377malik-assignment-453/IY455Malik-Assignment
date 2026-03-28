CREATE DATABASE DVD_Assignment_Database;
USE DVD_Assignment_Database;

CREATE TABLE RENTAL_CATEGORY(
    rentalCategory VARCHAR(20) NOT NULL,
    rentalCost DECIMAL(5,2) NOT NULL,
    rentalDuration VARCHAR(10) NOT NULL,
    returnDueDate DATE NOT NULL,
    finePerDay DECIMAL(5,2) NOT NULL,
    actualReturnDate DATE NULL,
    borrowerFineCharged DECIMAL (5,2) NOT NULL,
    PRIMARY KEY (rentalCategory)
);

CREATE TABLE BORROWER(
    borrowerNo VARCHAR(20) NOT NULL,
    borrowerName VARCHAR(50) NOT NULL,
    borrowerAddress VARCHAR(100) NOT NULL,
    borrowerStatus VARCHAR(20) NOT NULL,
    PRIMARY KEY (borrowerNo)
);

CREATE TABLE DVD(
    rentalCategory VARCHAR(20) NOT NULL,
    dvdNo VARCHAR(10) NOT NULL,
    dvdTitle VARCHAR(100) NOT NULL,
    starringActor VARCHAR(50) NOT NULL,
    dvdYear YEAR NOT NULL,
    PRIMARY KEY (dvdNo),
    FOREIGN KEY (rentalCategory) REFERENCES RENTAL_CATEGORY(rentalCategory)
);

CREATE TABLE LOAN(
    loanNo VARCHAR(10) NOT NULL,
    borrowerNo VARCHAR(20) NOT NULL,
    loanDate DATE NOT NULL,
    PRIMARY KEY (loanNo),
    FOREIGN KEY (borrowerNo) REFERENCES BORROWER (borrowerNo)
);

CREATE TABLE COPY(
    copyNo VARCHAR(10) NOT NULL,
    dvdNo VARCHAR(10) NOT NULL,
    shelfPosition VARCHAR(10) NOT NULL,
    PRIMARY KEY (copyNo),
    FOREIGN KEY (dvdNo) REFERENCES DVD (dvdNo)
);
