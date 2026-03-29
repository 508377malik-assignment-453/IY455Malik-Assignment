CREATE DATABASE DVD_Assignment_Database;
USE DVD_Assignment_Database;

CREATE TABLE RENTAL_CATEGORY (
    rentalCategory VARCHAR(50) NOT NULL,
    rentalCost DECIMAL(5,2) NOT NULL,
    rentalDuration VARCHAR(20) NOT NULL,
    finePerDay DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (rentalCategory)
);

INSERT INTO RENTAL_CATEGORY (rentalCategory, rentalCost, rentalDuration, finePerDay) VALUES
('Superhero',4.50, '7 DAYS', 2.00),
('Adventure',3.50, '7 DAYS', 2.00),
('Horror',4.00, '7 DAYS', 2.00),
('Animation',3.50, '7 DAYS', 1.50),
('Action',4.00, '7 DAYS', 2.00),
('Comedy',4.50, '7 DAYS', 1.50),
('Biography',3.80, '7 DAYS', 1.50),
('Drama',4.20, '7 DAYS', 1.50),
('Crime',3.80, '7 DAYS', 2.00);


CREATE TABLE BORROWER (
    borrowerNo VARCHAR(10) NOT NULL,
    borrowerName VARCHAR(100) NOT NULL,
    borrowerAddress VARCHAR(200) NOT NULL,
    borrowerStatus VARCHAR(20) NOT NULL,
    PRIMARY KEY (borrowerNo)
);

INSERT INTO BORROWER (borrowerNo, borrowerName, borrowerAddress, borrowerStatus) VALUES
('BN1001', 'Alice Turner','12 Maple Street, Nottingham NG1 1AA','Allowed'),
('BN1002', 'Bob Harris','5 Oak Avenue, Derby DE1 2BB','Allowed'),
('BN1003', 'Carol White','88 Pine Road, Leicester LE1 3CC','Suspended'),
('BN1004', 'David Brown','3 Elm Close, Birmingham B1 4DD','Allowed'),
('BN1005', 'Emma Clarke','17 Birch Lane, Coventry CV1 5EE','Allowed'),
('BN1006', 'Frank Wilson','29 Cedar Drive, Nottingham NG2 6FF','Allowed'),
('BN1007', 'Grace Lewis','44 Ash Court, Sheffield S1 7GG','Suspended'),
('BN1008', 'Henry Moore','6 Walnut Way, Manchester M1 8HH','Allowed'),
('BN1009', 'Isla Scott','71 Chestnut Ave, Liverpool L1 9II','Allowed'),
('BN1010', 'Jack Taylor','33 Sycamore Road, Nottingham NG3 1JJ','Allowed');


CREATE TABLE LOAN (
    loanNo VARCHAR(10) NOT NULL,
    borrowerNo VARCHAR(10) NOT NULL,
    loanDate DATE NOT NULL,
    PRIMARY KEY (loanNo),
    FOREIGN KEY (borrowerNo) REFERENCES BORROWER(borrowerNo)
);

INSERT INTO LOAN (loanNo, borrowerNo, loanDate) VALUES
('LN10001', 'BN1001', '2024-01-05'),
('LN10002', 'BN1002', '2024-01-07'),
('LN10003', 'BN1003', '2024-01-10'),
('LN10004', 'BN1004', '2024-01-12'),
('LN10005', 'BN1005', '2024-01-15'),
('LN10006', 'BN1006', '2024-01-18'),
('LN10007', 'BN1007', '2024-01-20'),
('LN10008', 'BN1008', '2024-01-22'),
('LN10009', 'BN1009', '2024-01-25'),
('LN10010', 'BN1010', '2024-01-28');


CREATE TABLE DVD (
    dvdNo VARCHAR(10) NOT NULL,
    dvdTitle VARCHAR(200) NOT NULL,
    dvdStarring VARCHAR(100) NOT NULL,
    dvdYear INT NOT NULL,
    rentalCategory VARCHAR(50) NOT NULL,
    PRIMARY KEY (dvdNo),
    FOREIGN KEY (rentalCategory) REFERENCES RENTAL_CATEGORY(rentalCategory)
);

