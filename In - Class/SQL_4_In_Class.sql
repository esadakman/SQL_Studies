/*===================================================
 JOINS
====================================================*/
    
-- Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
-- olusturmak icin kullanilabilir.
--     
-- JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
-- Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
-- icin JOIN islemleri kullanilabilir.

-- Standart SQL'de en çok kullanılan Join islemleri:
-- 1) FULL JOIN:  Tablodaki tum sonuclari gosterir
-- 2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
-- 3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
-- 4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--	NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.

/*===================================================*/
/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/

SELECT * from markalar;

SELECT markalar.marka_id, markalar.marka_adi, siparisler.siparis_adedi, siparisler.siparis_tarihi
from markalar JOIN siparisler
on markalar.marka_id = siparisler.marka_id;
 
SELECT m.marka_id, m. marka_adi, s.siparis_adedi, s.siparis_tarihi 
FROM markalar as m JOIN siparisler as s
on m.marka_id = s.marka_id;

select markalar.marka_id, markalar.marka_adi,sum(siparis_adedi),siparis_tarihi
from araclar.markalar
inner join araclar.siparisler
on markalar.marka_id=siparisler.marka_id
group by markalar.marka_id;

/* araclar.db adındaki veritabanını kullanarak Markalar ve 
Siparisler tablolarındaki marka_id'si ayni olan kayıtların
marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/
 
SELECT markalar.marka_id, markalar.marka_adi, siparisler.siparis_adedi, siparisler.siparis_tarihi
from markalar LEFT JOIN siparisler
on markalar.marka_id = siparisler.marka_id; 
-- Daha kısa olarak
SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
from markalar m LEFT JOIN siparisler s
on m.marka_id = s.marka_id;  
-- Subquery olarak
SELECT *
from markalar 
where markalar.marka_id = (SELECT marka_id FROM siparisler);

/* Markalar ve Siparisler tablolarındaki tüm araç markalarının siparis bilgilerini
(marka_id,marka_adi,siparis_adedi,siparis_tarihi) listeleyen bir sorgu yaziniz.*/

SELECT s.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
from markalar m 
LEFT JOIN siparisler s
on m.marka_id = s.marka_id;
 
 /* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının
türünü (genre) listeleyiniz.*/
 
 SELECT t.name, g.name
 FROM tracks t
 JOIN genres g
 on t.GenreId = g.GenreId;
 
SELECT t.name, 
from tracks t 
where t.GenreId = (SELECT GenreId FROM genres);

/* invoice tablosundaki faturaların her birinin müşteri adını (FirstName),soyadını (lastName), 
fatura tarihini (InvoiceDate) ve fatura meblağını (total) listeleyen sorguyu yazınız */
Select * from invoices;

SELECT c.FirstName, c.LastName, i.InvoiceDate, i.total
FROM invoices i
JOIN customers c
on i.CustomerId = c.CustomerId
Group By c.FirstName;

SELECT c.FirstName, c.LastName, i.InvoiceDate, sum(i.total) as total_amount
FROM invoices i
JOIN customers c
on i.CustomerId = c.CustomerId
Group By i.total;

/* invoice tablosundaki faturaların her birinin müşteri adını 
(FirstName),soyadını(lastName) ve fatura meblağlarının 
toplamının(total) 40 dolardan fazla olanlarını artan sırada
listeleyen sorguyu yazınız */

SELECT c.FirstName, c.LastName, sum(i.total) as total_amount
FROM invoices i
JOIN customers c
on i.CustomerId = c.CustomerId
Group By c.FirstName
HAVING total_amount > 40
ORDER BY total_amount ASC;

--Alternatif olarak (CustomerId'e göre gruplandırma)

SELECT c.CustomerId, c.FirstName, c.LastName, sum(i.total) as total_amount
FROM invoices i
JOIN customers c
on i.CustomerId = c.CustomerId
Group By c.CustomerId
HAVING total_amount > 10
ORDER BY total_amount DESC;

/*===================================================
 SUBQUERIES
====================================================*/

/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */

SELECT TrackId, name, AlbumId
from tracks
where AlbumId = (SELECT AlbumId FROM albums where title = "Faceless");

-- JOIN
SELECT t.TrackId, t.name, t.AlbumId
FROM tracks t
JOIN albums a
on t.AlbumId = a.AlbumId
WHERE a.title = "Faceless";

--hard-coded yöntem, tek bir blokla çözmeliyiz. subquery uygun.	
SELECT AlbumId
FROM albums
WHERE Title = 'Faceless';		
		
SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId = 88;
-- subquery yöntemi. = kullanmamızın sebebi tek değer döndüğünden dolayı
-- birden fazla değer dönecekse = yerine in kullanabilirdik 
SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId = (
				SELECT AlbumId
				FROM albums
				WHERE Title = 'Faceless');
				
-- JOIN
SELECT t.TrackId,
	   t.name,
	   t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId
WHERE a.Title = 'Faceless';
--and li çözüm.
SELECT t.TrackId,
	   t.name,
	   t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId AND a.Title = 'Faceless';
SELECT * From albums;

/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */	

SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId = (
	SELECT AlbumId
	FROM albums
	WHERE Title = 'Faceless' or Title = 'Let There Be Rock' );

/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
JOIN kullanarak listeyiniz.Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */

SELECT t.TrackId, t.name, t.AlbumId
FROM tracks t
JOIN albums a
on t.AlbumId = a.AlbumId
WHERE a.title = "Faceless" or a.Title = "Let There Be Rock";
















