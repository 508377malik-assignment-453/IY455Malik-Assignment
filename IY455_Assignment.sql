CREATE DATABASE dvd_loan_system;
USE dvd_loan_system;

CREATE TABLE RENTAL_CATEGORY(
    rentalCategory VARCHAR(20) NOT NULL,
    rentalCost DECIMAL(5,2) NOT NULL,
    rentalDuration INT NOT NULL,
    fineCharge DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (rentalCategory)
);

CREATE TABLE BORROWER(
    borrowerNo VARCHAR(20) NOT NULL,
    borrowerName VARCHAR(20) NOT NULL,
    borrowerAddress VARCHAR(100) NOT NULL,
    borrowerStatus Varchar(20) NOT NULL,
    PRIMARY KEY (borrowerNo)
);

CREATE TABLE DVD(
    dvdNo VARCHAR(10) NOT NULL,
    dvdTitle VARCHAR(100) NOT NULL,
    starringActor VARCHAR(50) NOT NULL,
    dvdYear YEAR NOT NULL,
    rentalCategory VARCHAR(20) NOT NULL,
    PRIMARY KEY(dvdNo),
    FOREIGN KEY (rentalCategory) REFERENCES RENTAL_CATEGORY(rentalCategory)
);

CREATE TABLE LOAN(
    loanNo VARCHAR(10) NOT NULL,
    borrowerNo VARCHAR(20) NOT NULL,
    loan_date DATE NOT NULL,
    PRIMARY KEY (loanNo),
    FOREIGN KEY (borrowerNo) REFERENCES BORROWER (borrowerNo)
);

CREATE TABLE LOAN_DVD(
    loanNo VARCHAR(10) NOT NULL,
    dvdNo VARCHAR(10) NOT NULL,
    copyNo VARCHAR(10) NOT NULL,
    shelfPosition VARCHAR(10) NOT NULL,
    dvdStatus VARCHAR(10) NOT NULL,
    returnDueDate DATE NOT NULL,
    actualReturn_date DATE NULL,
    fineCharge DECIMAL(5,2) DEFAULT 0.00,
    PRIMARY KEY (loanNo, dvdNo),
    FOREIGN KEY (loanNo) REFERENCES LOAN (loanNo),
    FOREIGN KEY (dvdNo) REFERENCES DVD (dvdNo)
);

