USE veritabaniproje


-- SELECT sorgular�
SELECT * FROM Sanatcilar;

-- INSERT sorgular� Sanatcilar tablosuna veri giri�i yapmay� sa�lar.
INSERT INTO Sanatcilar (SanatciID, SanatciAdi) VALUES (51, 'Seyfettin Sucu');

-- UPDATE sorgular� : G�ncellemeyi sa�lar.
UPDATE Sanatcilar SET SanatciAdi = 'Emel Ta���o�lu' WHERE SanatciID = 51;

-- DELETE sorgular� : Sanatcilar tablosunda SanatciIDsi 51 olan� sil
DELETE FROM Sanatcilar WHERE SanatciID = 51;

-- WHERE ko�ullar� : Ko�ul belirtir. 
SELECT * FROM Sanatcilar WHERE SanatciAdi = 'Ajda Pekkan';

-- JOIN i�lemleri: �ki tablonun belirli bir ko�ula g�re e�le�mesini sa�lar.
SELECT * FROM Sarkilar INNER JOIN Sanatcilar ON Sarkilar.SanatciID = Sanatcilar.SanatciID;

-- GROUP BY ve HAVING kullan�m�  : S�tuna g�re veri gruplama ve gruplar�n toplu i�lemlerini filtreleme
SELECT SanatciID,  COUNT(*) AS 'Toplam �ark�' FROM Sarkilar GROUP BY SanatciID HAVING COUNT(*) > 1;

-- ORDER BY kullan�m� : Bir tablodan t�m s�tunlar� al�r ancak order by ile belirtilen s�tuna g�re s�ralar
SELECT * FROM Sarkilar ORDER BY SarkiAdi;

-- COUNT, SUM, AVG gibi agregat fonksiyonlar 
SELECT COUNT(*) AS '�ark�lar' FROM Sarkilar; SELECT AVG(BegenilmeOrani) AS 'Be�enilme Oran�' FROM BEGEN�LME; SELECT SUM(BegenilmeOrani) AS 'Be�enilme Puan Toplam�' FROM BEGEN�LME;

-- LIKE ve IN kullan�m� 
SELECT * FROM Sanatcilar WHERE SanatciAdi LIKE '%Adi%'; SELECT * FROM Sanatcilar WHERE SanatciID IN (1, 2, 3);

-- Subquery kullan�m� 
SELECT * FROM Sanatcilar WHERE SanatciID IN (SELECT SanatciID FROM Sarkilar WHERE SarkiAdi = 'Arapsa��');

-- Ge�ici tablo olu�turma ve kullanma 
SELECT * INTO TempTable FROM Sanatcilar;
SELECT * FROM TempTable;

-- De�i�ken kullan�m� (DECLARE ve SET)
DECLARE @SanatciAdi NVARCHAR(50);
SET @SanatciAdi = 'Funda Arar'; 
SELECT * FROM Sanatcilar WHERE SanatciAdi = @SanatciAdi;

-- IF-ELSE yap�s� 
IF EXISTS(SELECT * FROM Sanatcilar WHERE SanatciAdi = 'Bergen') BEGIN PRINT 'Sanatci Adi bulundu.' END ELSE BEGIN PRINT 'Sanatci Adi bulunamadi.' END

-- PRINT komutu 
PRINT 'Eski Sarkilar';

-- DISTINCT kullan�m� 
SELECT DISTINCT SanatciAdi FROM Sanatcilar;

-- BETWEEN kullan�m� 
SELECT * FROM Sarkilar WHERE SarkiSuresi BETWEEN '04:00' AND '05:00';

-- UNION ve UNION ALL kullan�m� 
SELECT SanatciAdi FROM Sanatcilar WHERE SanatciID = 1 UNION ALL SELECT SanatciAdi FROM Sanatcilar WHERE SanatciID = 2;

-- CASE WHEN kullan�m� 
SELECT SanatciAdi, CASE WHEN BegenilmeOrani > 80 THEN '�ok iyi' WHEN BegenilmeOrani > 60 THEN '�yi' ELSE 'Ortalama' END AS BegenilmeDurumu FROM Sanatcilar INNER JOIN BEGEN�LME ON SANATCILAR.SanatciID = BEGEN�LME.BegenilmeID;

-- NULL kontrol� 
SELECT * FROM Sarkilar WHERE BegenilmeID IS NULL;

