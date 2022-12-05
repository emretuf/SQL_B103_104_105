CREATE TABLE ogrenciler5
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date	
);
--VAROLAN TABLODAN YENI TABLO OLUSTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;

select * from notlar; 

--INSERT- TABLO ICINE VERI EKLEME

INSERT INTO notlar VALUES ('Emre',95.5);


select isim from notlar;

--CONSTRAINT
--UNIQEU

CREATE TABLE ogrenciler6
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayit_tarih date	
);
select * from ogrenciler6; 

--NOT NULL 

CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(20) not NULL,
soyisim varchar(25),
not_ort real,
kayit_tarih date	
);
select * from ogrenciler7; 

INSERT INTO ogrenciler7 VALUES ('1712050', 'Emre', 'Tuf',65.5,now());
INSERT INTO ogrenciler7 VALUES ('1712051', 'Ali', 'Veli',75.5,now());
INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort) VALUES ('1234568', 'ByEmre',87.5); 
--Not Null kisitlamasi oldugu icin bu veri eklenemez.

--PRIMARY KEY OLUSTURMA
CREATE TABLE ogrenciler8
(
ogrenci_no char(7) primary key,
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date	
);


--PRIMARY KEY ATAMASI SECOND WAY

CREATE TABLE ogrenciler10
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no) 	
);
-- EGER CONSTRAINT ISMI KENDIMIZ VERMEK ISTERSEK BU YOLU KULLANABILIRIZ.(YAPTIM HATA VERDI)

CREATE TABLE tedarikciler3
(
tedarikci_id char(5), PRIMARY KEY
tedarikci_ismi varchar(20),
iletisim_isim varchar(20),	
);

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id);	
);

select * from urunler;

--Yeni Soru:

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);

CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
SELECT * FROM calisanlar1;
SELECT * FROM adresler;


--CHECK CONSTRAINT
CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10001', 'Emre Tüfekçioğlu' ,29000, '2018-04-14');

-- DQL -- WHERE KULLANIMI

SELECT FROM calisanlar;
SELECT isim FROM calisanlar;

-- Calisanlar tablosundan maasi 5000 den buyuk olan isimleri listeleyiniz
SELECT isim,maas FROM calisanlar WHERE maas>5000;

--Calisanlar tablosundan ismi Veli Han olan tüm verileri listeleyiniz
SELECT * FROM calisanlar WHERE isim='Veli Han';

--Calisanlar tablosundan maası 5000 olan tüm verileri listeleyiniz
SELECT * FROM calisanlar WHERE maas=5000;

-- DML -- DELETE KOMUTU
DELETE FROM calisanlar; --Eger parent table baska bir child ile iliskiliyse once child table silinir 
DELETE FROM adresler;

--Adresler Tablosundan yalnız sehri Antep olanı sil--
DELETE FROM adresler WHERE sehir = 'Antep';

--İsmi Nesibe Yılmaz ve Mustafa Bak olanları silelim
CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);


