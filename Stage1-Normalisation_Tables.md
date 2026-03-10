# Stage 1 – Normalisation Tables

---

## 1NF (First Normal Form)

| LoanNo (PK) | BorrowerNo | BorrowerName | BorrowerAddress | BorrowerStatus | LoanDate | DVDNo | DVDTitle | Actor | Year | CategoryName | RentalCost | CopyNo (PK) | ShelfPosition | DVDStatus | ReturnDueDate | BorrowerTotalFine |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| LN74857 | BN1721 | Ben Jones | NG5 3PB | Allowed | 02/06/2002 | DN198 | Raiders of the Lost Ark | Harrison Ford | 1981 | Adventure | 3.5 | CN1099 | AV123 | On Loan | 13/02/2002 | 0 |
| LN74857 | BN1721 | Ben Jones | NG5 3PB | Allowed | 02/06/2002 | DN9829 | John Wick | Keanu Reeves | 2014 | Action | 4.5 | CN8739 | AC8728 | On Loan | 13/02/2002 | 0 |

---

## 2NF (Second Normal Form)

### BorrowerTable

| BorrowerNo (PK) | BorrowerName | BorrowerAddress | BorrowerStatus | BorrowerTotalFine |
|---|---|---|---|---|
| BN1721 | Ben Jones | NG5 3PB | Allowed | 0 |

### LoanTable

| LoanNo (PK) | BorrowerNo (FK) | LoanDate | TotalLoanCost |
|---|---|---|---|
| LN74857 | BN1721 | 02/06/2002 | 8 |

### DVDTable

| DVDNo (PK) | DVDTitle | Actor | Year | CategoryName |
|---|---|---|---|---|
| DN198 | Raiders of the Lost Ark | Harrison Ford | 1981 | Adventure |
| DN9829 | John Wick | Keanu Reeves | 2014 | Action |

### CopyTable

| CopyNo (PK) | DVDNo (FK) | ShelfPosition | DVDStatus |
|---|---|---|---|
| CN1099 | DN198 | AV123 | OnLoan |
| CN8739 | DN9829 | AC8728 | OnLoan |

### LoanItemTable

| LoanNo (FK) | CopyNo (FK) | ReturnDueDate | RentalCost |
|---|---|---|---|
| LN74857 | CN1099 | 13/02/2002 | 3.5 |
| LN74857 | CN8739 | 13/02/2002 | 4.5 |

---

## 3NF (Third Normal Form)

### BorrowerTable

| BorrowerNo (PK) | BorrowerName | BorrowerAddress | BorrowerStatus |
|---|---|---|---|
| BN1721 | Ben Jones | NG5 3PB | Allowed |

### LoanTable

| LoanNo (PK) | BorrowerNo (FK) | LoanDate | TotalLoanCost | BorrowerTotalFine |
|---|---|---|---|---|
| LN74857 | BN1721 | 02/06/2002 | 8 | 0 |

### DVDTable

| DVDNo (PK) | DVDTitle | Actor | Year |
|---|---|---|---|
| DN198 | Raiders of the Lost Ark | Harrison Ford | 1981 |
| DN9829 | John Wick | Keanu Reeves | 2014 |

### CopyTable

| CopyNo (PK) | DVDNo (FK) | ShelfPosition | DVDStatus | CategoryName (FK) |
|---|---|---|---|---|
| CN1099 | DN198 | AV123 | OnLoan | Adventure |
| CN8739 | DN9829 | AC8728 | OnLoan | Action |

### LoanItemTable

| LoanNo (FK) | CopyNo (FK) | ReturnDueDate | RentalCost |
|---|---|---|---|
| LN74857 | CN1099 | 13/02/2002 | 3.5 |
| LN74857 | CN8739 | 13/02/2002 | 4.5 |

### RentalCategoryTable

| CategoryName (PK) | RentalDuration | RentalCost | BorrowerTotalFine |
|---|---|---|---|
| Adventure | 7 Days | 3.5 | 0 |
| Action | 7 Days | 8.5 | 0 |
