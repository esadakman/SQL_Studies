 select DISTINCT AlbumId, MediaTypeId from tracks;
 
 SELECT * FROM tracks;
 
 SELECT name
 FROM tracks 
 WHERE Composer = "Jimi Hendrix";
 
 SELECT *
 FROM invoices
 WHERE total > 10;
 
 /*===================================================
LIMIT
====================================================*/
/*invoices tablosunda Total değeri 10$'dan büyük olan 
ilk 4 kayıt'ın InvoiceId,InvoiceDate ve total 
bilgilerini sorgulayiniz */

SELECT InvoiceId, InvoiceDate, total
FROM invoices
WHERE total > 10 LIMIT 4;


/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */

SELECT *
FROM invoices
WHERE total > 10 
ORDER BY InvoiceDate DESC;


SELECT CustomerId, InvoiceDate, BillingCity, total
FROM invoices
Order By BillingCity ASC, total DESC;


/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
göre  AZALAN sırada listeyiniz */ 

SELECT *
FROM invoices
Where BillingCountry <> "USA"
Order By total ASC;

SELECT *
FROM invoices
Where NOT BillingCountry = "USA"  -- Where BillingCountry <> Where BillingCountry != "USA" 
Order By total ASC;

-- /* invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
-- oiceId sırasına göre artan sırada listeyiniz */

SELECT *
FROM invoices
Where BillingCountry = "USA" or BillingCountry = "Germany" 
Order By InvoiceId ASC;

SELECT *
FROM invoices
WHERE BillingCountry in ("USA", "Germany")
ORDER by InvoiceID;

/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */ 

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN "2012-01-01" and "2013-01-02 00:00:00";

-- şayet datada ki format saat şeklindeyse saat şeklinde girilmeli değetler
 

SELECT *
FROM invoices
WHERE InvoiceDate>=  "2012-01-01" and InvoiceDate <= "2013-01-02 00:00:00";

/* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 tarihleri arasındaki
en yeni faturayı listeleyen sorguyu yazınız */

SELECT *
FROM invoices
WHERE InvoiceDate between  '2009-01-01' and '2011-01-01 00:00:00'
ORDER BY InvoiceDate DESC LIMIT 1;

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-31-12'
ORDER BY InvoiceDate DESC LIMIT 1;


/*===================================================
IN
====================================================*/
/* customers tablosunda Belgium, Norway veya  Canada ,USA  ülkelerinden sipariş veren
müşterilerin FirstName, LastName, country bilgilerini listeyiniz	*/

SELECT FirstName, LastName, country
FROM customers
WHERE country IN ('Belgium', 'Norway', 'Canada', 'USA');


