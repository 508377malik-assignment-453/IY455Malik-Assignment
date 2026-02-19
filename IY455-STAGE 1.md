IY455 - STAGE 1 

<style>
</style>

Normalization:

Normalization is the process of organizing data in a database to: reduce
duplication (redundancy), improve data integrity and prevent update
anomalies.

It involves splitting large unstructured tables into smaller related
tables and applying rules called normal forms.

**Advantages:**

-Avoids repeated data (e.g., borrower address stored many times)

-Prevents inconsistent updates

-Makes the database easier to maintain

**Disadvantages:**

-More tables means more joins in queries

-Can slightly reduce performance in very large systems

-More complex design initially

1 NF:

| 1NF Loan details     |          |     | Loan No. (FK) | DVD<br> No. | Copy<br> No. (PK,FK) | Return<br> Due Date | Rental<br> Cost | Fine charge |
| -------------------- | -------- | --- | ------------- | ----------- | -------------------- | ------------------- | --------------- | ----------- |
| Loan<br> No.PK       | LN74857  |     | LN74857       | DN198       | CN1099               | 13/02/2002          | £3.50           | £0.00       |
| Borrower<br> No.(FK) | BN1721   |     |               | DN9829      | CN8739               | 13/02/2002          | £4.50           |             |
| Loan<br> Date        | 6/2/2002 |     |               |             |                      |                     |                 |             |
| Total<br> loan Cost  | £8.00    |     |               |             |                      |                     |                 |             |

2 NF:

| DVD<br> No.PK | DVD<br> Title               | DVD<br> Starring Actor | DVD<br> Year | Category ID |
| ------------- | --------------------------- | ---------------------- | ------------ | ----------- |
| DN198         | Raiders<br> of the Lost Ark | Harrison<br> Ford      | 1981         |             |
| DN9829        | John<br> Wick               | Keanu<br> Reeves       | 2014         |             |

| Copy<br> No.PK | DVD<br> No.FK | Shelf<br> Position | DVD<br> Status | SupplierID |
| -------------- | ------------- | ------------------ | -------------- | ---------- |
| CN1099         | DN198         | AV123              | On<br> Loan    |            |
| CN8739         | DN9829        | AC8728             | On<br> Loan    |            |

| Borrower No.(PK) | Borrower<br> Name | Borrower<br> Address                | Borrower<br> Status |     |
| ---------------- | ----------------- | ----------------------------------- | ------------------- | --- |
| BN1721           | Ben<br> Jones     | 28<br> Low Road, Nottingham NG5 3PB | Allowed             |     |
