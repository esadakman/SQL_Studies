/* SORGU1: SATIS veya MUHASABE bölümlerinde çalışan personelin isimlerini ve bölümlerini,
önce bölüm sonra isim sıralı olarak listeleyiniz */

Select b.bolum_isim, p.personel_isim 
From personel p
Join bolumler b on p.bolum_id = b.bolum_id;

/* SORGU2: SATIS, ISLETME ve DEPO bölümlerinde çalışan personelin isimlerini, bölümlerini ve
işe başlama tarihlerini isim sıralı olarak listeleyiniz.
NOT: Çalışanı olmasa bile bölüm ismi gösterilmelidir.*/

Select p.personel_isim, b.bolum_isim, p.ise_baslama
From bolumler b
LEFT Join personel p on p.bolum_id = b.bolum_id
Where b.bolum_isim = "SATIS" or  b.bolum_isim = "ISLETME" or b.bolum_isim = "DEPO";

/* SORGU3: Tüm bölümlerde çalışan personelin isimlerini, bölüm isimlerini ve maaşlarını bölüm
ve maaş sıralı listeleyiniz.========= NOT: Çalışanı olmasa bile bölüm ismi gösterilmelidir.  */

SELECT p.*, b.bolum_isim
From bolumler b
LEFT JOIN personel p on p.bolum_id = b.bolum_id
ORDER By b.bolum_isim ASC, p.maas DESC;

/* SORGU4: SATIS ve MUDURLUK bölümlerinde çalışan personelin maaşları 2000'den büyük
olanlarının isim, bölüm ve maaş bilgilerini bolüme ve isme göre sıralayarak listeleyiniz.  */

SELECT p.personel_isim, b.bolum_isim, p.maas
From personel p
JOIN bolumler b on p.bolum_id = b.bolum_id
WHERE (b.bolum_isim = "SATIS" or b.bolum_isim = "MUDURLUK") and  (p.maas > "2000")
ORDER BY b.bolum_isim ASC, p.maas DESC; 

/* SORGU5: MUDUR'u Mesut veya Emine olan personelin bölümlerini, isimlerini, maaşlarını ve
mudur isimlerini maaş sıralı olarak (Çoktan aza) listeleyiniz.  */

SELECT b.bolum_isim, p.personel_isim, p.maas 
From personel p
JOIN bolumler b on b.bolum_id = p.bolum_id  
WHERE p.bolum_id =

(SELECT personel.bolum_id 
	FROM personel
	Where meslek = "MUDUR" and personel_isim = ("EMINE"))

OR p.bolum_id = 

(SELECT personel.bolum_id
	FROM personel
	Where meslek = "MUDUR" and personel_isim = "MESUT")

ORDER BY p.maas DESC;










 