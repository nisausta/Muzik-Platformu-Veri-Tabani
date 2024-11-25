USE veritabaniproje


-- SELECT sorgularý
SELECT * FROM Sanatcilar;

-- INSERT sorgularý Sanatcilar tablosuna veri giriþi yapmayý saðlar.
INSERT INTO Sanatcilar (SanatciID, SanatciAdi) VALUES (51, 'Seyfettin Sucu');

-- UPDATE sorgularý : Güncellemeyi saðlar.
UPDATE Sanatcilar SET SanatciAdi = 'Emel Taþçýoðlu' WHERE SanatciID = 51;

-- DELETE sorgularý : Sanatcilar tablosunda SanatciIDsi 51 olaný sil
DELETE FROM Sanatcilar WHERE SanatciID = 51;

-- WHERE koþullarý : Koþul belirtir. 
SELECT * FROM Sanatcilar WHERE SanatciAdi = 'Ajda Pekkan';

-- JOIN iþlemleri: Ýki tablonun belirli bir koþula göre eþleþmesini saðlar.
SELECT * FROM Sarkilar INNER JOIN Sanatcilar ON Sarkilar.SanatciID = Sanatcilar.SanatciID;

-- GROUP BY ve HAVING kullanýmý  : Sütuna göre veri gruplama ve gruplarýn toplu iþlemlerini filtreleme
SELECT SanatciID,  COUNT(*) AS 'Toplam Þarký' FROM Sarkilar GROUP BY SanatciID HAVING COUNT(*) > 1;

-- ORDER BY kullanýmý : Bir tablodan tüm sütunlarý alýr ancak order by ile belirtilen sütuna göre sýralar
SELECT * FROM Sarkilar ORDER BY SarkiAdi;

-- COUNT, SUM, AVG gibi agregat fonksiyonlar 
SELECT COUNT(*) AS 'Þarkýlar' FROM Sarkilar; SELECT AVG(BegenilmeOrani) AS 'Beðenilme Oraný' FROM BEGENÝLME; SELECT SUM(BegenilmeOrani) AS 'Beðenilme Puan Toplamý' FROM BEGENÝLME;

-- LIKE ve IN kullanýmý 
SELECT * FROM Sanatcilar WHERE SanatciAdi LIKE '%Adi%'; SELECT * FROM Sanatcilar WHERE SanatciID IN (1, 2, 3);

-- Subquery kullanýmý 
SELECT * FROM Sanatcilar WHERE SanatciID IN (SELECT SanatciID FROM Sarkilar WHERE SarkiAdi = 'Arapsaçý');

-- Geçici tablo oluþturma ve kullanma 
SELECT * INTO TempTable FROM Sanatcilar;
SELECT * FROM TempTable;

-- Deðiþken kullanýmý (DECLARE ve SET)
DECLARE @SanatciAdi NVARCHAR(50);
SET @SanatciAdi = 'Funda Arar'; 
SELECT * FROM Sanatcilar WHERE SanatciAdi = @SanatciAdi;

-- IF-ELSE yapýsý 
IF EXISTS(SELECT * FROM Sanatcilar WHERE SanatciAdi = 'Bergen') BEGIN PRINT 'Sanatci Adi bulundu.' END ELSE BEGIN PRINT 'Sanatci Adi bulunamadi.' END

-- PRINT komutu 
PRINT 'Eski Sarkilar';

-- DISTINCT kullanýmý 
SELECT DISTINCT SanatciAdi FROM Sanatcilar;

-- BETWEEN kullanýmý 
SELECT * FROM Sarkilar WHERE SarkiSuresi BETWEEN '04:00' AND '05:00';

-- UNION ve UNION ALL kullanýmý 
SELECT SanatciAdi FROM Sanatcilar WHERE SanatciID = 1 UNION ALL SELECT SanatciAdi FROM Sanatcilar WHERE SanatciID = 2;

-- CASE WHEN kullanýmý 
SELECT SanatciAdi, CASE WHEN BegenilmeOrani > 80 THEN 'Çok iyi' WHEN BegenilmeOrani > 60 THEN 'Ýyi' ELSE 'Ortalama' END AS BegenilmeDurumu FROM Sanatcilar INNER JOIN BEGENÝLME ON SANATCILAR.SanatciID = BEGENÝLME.BegenilmeID;

-- NULL kontrolü 
SELECT * FROM Sarkilar WHERE BegenilmeID IS NULL;

