
/*===================================================
LIKE
====================================================*/
/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
listeyen sorguyu yazınız*/;

SELECT Name
FROM tracks
WHERE Composer like "%Bach" ;

/* albulms tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
listeyen sorguyu yazınız*/;

SELECT *
FROM albums
WHERE Title like "%Greatest%" ;

/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/

SELECT *
FROM invoices
WHERE InvoiceDate like "201_-02-%" ;


SELECT *
FROM invoices
WHERE InvoiceDate like "201_-02-__ __:__:__" ;

/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
LastName ve City bilgilerini	listeleyen sorguyu yazınız*/

SELECT FirstName, LastName, City
FROM customers
WHERE FirstName like "___" ;

/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
LastName ve City bilgilerini listeleyen sorguyu yazınız*/;

SELECT FirstName, LastName, City
FROM customers
WHERE LastName like "sch%" or LastName like "go%" ;

SELECT FirstName, LastName, City
FROM customers
WHERE LastName like "sch%" or LastName like "Go%" ;


/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
-- COUNT
------------------------------------------------------------------------------
/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */


SELECT COUNT(*) 
FROM invoices;

SELECT COUNT (BillingCity) 
FROM invoices;

SELECT COUNT (BillingState)  -- Null olanlar sayılmaz
FROM invoices;

SELECT COUNT(*) as num_null
FROM invoices
WHERE BillingState IS NULL;

/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/;

SELECT COUNT(DISTINCT composer) 
FROM tracks;

SELECT COUNT(DISTINCT composer) as Number_of_Composers
FROM tracks;


-- MIN,MAX
-------------------------------------------------------------------------------------------------	
/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
sorguyu yaziniz */

SELECT NAME, min(Milliseconds)
FROM tracks;

SELECT NAME, min(Milliseconds)/1000.0 as min_duration_sc
FROM tracks;

/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */

SELECT max(grade), Min(grade) as min_max
FROM students;

SELECT max(grade) as max_grade, Min(grade) as min_grade
FROM students;

-- SUM,AVG
-------------------------------------------------------------------------------------------------	
/* invoices  tablosundaki faturaların toplam değerini listeyiniz */

SELECT *
FROM invoices;

SELECT SUM(total) AS total_salary
FROM invoices;

/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */

SELECT AVG(total) AS total_avg
FROM invoices;

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
şarkıların adlarını listeleyiniz */


SELECT name
FROM tracks
WHERE Milliseconds > 393599.21;


/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/

SELECT name 
FROM tracks
WHERE Milliseconds > (SELECT AVG(Milliseconds)  from tracks);

/*===================================================
 GROUP BY
====================================================*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */


SELECT composer, COUNT(name)
FROM tracks
GROUP BY composer;

SELECT composer, COUNT(name)
FROM tracks
WHERE Composer is not NULL
GROUP BY composer;

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/

SELECT BillingCountry, AVG(total)
FROM invoices
GROUP BY BillingCountry;


SELECT BillingCountry, AVG(total)
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31 00:00:00"
GROUP BY BillingCountry;




