SELECT * FROM invoices;
/* 
*/
/*1. Write a query that displays InvoiceId, CustomerId and total dollar amount for each invoice, 
sorted first by CustomerId (in ascending order), and then by total dollar amount  (in descending order).*/
SELECT InvoiceId, CustomerId, total FROM invoices Order By CustomerId ASC, total DESC;
/* 2. Write a query that displays InvoiceId, CustomerId and total dollar amount for each invoice, but this 
time sorted first by total dollar amount (in descending order), and then by CustomerId (in ascending order).*/
SELECT InvoiceId, CustomerId, total FROM invoices Order By total DESC, CustomerId ASC;
/* In the first query our list listed by Customer ID, and then if there is a multiple customer ID then our list listed by 
total dollar amount in itself. In the second query our list listed by total dollar amount  and if there are more than one 
same value in that value our list listed by customer ID in total.
=========================================================================================================================
 4 . Write a query to pull the first 10 rows and all columns from the invoices table that have a dollar amount of total 
greater than or equal to 10.*/
SELECT * FROM invoices WHERE total >= 10 LIMIT 10;
/* ======================================================================================================================
5. Write a query to pull the first 5 rows and all columns from the invoices table that have a dollar amount of 
total less than 10. */
SELECT * FROM invoices WHERE total < 10 LIMIT 5 ;
SELECT * FROM invoices WHERE total < 10 ORDER BY total DESC LIMIT 5; -- For see the use of WHERE, ORDER BY, and LIMIT in same QUERY
/* ======================================================================================================================,
6. Find all track names that start with 'B' and end with 's' */
SELECT * FROM tracks;
SELECT name FROM tracks WHERE name LIKE "B%s";
/* ======================================================================================================================
7. Use the invoices table to find all information regarding invoices whose billing address is USA or Germany or Norway or 
Canada and invoice date is at any point in 2010, sorted from newest to oldest.*/
SELECT * FROM invoices WHERE InvoiceDate <> "2010-__-__ __:__:" ;


SELECT * FROM invoices WHERE InvoiceDate like "2010-%" and 
(BillingCountry = "USA" or BillingCountry = "Germany" or BillingCountry = "Norway" or BillingCountry = "Canada")
ORDER BY InvoiceDate DESC;