-- VIEW oluþturma 
CREATE VIEW SanatciView AS SELECT SanatciAdi, BegenilmeOrani FROM Sanatcilar INNER JOIN BEGENÝLME ON Sanatcilar.SanatciID = BEGENÝLME.BegenilmeID;
SELECT * FROM SanatciView

-- Date ve Time fonksiyonlarý 
SELECT GETDATE() AS 'Güncel Tarih'; 
SELECT DATEADD(year, -1, GETDATE()) AS '1 Yýl Öncesinin Tarihi'; 
SELECT DATEDIFF(year, '2000-01-01', GETDATE()) AS '2000 den bu yana kaç yýl geçti?'; 
SELECT DATEPART(year, GETDATE()) AS 'Bu Yýl'; 
SELECT CONVERT(VARCHAR, GETDATE(), 108) AS 'Saat';

-- CONCAT: Ýki veya daha fazla stringi birleþtirir.
SELECT CONCAT(SanatciAdi, ' - ', AlbumAdi) AS 'Sanatci ve Album' FROM Sanatcilar INNER JOIN ALBUMLER ON Sanatcilar.SanatciID = ALBUMLER.SanatciID;

-- LEN: Bir stringin uzunluðunu döndürür.
SELECT LEN(SanatciAdi) AS 'Sanatci Adi Uzunlugu' FROM Sanatcilar;

-- UPPER ve LOWER: Bir stringi büyük veya küçük harfe çevirir.
SELECT UPPER(SanatciAdi) AS 'Sanatci Adi (Büyük Harf)', LOWER(SanatciAdi) AS 'Sanatci Adi (Küçük Harf)' FROM Sanatcilar;

-- SUBSTRING: Bir stringin belirli bir bölümünü döndürür.
SELECT SUBSTRING(SanatciAdi, 1, 5) AS 'Sanatci Adi (Ýlk 5 Karakter)' FROM Sanatcilar;

-- REPLACE: Bir stringdeki belirli bir metni baþka bir metinle deðiþtirir.
SELECT REPLACE(SanatciAdi, 'a', 'e') AS 'Sanatci Adi (a yerine e)' FROM Sanatcilar;

-- TRIM: Bir stringin baþýndaki ve sonundaki boþluklarý kaldýrýr.
SELECT TRIM(SanatciAdi) AS 'Sanatci Adi (Trim Uygulanmýþ)' FROM Sanatcilar;

-- ABS: Bir sayýnýn mutlak deðerini döndürür.
SELECT ABS(BegenilmeOrani) AS 'Mutlak Begenilme Orani' FROM BEGENÝLME;

-- ROUND: Bir sayýyý en yakýn tam sayýya yuvarlar.
SELECT ROUND(BegenilmeOrani,0) AS 'Yuvarlanmýþ Begenilme Orani' FROM BEGENÝLME;

-- CEILING ve FLOOR: Bir sayýyý yukarý veya aþaðýya yuvarlar.
SELECT CEILING(BegenilmeOrani) AS 'Yukarý Yuvarlanmýþ Begenilme Orani', FLOOR(BegenilmeOrani) AS 'Aþaðý Yuvarlanmýþ Begenilme Orani' FROM BEGENÝLME;

-- SQRT: Bir sayýnýn karekökünü döndürür.
SELECT SQRT(BegenilmeOrani) AS 'Karekök Begenilme Orani' FROM BEGENÝLME WHERE BegenilmeOrani >= 0;

-- POWER: Bir sayýnýn belirli bir kuvvetini döndürür.
SELECT POWER(BegenilmeOrani, 2) AS 'Karesi Alýnmýþ Begenilme Orani' FROM BEGENÝLME;

--CHARINDEX Kullanýmý
SELECT * FROM Sanatcilar WHERE CHARINDEX('B', SanatciAdi) > 0;

--1980-1990 arasý en çok þarký çýkaran sanatçý ile 1990-2000 arasý en çok þarký çýkartan sanatçýnýn arasýndaki þarký sayýsý farký
SELECT COUNT(*) AS 'Aradaki Fark' FROM Sanatcilar 
INNER JOIN ALBUMLER ON Sanatcilar.SanatciID = ALBUMLER.SanatciID 
INNER JOIN SarkininCikisYili ON ALBUMLER.CikisID = SarkininCikisYili.CikisID 
INNER JOIN Sarkilar ON ALBUMLER.AlbumID = Sarkilar.AlbumID WHERE SarkininCikisYili.DonemID = 1 OR SarkininCikisYili.DonemID = 2

