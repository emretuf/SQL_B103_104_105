CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

delete from personel
--isme gore toplam maaslari bulunuz...
select isim,sum(maas) from personel 
group by isim


--Personel tablosundaki isimleri gruplayın....
select isim, count(sehir) from personel
group by isim

--HAVING KULLANIMI

--1) Her Sirketin MIN maasını eger 4000'den buyukse goster.
select * from personel

SELECT sirket,min(maas) as en_dusuk_maas FROM personel
GROUP BY sirket
HAVING min(maas)>4000

/*
	Having komutu yalnizca GROUP BY komutu ile kullanilir
	Eger gruplamadan sonra bir sart varsa HAVING komutu kullanilir
*/

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir, count(isim)as toplam_personel_sayisi from personel
group by sehir
having count(isim)>1

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir,max(maas) from personel
group by sehir
having max(maas)<5000



--UNION KULLANIMI--

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz
select isim,maas from personel where maas>4000
union
select sehir,maas from personel where maas>5000

-- Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz
SELECT isim as isim_ve_sehir,maas FROM personel WHERE isim='Mehmet Ozturk'
union
SELECT sehir,maas FROM personel WHERE sehir='Istanbul' 
ORDER BY maas DESC


drop table personel

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
)	

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

----------------------------------------------------------------------------------------------

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
)

INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel
select * from personel_bilgi

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin

select sehir,maas from personel where id=123456789
select tel,cocuk_sayisi fro personel_bilgi where id=123456789

/*UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir, 
Ayni kayit birden fazla olursa, sadece bir tanesini alir. 
UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.*/

select isim,maas from personel where maas<5000
union
select isim,maas from personel where maas<5000

--INTERSECT OPERATOR--(KESİŞİM)
--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin

SELECT id from personel WHERE sehir IN('Istanbul','Ankara') 
INTERSECT 
SELECT id from personel_bilgi where cocuk_sayisi IN (2,3) ORDER BY id ASC;

-- 1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
-- 2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
-- 3) Iki sorguyu INTERSECT ile birlestirin

select id from personel2 where maas<4800 or maas>5000
INTERSECT
select id from personel_bilgi where cocuk_sayisi in(2,3);

---Honda,Ford ve Tofaş'ta calisan ortak isimde personel varsa listeleyin
SELECT isim FROM personel WHERE sirket='Honda'
SELECT isim FROM personel WHERE sirket='Ford'
SELECT isim FROM personel WHERE sirket='Tofas'

/*
SQL EXCEPT yan tümcesi/operatörü, iki SELECT deyimini birleştirmek için kullanılır ve 
ilk SELECT deyiminden ikinci SELECT deyimi tarafından döndürülmeyen satırları döndürür. 
Bu, EXCEPT'in yalnızca ikinci SELECT deyiminde bulunmayan satırları döndürdüğü anlamına gelir.
UNION işlecinde olduğu gibi, EXCEPT işlecini kullanırken de aynı kurallar geçerlidir. 
MySQL, EXCEPT operatörünü desteklemiyor.
*/


/*
iki sorgulamada harici bir sorgulama istenirse EXCEPT(MINUS) komutu kullanilir
 */
--5000'den az maas alip Honda da calisanları getirin..
SELECT isim from personel where maas<5000 
EXCEPT 
SELECT isim FROM personel WHERE sirket='Honda';
































