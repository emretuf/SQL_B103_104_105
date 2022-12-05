--ALIASES
drop table if exists calisanlar
CREATE TABLE calisanlar  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
select * from calisanlar
-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar
--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar
-- IS NULL CONDITION
CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
select * from insanlar
-- Name sutununda null olan değerleri listeleyelim
SELECT name FROM insanlar WHERE name IS NULL
-- Insanlar taplosunda sadece null olmayan değerleri listeleyiniz
SELECT name FROM insanlar WHERE name IS NOT NULL
-- Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz
UPDATE insanlar
SET isim='No Name'
WHERE isim IS NULL

-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/


CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar2  

--insanlar tablosundaki dataları adrese gore siralayin

select * from insanlar2 order by adres;
select * from insanlar2 order by soyisim;


--Insanlar2 tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select * from insanlar2 where isim='Mine' order by ssn
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız

NOT : Order By komutundan sonra field(sutun) ismi yerine field numarasi da kullanilabilir
Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

*/

select * from insanlar2 where soyisim='Bulut' order by 4 --(field dedigi sutunlar!!!)


--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar2 order by ssn desc;

---- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

select * from insanlar2 order by isim asc, soyisim desc; 

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız

/*
Eger sutun uzunluguna gore siralamak istersek length komutu kullaniriz
Ve yine uzunlugu buyukten kucuge siralamak istersek sonuna DESC komutunu ekleriz.
 */
select isim,soyisim from insanlar2 order by LENGTH(soyisim) desc; 

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT  isim||' '||soyisim as isim_soyisim from insanlar2 order by length(isim)+length(soyisim)
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar2 ORDER BY LENGTH (isim)+LENGTH (soyisim)
select concat(isim,' ', soyisim) as isim_soyisim from insanlar2 order by length (isim || soyisim);
select isim || ' ' || soyisim as isim_soyisim from insanlar2 order by length (concat(isim, soyisim));

--GROUP BY CLAUSE
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--Isme gore alinan toplam urunleri bulunuz--
SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldığı_toplam_urun DESC;

-- Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi, count(isim) from manav
group by urun_adi;

select isim,count(urun_adi) from manav
group by isim