--FUNCTION
-- Bir T-SQL fonksiyonu oluþtur: Verilen SarkiID'ye göre ilgili þarkýnýn adýný döndüren dbo.fnGetirSarkiAdi.
CREATE FUNCTION dbo.fnGetirSarkiAdi (@SarkiID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
-- Lokal bir deðiþken tanýmla ve belirtilen SarkiID'ye ait þarký adýný bu deðiþkene atayarak döndür.
    DECLARE @SarkiAdi NVARCHAR(100)
    SELECT @SarkiAdi = SarkiAdi FROM Sarkilar WHERE SarkiID = @SarkiID
    RETURN @SarkiAdi
END
GO

SELECT dbo.fnGetirSarkiAdi(1)


-- "SarkininCikisYili" tablosundan, "DonemID" deðeri 1 olan kayýtlarýn "CikisID", "sarkinincikisyili", ve "DonemID" sütunlarýný seç.
-- Sonuçlarý "Sarkinincikisyili" sütununa göre küçükten büyüðe doðru (artan sýra) sýrala.
select CikisID, sarkinincikisyili,DonemID from SarkininCikisYili where DonemID = 1 order by SarkininCikisYili asc


-- "SarkininCikisYili" tablosundan, "DonemID" deðeri 2 olan kayýtlarýn "CikisID", "sarkinincikisyili", ve "DonemID" sütunlarýný seç.
-- Sonuçlarý "Sarkinincikisyili" sütununa göre büyükten küçüðe doðru (azalan sýra) sýrala.
select CikisID, sarkinincikisyili,DonemID from SarkininCikisYili where DonemID = 2 order by SarkininCikisYili desc 


-- "SarkininCikisYili" tablosundaki "SarkinCikisYili" sütunundaki en yüksek deðeri (maksimum) bul.
-- Bu deðeri "max_cikis_yili" ismiyle alias (takma ad) ile görüntüle.
select max(SarkininCikisYili) as 'max_cikis_yili' from SarkininCikisYili

-- "SarkininCikisYili" tablosundaki "SarkinCikisYili" sütunundaki en düþük deðeri (minimum) bul.
-- Bu deðeri "min_cikis_yili" ismiyle alias (takma ad) ile görüntüle.
select min(SarkininCikisYili) as 'min_cikis_yili' from SarkininCikisYili

-- "SarkininCikisYili" tablosundaki "SarkinCikisYili" sütunundaki tüm deðerleri topla.
-- Toplamý "top_yil" ismiyle alias (takma ad) ile görüntüle.
select sum(SarkininCikisYili) as 'top_yil' from SarkininCikisYili

-- "SarkininCikisYili" tablosundaki "SarkinCikisYili" sütunundaki deðerlerin ortalamasýný hesapla.
-- Ortalamayý "ort_yil" ismiyle alias (takma ad) ile görüntüle.
select avg(SarkininCikisYili) as 'ort_yil' from SarkininCikisYili

-- "SarkininCikisYili" tablosundaki toplam satýr sayýsýný bul.
-- Bu sayýyý "tum_yillar" ismiyle alias (takma ad) ile görüntüle.
select count(SarkininCikisYili) as 'tum_yillar' from SarkininCikisYili

-- "Sanatcilar" tablosundaki benzersiz (tekrarsýz) "SanatciAdi" deðerlerini seç.
select distinct(SanatciAdi) from Sanatcilar

-- "Sanatcilar" tablosundaki "SanatciAdi" sütunundaki deðerleri ters çevir.
select reverse(SanatciAdi) from Sanatcilar




-- "Sanatcilar", "Sarkilar", "Turler", ve "Begenilme" tablolarýný birleþtirerek her sanatçýnýn her türdeki en düþük beðenilme oranýný bul.
-- Gruplama yapýlarak, her sanatçý ve tür kombinasyonu için en düþük beðenilme oranýný içeren sonuçlarý elde et.
-- ROLLUP kullanarak toplam (overall) en düþük beðenilme oranlarýný da göster.
-- Sonuçlarý tür ID'ye göre artan sýrayla sýrala.
SELECT Sanatcilar.SanatciAdi, Turler.TurID, MIN(Begenilme.BegenilmeOrani) AS MinBegenilmeOrani
FROM Sanatcilar
JOIN Sarkilar ON Sanatcilar.SanatciID = Sarkilar.SanatciID
JOIN Turler ON Sarkilar.TurID = Turler.TurID
JOIN Begenilme ON Sarkilar.BegenilmeID = Begenilme.BegenilmeID
GROUP BY Sanatcilar.SanatciAdi, Turler.TurID WITH ROLLUP
ORDER BY Turler.TurID ASC;





DECLARE @degisken1 INT; -- Tamsayý bir deðiþken tanýmla.
SET @degisken1 = 300;-- Deðiþken deðerine 300 atama yap.


IF @degisken1 > 300 -- Eðer deðiþken deðeri 300'den büyükse
BEGIN
    SELECT MAX(CikisID) FROM Albumler; -- "Albumler" tablosundaki en büyük CikisID deðerini seç.
    SELECT MIN(CikisID) FROM Albumler;  -- "Albumler" tablosundaki en küçük CikisID deðerini seç.

    SET @degisken1 = @degisken1 + 1;-- Deðiþken deðerini bir artýr.
END
ELSE  
BEGIN
    SELECT @degisken1;-- Deðiþkenin mevcut deðerini seç.
    SET @degisken1 = @degisken1 + 2;-- Deðiþken deðerini iki artýr.
    SELECT @degisken1;-- Deðiþkenin güncellenmiþ deðerini seç.
END;




-- Her albüm için þarký sürelerinin toplamýný dakika cinsinden hesapla,
-- Toplam süresi 150 dakikadan fazla olan albümleri filtrele,
-- Sonuçlarý albüm ID'sine göre grupla ve sýrala.
SELECT AlbumID, SUM(DATEDIFF(minute, '00:00:00', SarkiSuresi)) AS 'ToplamDakika'
FROM Sarkilar
GROUP BY AlbumID
HAVING SUM(DATEDIFF(minute, '00:00:00', SarkiSuresi)) > 150
ORDER BY ToplamDakika ASC;



-- Kullanýcý adý ile kullanýcý ID'sini birleþtirip 'AdID' olarak adlandýrýlmýþ yeni bir sütun oluþtur.
SELECT KullaniciAdi + ' ' + CONVERT(nvarchar, KullaniciID) AS 'AdID'
FROM Kullanicilar;




UPDATE Albumler
SET AlbumAdi = (SELECT TOP 1 AlbumAdi FROM Albumler ORDER BY AlbumID DESC), -- Albumler tablosundaki AlbumAdi sütununu, ayný tablodaki en yüksek AlbumID deðerine sahip AlbumAdi ile güncelleme
    CikisID = (SELECT TOP 1 CikisID FROM Albumler ORDER BY AlbumID DESC), -- Albumler tablosundaki CikisID sütununu, ayný tablodaki en yüksek AlbumID deðerine sahip CikisID ile güncelleme
    SanatciID = (SELECT TOP 1 SanatciID FROM Albumler ORDER BY AlbumID DESC) -- Albumler tablosundaki SanatciID sütununu, ayný tablodaki en yüksek AlbumID deðerine sahip SanatciID ile güncelleme
WHERE AlbumID = (SELECT MAX(AlbumID) FROM Albumler); -- Güncellemeyi hangi kriterlere göre yapmak istediðiniz



-- "Sanatcilar" tablosundan "SanatciAdi" ve "SanatciID" sütunlarýný kopyalayarak yeni bir "YeniSanatcilar" tablosu oluþtur.
SELECT SanatciAdi AS Adi, SanatciID AS ID INTO YeniSanatcilar FROM Sanatcilar;




-- Bir kayan noktalý sayý tipindeki deðiþken tanýmla: @maxSarkiSuresi
DECLARE @maxSarkiSuresi FLOAT;

-- "Sarkilar" tablosundaki her bir þarkýnýn süresini saniye cinsinden hesaplayarak, 
-- bu süreleri @maxSarkiSuresi deðiþkenine atar.
SELECT @maxSarkiSuresi = DATEDIFF(second, '00:00:00', SarkiSuresi) FROM Sarkilar; 

--views yapýsý örneði
CREATE VIEW sarkisure AS
SELECT SarkiSuresi
FROM Sarkilar
WHERE SarkiSuresi < '02:59:00';
