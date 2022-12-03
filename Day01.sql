-- DDL - DATA DEFNITION LANG.
-- CREATE TABLO OLUSTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date	
);

--VAROLAN TABLODAN YENI TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS --benzer tablodaki baslıklarla ve data tipleriyle yeni bir tablo 
--olusturmak icin normal tablo olustururken ki parantexzler yerine AS 
--kullanip SELECT komutuyla alamk istedigimiz verileri aliriz.
SELECT isim,soyisim,not_ort FROM ogrenciler2; 

--DML - DATA MANIPULATION LANGUANGE
-- INSERT (Databese'e veri ekleme)

INSERT INTO ogrenciler2 VALUES ('1234567', 'Said', 'ILHAN',85.5,now());	
INSERT INTO ogrenciler2 VALUES ('1234567', 'Said', 'ILHAN',85.5,'2020-12-11');

--BIR TABLOYA PARCALI VERİ EKLEMEK ISTERSEK 
INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('Emre', 'Tuf');

--DQL - DATA QUERY LANG.
--SELECT

select * FROM ogrenciler2; --Buraki * sembolu herseyi anlamindadir.