-- VIEW olu�turma 
CREATE VIEW SanatciView AS SELECT SanatciAdi, BegenilmeOrani FROM Sanatcilar INNER JOIN BEGEN�LME ON Sanatcilar.SanatciID = BEGEN�LME.BegenilmeID;
SELECT * FROM SanatciView

-- Date ve Time fonksiyonlar� 
SELECT GETDATE() AS 'G�ncel Tarih'; 
SELECT DATEADD(year, -1, GETDATE()) AS '1 Y�l �ncesinin Tarihi'; 
SELECT DATEDIFF(year, '2000-01-01', GETDATE()) AS '2000 den bu yana ka� y�l ge�ti?'; 
SELECT DATEPART(year, GETDATE()) AS 'Bu Y�l'; 
SELECT CONVERT(VARCHAR, GETDATE(), 108) AS 'Saat';

-- CONCAT: �ki veya daha fazla stringi birle�tirir.
SELECT CONCAT(SanatciAdi, ' - ', AlbumAdi) AS 'Sanatci ve Album' FROM Sanatcilar INNER JOIN ALBUMLER ON Sanatcilar.SanatciID = ALBUMLER.SanatciID;

-- LEN: Bir stringin uzunlu�unu d�nd�r�r.
SELECT LEN(SanatciAdi) AS 'Sanatci Adi Uzunlugu' FROM Sanatcilar;

-- UPPER ve LOWER: Bir stringi b�y�k veya k���k harfe �evirir.
SELECT UPPER(SanatciAdi) AS 'Sanatci Adi (B�y�k Harf)', LOWER(SanatciAdi) AS 'Sanatci Adi (K���k Harf)' FROM Sanatcilar;

-- SUBSTRING: Bir stringin belirli bir b�l�m�n� d�nd�r�r.
SELECT SUBSTRING(SanatciAdi, 1, 5) AS 'Sanatci Adi (�lk 5 Karakter)' FROM Sanatcilar;

-- REPLACE: Bir stringdeki belirli bir metni ba�ka bir metinle de�i�tirir.
SELECT REPLACE(SanatciAdi, 'a', 'e') AS 'Sanatci Adi (a yerine e)' FROM Sanatcilar;

-- TRIM: Bir stringin ba��ndaki ve sonundaki bo�luklar� kald�r�r.
SELECT TRIM(SanatciAdi) AS 'Sanatci Adi (Trim Uygulanm��)' FROM Sanatcilar;

-- ABS: Bir say�n�n mutlak de�erini d�nd�r�r.
SELECT ABS(BegenilmeOrani) AS 'Mutlak Begenilme Orani' FROM BEGEN�LME;

-- ROUND: Bir say�y� en yak�n tam say�ya yuvarlar.
SELECT ROUND(BegenilmeOrani,0) AS 'Yuvarlanm�� Begenilme Orani' FROM BEGEN�LME;

-- CEILING ve FLOOR: Bir say�y� yukar� veya a�a��ya yuvarlar.
SELECT CEILING(BegenilmeOrani) AS 'Yukar� Yuvarlanm�� Begenilme Orani', FLOOR(BegenilmeOrani) AS 'A�a�� Yuvarlanm�� Begenilme Orani' FROM BEGEN�LME;

-- SQRT: Bir say�n�n karek�k�n� d�nd�r�r.
SELECT SQRT(BegenilmeOrani) AS 'Karek�k Begenilme Orani' FROM BEGEN�LME WHERE BegenilmeOrani >= 0;

-- POWER: Bir say�n�n belirli bir kuvvetini d�nd�r�r.
SELECT POWER(BegenilmeOrani, 2) AS 'Karesi Al�nm�� Begenilme Orani' FROM BEGEN�LME;

--CHARINDEX Kullan�m�
SELECT * FROM Sanatcilar WHERE CHARINDEX('B', SanatciAdi) > 0;

--1980-1990 aras� en �ok �ark� ��karan sanat�� ile 1990-2000 aras� en �ok �ark� ��kartan sanat��n�n aras�ndaki �ark� say�s� fark�
SELECT COUNT(*) AS 'Aradaki Fark' FROM Sanatcilar 
INNER JOIN ALBUMLER ON Sanatcilar.SanatciID = ALBUMLER.SanatciID 
INNER JOIN SarkininCikisYili ON ALBUMLER.CikisID = SarkininCikisYili.CikisID 
INNER JOIN Sarkilar ON ALBUMLER.AlbumID = Sarkilar.AlbumID WHERE SarkininCikisYili.DonemID = 1 OR SarkininCikisYili.DonemID = 2