INSERT INTO DVD (dvdNo, dvdTitle, dvdStarring, dvdYear, rentalCategory) VALUES
('DN050',   'Guardians of the Galaxy','Chris Pratt',2014, 'Superhero'),
('DN0135',  'Prometheus','Noomi Rapace',2012, 'Adventure'),
('DN0171',  'Split','James McAvoy',2016, 'Horror'),
('DN0102',  'Sing','Matthew McConaughey',2016, 'Animation'),
('DN0188',  'Suicide Squad','Will Smith',2016, 'Superhero'),
('DN025',   'The Great Wall','Matt Damon',2016, 'Action'),
('DN0157',  'La La Land','Ryan Gosling',2016, 'Comedy'),
('DN0177',  'Mindhorn','Essie Davis',2016, 'Comedy'),
('DN0129',  'The Lost City of Z','Charlie Hunnam',2016, 'Action'),
('DN0114',  'Passengers','Jennifer Lawrence',2016, 'Adventure'),
('DN085',   'Fantastic Beasts and Where to Find Them','Eddie Redmayne',2016, 'Adventure'),
('DN083',   'Hidden Figures','Taraji P. Henson',2016, 'Biography'),
('DN039',   'Rogue One','Felicity Jones',2016, 'Action'),
('DN0117',  'Moana','Aulii Cravalho',2016, 'Animation'),
('DN0183',  'Colossal','Anne Hathaway',2016, 'Action'),
('DN100',   'The Secret Life of Pets','Louis C.K.',2016, 'Animation'),
('DN070',   'Hacksaw Ridge','Andrew Garfield',2016, 'Biography'),
('DN048',   'Jason Bourne','Matt Damon',2016, 'Action'),
('DN0146',  'Lion','Dev Patel',2016, 'Biography'),
('DN062',   'Arrival','Amy Adams',2016, 'Drama');



CREATE TABLE COPY (
    copyNo VARCHAR(10) NOT NULL,
    dvdNo VARCHAR(10) NOT NULL,
    shelfPosition VARCHAR(10) NOT NULL,
    copyStatus VARCHAR(20) NOT NULL,
    PRIMARY KEY (copyNo),
    FOREIGN KEY (dvdNo) REFERENCES DVD(dvdNo)
);

INSERT INTO COPY (copyNo, dvdNo, shelfPosition, copyStatus) VALUES
('CN2001', 'DN050',  'SA101', 'On Loan'),
('CN2002', 'DN0135', 'SA102', 'Available'),
('CN2003', 'DN0171', 'SB103', 'On Loan'),
('CN2004', 'DN0102', 'SB104', 'Available'),
('CN2005', 'DN0188', 'SA105', 'On Loan'),
('CN2006', 'DN025',  'SC106', 'Available'),
('CN2007', 'DN0157', 'SC107', 'On Loan'),
('CN2008', 'DN0177', 'SC108', 'Available'),
('CN2009', 'DN0129', 'SC109', 'On Loan'),
('CN2010', 'DN0114', 'SA110', 'Available'),
('CN2011', 'DN085',  'SA111', 'On Loan'),
('CN2012', 'DN083',  'SD112', 'Available'),
('CN2013', 'DN039',  'SC113', 'On Loan'),
('CN2014', 'DN0117', 'SB114', 'Available'),
('CN2015', 'DN0183', 'SC115', 'On Loan'),
('CN2016', 'DN100',  'SB116', 'Available'),
('CN2017', 'DN070',  'SD117', 'On Loan'),
('CN2018', 'DN048',  'SC118', 'Available'),
('CN2019', 'DN0146', 'SD119', 'On Loan'),
('CN2020', 'DN062',  'SE120', 'On Loan');



CREATE TABLE LOAN_LINE (
    loanNo VARCHAR(10) NOT NULL,
    copyNo VARCHAR(10) NOT NULL,
    returnDueDate DATE NOT NULL,
    actualReturnDate DATE,
    borrowerFine DECIMAL(6,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (loanNo, copyNo),
    FOREIGN KEY (loanNo) REFERENCES LOAN(loanNo),
    FOREIGN KEY (copyNo) REFERENCES COPY(copyNo)
);

INSERT INTO LOAN_LINE (loanNo, copyNo, returnDueDate, actualReturnDate, borrowerFine) VALUES
('LN10001', 'CN2001', '2024-01-12', '2024-01-11', 0.00),
('LN10002', 'CN2003', '2024-01-14', NULL,          0.00),
('LN10003', 'CN2005', '2024-01-17', '2024-01-20', 6.00),
('LN10004', 'CN2007', '2024-01-19', NULL,          0.00),
('LN10005', 'CN2009', '2024-01-22', '2024-01-22', 0.00),
('LN10006', 'CN2011', '2024-01-25', '2024-01-27', 4.00),
('LN10007', 'CN2013', '2024-01-27', NULL,          0.00),
('LN10008', 'CN2015', '2024-01-29', '2024-01-29', 0.00),
('LN10009', 'CN2017', '2024-02-01', NULL,          0.00),
('LN10010', 'CN2019', '2024-02-04', '2024-02-06', 4.00);