--FUNCTION
-- Bir T-SQL fonksiyonu olu�tur: Verilen SarkiID'ye g�re ilgili �ark�n�n ad�n� d�nd�ren dbo.fnGetirSarkiAdi.
CREATE FUNCTION dbo.fnGetirSarkiAdi (@SarkiID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
-- Lokal bir de�i�ken tan�mla ve belirtilen SarkiID'ye ait �ark� ad�n� bu de�i�kene atayarak d�nd�r.
    DECLARE @SarkiAdi NVARCHAR(100)
    SELECT @SarkiAdi = SarkiAdi FROM Sarkilar WHERE SarkiID = @SarkiID
    RETURN @SarkiAdi
END
GO

SELECT dbo.fnGetirSarkiAdi(1)


-- "SarkininCikisYili" tablosundan, "DonemID" de�eri 1 olan kay�tlar�n "CikisID", "sarkinincikisyili", ve "DonemID" s�tunlar�n� se�.
-- Sonu�lar� "Sarkinincikisyili" s�tununa g�re k���kten b�y��e do�ru (artan s�ra) s�rala.
select CikisID, sarkinincikisyili,DonemID from SarkininCikisYili where DonemID = 1 order by SarkininCikisYili asc


-- "SarkininCikisYili" tablosundan, "DonemID" de�eri 2 olan kay�tlar�n "CikisID", "sarkinincikisyili", ve "DonemID" s�tunlar�n� se�.
-- Sonu�lar� "Sarkinincikisyili" s�tununa g�re b�y�kten k����e do�ru (azalan s�ra) s�rala.
select CikisID, sarkinincikisyili,DonemID from SarkininCikisYili where DonemID = 2 order by SarkininCikisYili desc 


-- "SarkininCikisYili" tablosundaki "SarkinCikisYili" s�tunundaki en y�ksek de�eri (maksimum) bul.
-- Bu de�eri "max_cikis_yili" ismiyle alias (takma ad) ile g�r�nt�le.
select max(SarkininCikisYili) as 'max_cikis_yili' from SarkininCikisYili

-- "SarkininCikisYili" tablosundaki "SarkinCikisYili" s�tunundaki en d���k de�eri (minimum) bul.
-- Bu de�eri "min_cikis_yili" ismiyle alias (takma ad) ile g�r�nt�le.
select min(SarkininCikisYili) as 'min_cikis_yili' from SarkininCikisYili

-- "SarkininCikisYili" tablosundaki "SarkinCikisYili" s�tunundaki t�m de�erleri topla.
-- Toplam� "top_yil" ismiyle alias (takma ad) ile g�r�nt�le.
select sum(SarkininCikisYili) as 'top_yil' from SarkininCikisYili

-- "SarkininCikisYili" tablosundaki "SarkinCikisYili" s�tunundaki de�erlerin ortalamas�n� hesapla.
-- Ortalamay� "ort_yil" ismiyle alias (takma ad) ile g�r�nt�le.
select avg(SarkininCikisYili) as 'ort_yil' from SarkininCikisYili

-- "SarkininCikisYili" tablosundaki toplam sat�r say�s�n� bul.
-- Bu say�y� "tum_yillar" ismiyle alias (takma ad) ile g�r�nt�le.
select count(SarkininCikisYili) as 'tum_yillar' from SarkininCikisYili

-- "Sanatcilar" tablosundaki benzersiz (tekrars�z) "SanatciAdi" de�erlerini se�.
select distinct(SanatciAdi) from Sanatcilar

-- "Sanatcilar" tablosundaki "SanatciAdi" s�tunundaki de�erleri ters �evir.
select reverse(SanatciAdi) from Sanatcilar




-- "Sanatcilar", "Sarkilar", "Turler", ve "Begenilme" tablolar�n� birle�tirerek her sanat��n�n her t�rdeki en d���k be�enilme oran�n� bul.
-- Gruplama yap�larak, her sanat�� ve t�r kombinasyonu i�in en d���k be�enilme oran�n� i�eren sonu�lar� elde et.
-- ROLLUP kullanarak toplam (overall) en d���k be�enilme oranlar�n� da g�ster.
-- Sonu�lar� t�r ID'ye g�re artan s�rayla s�rala.
SELECT Sanatcilar.SanatciAdi, Turler.TurID, MIN(Begenilme.BegenilmeOrani) AS MinBegenilmeOrani
FROM Sanatcilar
JOIN Sarkilar ON Sanatcilar.SanatciID = Sarkilar.SanatciID
JOIN Turler ON Sarkilar.TurID = Turler.TurID
JOIN Begenilme ON Sarkilar.BegenilmeID = Begenilme.BegenilmeID
GROUP BY Sanatcilar.SanatciAdi, Turler.TurID WITH ROLLUP
ORDER BY Turler.TurID ASC;





DECLARE @degisken1 INT; -- Tamsay� bir de�i�ken tan�mla.
SET @degisken1 = 300;-- De�i�ken de�erine 300 atama yap.


IF @degisken1 > 300 -- E�er de�i�ken de�eri 300'den b�y�kse
BEGIN
    SELECT MAX(CikisID) FROM Albumler; -- "Albumler" tablosundaki en b�y�k CikisID de�erini se�.
    SELECT MIN(CikisID) FROM Albumler;  -- "Albumler" tablosundaki en k���k CikisID de�erini se�.

    SET @degisken1 = @degisken1 + 1;-- De�i�ken de�erini bir art�r.
END
ELSE  
BEGIN
    SELECT @degisken1;-- De�i�kenin mevcut de�erini se�.
    SET @degisken1 = @degisken1 + 2;-- De�i�ken de�erini iki art�r.
    SELECT @degisken1;-- De�i�kenin g�ncellenmi� de�erini se�.
END;




-- Her alb�m i�in �ark� s�relerinin toplam�n� dakika cinsinden hesapla,
-- Toplam s�resi 150 dakikadan fazla olan alb�mleri filtrele,
-- Sonu�lar� alb�m ID'sine g�re grupla ve s�rala.
SELECT AlbumID, SUM(DATEDIFF(minute, '00:00:00', SarkiSuresi)) AS 'ToplamDakika'
FROM Sarkilar
GROUP BY AlbumID
HAVING SUM(DATEDIFF(minute, '00:00:00', SarkiSuresi)) > 150
ORDER BY ToplamDakika ASC;



-- Kullan�c� ad� ile kullan�c� ID'sini birle�tirip 'AdID' olarak adland�r�lm�� yeni bir s�tun olu�tur.
SELECT KullaniciAdi + ' ' + CONVERT(nvarchar, KullaniciID) AS 'AdID'
FROM Kullanicilar;




UPDATE Albumler
SET AlbumAdi = (SELECT TOP 1 AlbumAdi FROM Albumler ORDER BY AlbumID DESC), -- Albumler tablosundaki AlbumAdi s�tununu, ayn� tablodaki en y�ksek AlbumID de�erine sahip AlbumAdi ile g�ncelleme
    CikisID = (SELECT TOP 1 CikisID FROM Albumler ORDER BY AlbumID DESC), -- Albumler tablosundaki CikisID s�tununu, ayn� tablodaki en y�ksek AlbumID de�erine sahip CikisID ile g�ncelleme
    SanatciID = (SELECT TOP 1 SanatciID FROM Albumler ORDER BY AlbumID DESC) -- Albumler tablosundaki SanatciID s�tununu, ayn� tablodaki en y�ksek AlbumID de�erine sahip SanatciID ile g�ncelleme
WHERE AlbumID = (SELECT MAX(AlbumID) FROM Albumler); -- G�ncellemeyi hangi kriterlere g�re yapmak istedi�iniz



-- "Sanatcilar" tablosundan "SanatciAdi" ve "SanatciID" s�tunlar�n� kopyalayarak yeni bir "YeniSanatcilar" tablosu olu�tur.
SELECT SanatciAdi AS Adi, SanatciID AS ID INTO YeniSanatcilar FROM Sanatcilar;




-- Bir kayan noktal� say� tipindeki de�i�ken tan�mla: @maxSarkiSuresi
DECLARE @maxSarkiSuresi FLOAT;

-- "Sarkilar" tablosundaki her bir �ark�n�n s�resini saniye cinsinden hesaplayarak, 
-- bu s�releri @maxSarkiSuresi de�i�kenine atar.
SELECT @maxSarkiSuresi = DATEDIFF(second, '00:00:00', SarkiSuresi) FROM Sarkilar; 

--views yap�s� �rne�i
CREATE VIEW sarkisure AS
SELECT SarkiSuresi
FROM Sarkilar
WHERE SarkiSuresi < '02:59:00';
