CREATE DATABASE veritabaniproje

USE veritabaniproje

CREATE TABLE il (
    ilID INT PRIMARY KEY,
    ilAdi NVARCHAR(100) NOT NULL
);

CREATE TABLE Donemler (
    DonemID INT PRIMARY KEY,
    DonemAdi NVARCHAR(100) NOT NULL
);

CREATE TABLE Turler (
    TurID INT PRIMARY KEY,
    SarkiTuru NVARCHAR(100) NOT NULL
);

CREATE TABLE SarkininCikisYili (
    CikisID INT PRIMARY KEY,
    SarkininCikisYili INT NOT NULL,
    DonemID INT,
    FOREIGN KEY (DonemID) REFERENCES Donemler(DonemID)
);

CREATE TABLE Sanatcilar (
    SanatciID INT PRIMARY KEY,
    SanatciAdi NVARCHAR(50) NOT NULL
);

CREATE TABLE Begenilme (
    BegenilmeID INT PRIMARY KEY,
    BegenilmeOrani FLOAT
);

CREATE TABLE Albumler (
    AlbumID INT PRIMARY KEY,
    AlbumAdi NVARCHAR(100) NOT NULL,
    CikisID INT,
    SanatciID INT,
    FOREIGN KEY (CikisID) REFERENCES SarkininCikisYili(CikisID),
    FOREIGN KEY (SanatciID) REFERENCES Sanatcilar(SanatciID)
);

CREATE TABLE Sarkilar (
    SarkiID INT PRIMARY KEY,
    SarkiAdi NVARCHAR(100) NOT NULL,
    SarkiSuresi TIME(0),
    DonemID INT,
    TurID INT,
    AlbumID INT,
    BegenilmeID INT,
    SanatciID INT,
    FOREIGN KEY (DonemID) REFERENCES Donemler(DonemID),
    FOREIGN KEY (TurID) REFERENCES Turler(TurID),
    FOREIGN KEY (AlbumID) REFERENCES Albumler(AlbumID),
    FOREIGN KEY (BegenilmeID) REFERENCES Begenilme(BegenilmeID),
    FOREIGN KEY (SanatciID) REFERENCES Sanatcilar(SanatciID)
);

CREATE TABLE Cinsiyet (
    CinsiyetID INT PRIMARY KEY,
    Cinsiyet NVARCHAR(100)
);

CREATE TABLE Kullanicilar (
    KullaniciID INT PRIMARY KEY,
    KullaniciAdi NVARCHAR(100) NOT NULL,
    KullaniciEposta NVARCHAR(100),
    KullaniciSifre NVARCHAR(255) NOT NULL,
    KullaniciTelNo INT,
    DogumTarihi DATE,
    CinsiyetID INT,
    ilID INT,
    FOREIGN KEY (CinsiyetID) REFERENCES Cinsiyet(CinsiyetID),
    FOREIGN KEY (ilID) REFERENCES il(ilID),
);
ALTER TABLE Kullanicilar
ALTER COLUMN KullaniciTelNo BIGINT;

CREATE TABLE CalmaListeleri (
    CalmaListesiID INT PRIMARY KEY,
	CalmaListesiAdi NVARCHAR(255),
	KullaniciID INT,
	FOREIGN KEY (KullaniciID) REFERENCES kullanicilar(KullaniciID)
);


CREATE TABLE CalmaListesiIcerik (
    CLIcerikID INT PRIMARY KEY,
	CalmaListesiID INT,
	SarkiID INT,
	FOREIGN KEY (CalmaListesiID) REFERENCES CalmaListeleri(CalmaListesiID),
	FOREIGN KEY (SarkiID) REFERENCES Sarkilar(SarkiID)
);


--ÝLLER
INSERT INTO il VALUES (1,'Adana')
INSERT INTO il VALUES (2,'Adýyaman')
INSERT INTO il VALUES (3,'Afyonkarahisar')
INSERT INTO il VALUES (4,'Aðrý')
INSERT INTO il VALUES (5,'Amasya')
INSERT INTO il VALUES (6,'Ankara')
INSERT INTO il VALUES (7,'Antalya')
INSERT INTO il VALUES (8,'Artvin')
INSERT INTO il VALUES (9,'Aydýn')
INSERT INTO il VALUES (10,'Balýkesir')
INSERT INTO il VALUES (11,'Bilecik')
INSERT INTO il VALUES (12,'Bingöl')
INSERT INTO il VALUES (13,'Bitlis')
INSERT INTO il VALUES (14,'Bolu')
INSERT INTO il VALUES (15,'Burdur')
INSERT INTO il VALUES (16,'Bursa')
INSERT INTO il VALUES (17,'Çanakkale')
INSERT INTO il VALUES (18,'Çankýrý')
INSERT INTO il VALUES (19,'Çorum')
INSERT INTO il VALUES (20,'Denizli')
INSERT INTO il VALUES (21,'Diyarbakýr')
INSERT INTO il VALUES (22,'Edirne')
INSERT INTO il VALUES (23,'Elazýð')
INSERT INTO il VALUES (24,'Erzincan')
INSERT INTO il VALUES (25,'Erzurum')
INSERT INTO il VALUES (26,'Eskiþehir')
INSERT INTO il VALUES (27,'Gaziantep')
INSERT INTO il VALUES (28,'Giresun')
INSERT INTO il VALUES (29,'Gümüþhane')
INSERT INTO il VALUES (30,'Hakkâri')
INSERT INTO il VALUES (31,'Hatay')
INSERT INTO il VALUES (32,'Isparta')
INSERT INTO il VALUES (33,'Ýçel (Mersin)')
INSERT INTO il VALUES (34,'Ýstanbul')
INSERT INTO il VALUES (35,'Ýzmir')
INSERT INTO il VALUES (36,'Kars')
INSERT INTO il VALUES (37,'Kastamonu')
INSERT INTO il VALUES (38,'Kayseri')
INSERT INTO il VALUES (39,'Kýrklareli')
INSERT INTO il VALUES (40,'Kýrþehir')
INSERT INTO il VALUES (41,'Kocaeli')
INSERT INTO il VALUES (42,'Konya')
INSERT INTO il VALUES (43,'Kütahya')
INSERT INTO il VALUES (44,'Malatya')
INSERT INTO il VALUES (45,'Manisa')
INSERT INTO il VALUES (46,'Kahramanmaraþ')
INSERT INTO il VALUES (47,'Mardin')
INSERT INTO il VALUES (48,'Muðla')
INSERT INTO il VALUES (49,'Muþ')
INSERT INTO il VALUES (50,'Nevþehir')
INSERT INTO il VALUES (51,'Niðde')
INSERT INTO il VALUES (52,'Ordu')
INSERT INTO il VALUES (53,'Rize')
INSERT INTO il VALUES (54,'Sakarya')
INSERT INTO il VALUES (55,'Samsun')
INSERT INTO il VALUES (56,'Siirt')
INSERT INTO il VALUES (57,'Sinop')
INSERT INTO il VALUES (58,'Sivas')
INSERT INTO il VALUES (59,'Tekirdað')
INSERT INTO il VALUES (60,'Tokat')
INSERT INTO il VALUES (61,'Trabzon')
INSERT INTO il VALUES (62,'Tunceli')
INSERT INTO il VALUES (63,'Þanlýurfa')
INSERT INTO il VALUES (64,'Uþak')
INSERT INTO il VALUES (65,'Van')
INSERT INTO il VALUES (66,'Yozgat')
INSERT INTO il VALUES (67,'Zonguldak')
INSERT INTO il VALUES (68,'Aksaray')
INSERT INTO il VALUES (69,'Bayburt')
INSERT INTO il VALUES (70,'Karaman')
INSERT INTO il VALUES (71,'Kýrýkkale')
INSERT INTO il VALUES (72,'Batman')
INSERT INTO il VALUES (73,'Þýrnak')
INSERT INTO il VALUES (74,'Bartýn')
INSERT INTO il VALUES (75,'Ardahan')
INSERT INTO il VALUES (76,'Iðdýr')
INSERT INTO il VALUES (77,'Yalova')
INSERT INTO il VALUES (78,'Karabük')
INSERT INTO il VALUES (79,'Kilis')
INSERT INTO il VALUES (80,'Osmaniye')
INSERT INTO il VALUES (81,'Düzce')


-- TÜRLER
INSERT INTO Turler VALUES (1, 'AnadoluRock');
INSERT INTO Turler VALUES (2, 'Arabesk');
INSERT INTO Turler VALUES (3, 'HalkMuzigi');
INSERT INTO Turler VALUES (4, 'Pop');
INSERT INTO Turler VALUES (5, 'Rock');
INSERT INTO Turler VALUES (6, 'TürkHalkMüziði');
INSERT INTO Turler VALUES (7, 'TürkSanat');
INSERT INTO Turler VALUES (8, 'TürkSanatMüziði');
INSERT INTO Turler VALUES (9, 'Türkü');

-- DÖNEMLER
INSERT INTO Donemler VALUES (1, '70ler');
INSERT INTO Donemler VALUES (2, '80ler');
INSERT INTO Donemler VALUES (3, '90lar');
INSERT INTO Donemler VALUES (4, '00ler');

-- BEGENILME
INSERT INTO Begenilme VALUES (1, 1.0);
INSERT INTO Begenilme VALUES (2, 1.1);
INSERT INTO Begenilme VALUES (3, 1.2);
INSERT INTO Begenilme VALUES (4, 1.3);
INSERT INTO Begenilme VALUES (5, 1.4);
INSERT INTO Begenilme VALUES (6, 1.5);
INSERT INTO Begenilme VALUES (7, 1.6);
INSERT INTO Begenilme VALUES (8, 1.7);
INSERT INTO Begenilme VALUES (9, 1.8);
INSERT INTO Begenilme VALUES (10, 1.9);
INSERT INTO Begenilme VALUES (11, 2.0);
INSERT INTO Begenilme VALUES (12, 2.1);
INSERT INTO Begenilme VALUES (13, 2.2);
INSERT INTO Begenilme VALUES (14, 2.3);
INSERT INTO Begenilme VALUES (15, 2.4);
INSERT INTO Begenilme VALUES (16, 2.5);
INSERT INTO Begenilme VALUES (17, 2.6);
INSERT INTO Begenilme VALUES (18, 2.7);
INSERT INTO Begenilme VALUES (19, 2.8);
INSERT INTO Begenilme VALUES (20, 2.9);
INSERT INTO Begenilme VALUES (21, 3.0);
INSERT INTO Begenilme VALUES (22, 3.1);
INSERT INTO Begenilme VALUES (23, 3.2);
INSERT INTO Begenilme VALUES (24, 3.3);
INSERT INTO Begenilme VALUES (25, 3.4);
INSERT INTO Begenilme VALUES (26, 3.5);
INSERT INTO Begenilme VALUES (27, 3.6);
INSERT INTO Begenilme VALUES (28, 3.7);
INSERT INTO Begenilme VALUES (29, 3.8);
INSERT INTO Begenilme VALUES (30, 3.9);
INSERT INTO Begenilme VALUES (31, 4.0);
INSERT INTO Begenilme VALUES (32, 4.1);
INSERT INTO Begenilme VALUES (33, 4.2);
INSERT INTO Begenilme VALUES (34, 4.3);
INSERT INTO Begenilme VALUES (35, 4.4);
INSERT INTO Begenilme VALUES (36, 4.5);
INSERT INTO Begenilme VALUES (37, 4.6);
INSERT INTO Begenilme VALUES (38, 4.7);
INSERT INTO Begenilme VALUES (39, 4.7);
INSERT INTO Begenilme VALUES (40, 4.8);
INSERT INTO Begenilme VALUES (41, 5.0);



--ÞARKININÇIKIÞYILI
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (1,'1970',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (2,'1971',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (3,'1972',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (4,'1973',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (5,'1974',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (6,'1975',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (7,'1976',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (8,'1977',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (9,'1978',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (10,'1979',1)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (11,'1980',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (12,'1981',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (13,'1982',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (14,'1983',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (15,'1984',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (16,'1985',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (17,'1986',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (18,'1987',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (19,'1988',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (20,'1989',2)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (21,'1990',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (22,'1991',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (23,'1992',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (24,'1993',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (25,'1994',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (26,'1995',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (27,'1996',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (28,'1997',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (29,'1998',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (30,'1999',3)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (31,'2000',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (32,'2001',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (33,'2002',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (34,'2003',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (35,'2004',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (36,'2005',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (37,'2006',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (38,'2007',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (39,'2008',4)
INSERT INTO SarkininCikisYili(CikisID,SarkininCikisYili,DonemID) VALUES (40,'2009',4)


--CÝNSÝYET
INSERT INTO Cinsiyet VALUES (1,'kadýn')
INSERT INTO Cinsiyet VALUES (2,'erkek')


--SARKILAR
INSERT INTO Sarkilar(SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (1, 'Sonsuz Çile', '03:42', 3, 4, 1, 1);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (2, 'Kim Olsa Anlatýr', '05:55', 2, 4, 2, 2);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (3, 'Ah! Fatma', '02:34', 2, 4, 3, 2);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (4, 'Bir Günah Gibi', '03:51', 2, 4, 4, 2);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (5, 'Yeniden', '05:59', 2, 4, 5, 3);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (6, 'Hey DJ', '03:40', 4, 4, 6, 4);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (7, 'Rüzgar', '03:32', 4, 5, 7, 5);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (8, 'Nane Limon Kabuðu', '04:00', 2, 5, 8, 6);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (9, 'Ýþte Hendek Ýþte Deve', '02:34', 2, 5, 9, 6);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (10, 'Unutamadým', '04:19', 2, 5, 10, 6);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (11, 'Halil Ýbrahim Sofrasý', '05:59', 2, 5, 6, 6);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (12, 'Gel Gel', '02:58', 4, 5, 11, 7);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (13, 'Hoþgeldin', '05:08', 4, 5, 12, 7);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (14, 'Eller Aldý', '02:34', 2, 8, 13, 8);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (15, 'Resimdeki', '06:20', 2, 5, 14, 9);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (16, 'Alamanya', '04:32', 2, 5, 6, 9);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (17, 'Adýný Suya Yazdým', '03:45', 3, 4, 15, 10);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (18, 'Sosyeten Uymaz', '05:12', 3, 4, 16, 10);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (19, 'Þimdi Hayallerdesin', '04:45', 3, 4, 17, 11);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (20, 'Youh Remixes', '03:55', 4, 4, 6, 11);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (21, 'Asla Affedilmez', '03:28', 3, 4, 18, 12);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (22, 'Sebebim', '04:05', 3, 4, 18, 12);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (23, 'Arnavut Kaldýrýmý', '03:20', 3, 4, 19, 13);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (24, 'Kibar Gelin', '04:00', 2, 4, 6, 14);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (25, 'Öyle Bir Aþk', '03:28', 2, 2, 20, 15);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID)VALUES (26, 'Deli Et Beni', '04:10', 3, 2, 21, 15);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (27, 'Feryat', '04:00', 1, 8, 22, 16);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (28, 'Afili Yalnýzlýk', '03:52', 4, 2, 6, 17);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (29, 'Oylum Oylum', '03:51', 1, 8, 23, 18);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (30, 'Aþklarýn En Güzeli', '03:55', 4, 2, 24, 19);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (31, 'Arapsaçý', '04:30', 4, 2, 25, 20);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (32, 'Benim Ýçin N''apardýn', '04:32', 4, 4, 26, 21);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (33, 'Sebebim Sensin', '05:25', 4, 9, 27, 21);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (34, 'Arka Sokaklar', '03:48', 4, 9, 28, 22);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (35, 'Kandýramazsýn Beni', '03:12', 4, 9, 29, 22);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (36, 'Çok Güzelsin', '03:50', 4, 9, 30, 23);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (37, 'Uzat Elini', '04:22', 4, 4, 31, 23);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (38, 'Sweat', '02:58', 4, 4, 6, 24);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (39, 'Çilli Bom', '04:45', 3, 5, 6, 25);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (40, 'Aþkýn Mapushane', '03:18', 4, 5, 6, 26);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (41, 'Çemberimde Gül Oya', '04:12', 4, 5, 32, 26);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (42, 'Þansýn Bol Olsun', '03:25', 4, 5, 33, 27);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (43, 'Sýkýldým', '02:45', 4, 5, 34, 28);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (44, 'Sarmaþ Dolaþ', '04:35', 2, 5, 35, 29);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (45, 'Sarýlýnca Sana', '04:18', 4, 5, 6, 29);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (46, 'Senden Daha Güzel', '02:55', 4, 5, 37, 30);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (47, 'Sor Bana Piþman Mýyým', '04:19', 4, 4, 38, 30);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (48, 'Anlatamýyorum', '04:10', 1, 5, 39, 31);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (49, 'Dertte Mesut Ediyor', '04:50', 1, 5, 40, 31);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (50, 'Sabret Dostum', '03:38', 2, 5, 41, 32);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (51, 'Salýný Salýný', '05:11', 4, 4, 6, 33);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (52, 'Yeniden Hayata', '05:11', 4, 4, 42, 34);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (53, 'Gidiyorsun', '03:33', 4, 4, 43, 35);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (54, 'Kirpiklerin Islak Islak', '04:12', 2, 7, 44, 36);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (55, 'Ýntizar', '03:25', 2, 7, 6, 37);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (56, 'Tek Baþýna', '03:48', 2, 7, 45, 37);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (57, 'Olmaz Olsun', '03:51', 2, 8, 46, 37);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (58, 'Saki', '04:45', 2, 4, 47, 38);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (59, 'Melankoli', '04:32', 2, 4, 48, 39);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (60, 'Takalar', '05:59', 1, 4, 49, 39);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (61, 'Sev', '04:00', 2, 8, 6, 39);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (62, 'Seninle Beraberim', '04:00', 2, 8, 50, 40);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (63, 'Sevemem Artýk', '03:51', 1, 4, 51, 41);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (64, 'Bana Ellerini Ver', '06:20', 1, 8, 52, 42);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (65, 'Bütün Meyhanelerini Dolaþtým Ýstanbul''un', '04:19', 1, 4, 53, 42);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (66, 'Destina', '04:45', 2, 4, 54, 43);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (67, 'Türkü Rüzgar', '02:34', 2, 4, 55, 43);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (68, 'Verdiðin Söz Bu Muydu', '04:32', 1, 4, 56, 44);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (69, 'Kolay Deðil', '02:59', 2, 4, 57, 45);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (70, 'Küçük Bir Aþk Masalý', '04:45', 2, 4, 6, 45);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (71, 'Tükeneceðiz', '03:43', 2, 4, 58, 45);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (72, 'Biliyorsun', '02:34', 2, 4, 59, 45);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (73, 'Çaðrý', '05:00', 2, 4, 6, 46);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (74, 'Delisin', '06:20', 1, 4, 6, 47);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (75, 'Kara Sevda Yüzünden', '04:00', 2, 4, 6, 48);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (76, 'Baþa Dönebilir Miyiz?', '03:21', 4, 8, 60, 49);
INSERT INTO Sarkilar (SarkiID,SarkiAdi,SarkiSuresi,DonemID,TurID,AlbumID,SanatciID) VALUES (77, 'Benimsin', '04:32', 2, 4, 61, 50);



--ALBUMLER
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (1, 'Ah Caným Vah Caným', 25, 1);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (2, 'Süperstar4', 18, 2);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (3, '5.Yýl Önce 10 Yýl Sonra', 16, 2);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (4, 'Süperstar 83', 14, 2);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (5, 'Haydi Söyle', 18, 3);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (6, 'Single', 36, 4);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (7, 'Ayrýlýk Zamansýz Gelir', 38, 5);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (8, 'Sahibinden ihtiyaçtan', 19, 6);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (9, '21.Yüzyýlýn Adamý', 17, 6);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (10, 'Deðmesin Yaðlý Boya', 17, 6);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (11, 'single', 14, 6);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (12, 'Gel Gel', 36, 7);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (13, 'Hoþ geldin', 31, 7);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (14, 'Acýlarýn Kanadý', 17, 8);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (15, 'Þans Çocuðu', 19, 9);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (16, 'single', 11, 9);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (17, 'Adýný Suya Yazdým', 24, 10);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (18, 'Sosyeten Uymaz', 24, 10);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (19, 'Whirl', 26, 11);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (20, 'Single', 31, 11);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (21, 'Sebebim', 28, 12);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (22, 'Sebebim', 28, 12);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (23, 'Arnavut Kaldýrýmý', 25, 13);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (24, 'single', 13, 14);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (25, 'Alaturka Benim Caným', 37, 15);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (26, 'Deli Et Beni', 35, 15);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (27, 'Baþroldeyim', 16, 16);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (28, 'Single', 25, 17);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (29, 'Unutmadýk Seni', 4, 18);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (30, 'Ferhat Göçer', 30, 19);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (31, 'Alagül', 37, 20);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (32, 'Kader Utansýn', 6, 21);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (33, 'Özelsin', 36, 21);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (34, 'Sade ve Sadece', 33, 22);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (35, 'Uçacaksýn', 36, 22);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (36, 'Yalan', 31, 23);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (37, 'Uzat Elini', 33, 23);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (38, 'Single', 36, 24);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (39, 'Single', 36, 25);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (40, 'Single', 37, 26);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (41, 'Çemberimde Gül Oya', 36, 26);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (42, 'Sen Yoluna Ben Yoluma', 26, 27);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (43, 'Sýkýldým', 32, 28);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (44, 'Bir Yaz Daha Bitiyor', 36, 29);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (45, 'Single', 33, 29);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (46, 'Duman 2', 33, 30);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (47, 'Duman 1', 17, 30);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (48, 'Dertte Mesut Ediyor', 36, 31);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (49, 'Kapý Önünde Durdum', 40, 31);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (50, 'Sabret Dostum', 40, 32);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (51, 'Single', 3, 33);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (52, 'Yeniden Hayata', 3, 34);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (53, 'Sal', 11, 35);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (54, 'Teselliye Sen Gerek', 33, 36);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (55, 'single', 37, 37);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (56, 'Geceler', 33, 37);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (57, 'Nilüfer 84', 12, 37);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (58, 'Sultan-ý Yegah', 13, 38);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (59, 'Melankoli', 18, 39);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (60, 'Dostluða Davet', 15, 39);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (61, 'single', 12, 39);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (62, 'Seninle Beraber', 19, 40);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (63, 'Bir Ömür', 9, 41);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (64, 'Beni Affet', 16, 42);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (65, 'Bütün Meyhanelerini Dolaþtým Ýstanbul''un', 18, 42);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (66, 'Yeþilmiþik', 3, 43);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (67, 'Günebakan', 8, 43);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (68, 'Sevda', 3, 44);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (69, 'Git', 19, 45);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (70, 'single', 17, 45);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (71, 'Sen Aðlama', 8, 45);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (72, 'Aðlamak Güzeldir', 17, 45);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (73, 'single', 16, 46);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (74, 'single', 15, 47);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (75, 'single', 12,  48);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (76, 'Rus Kozmonotlarý', 12,  49);
INSERT INTO Albumler (AlbumID, AlbumAdi, CikisID, SanatciID) VALUES (77, 'Aþkýn Haritasý', 6, 50);


-- Sanatçýlar
INSERT INTO Sanatcilar VALUES (1, 'Ahmet');
INSERT INTO Sanatcilar VALUES (2, 'Ajda Pekkan');
INSERT INTO Sanatcilar VALUES (3, 'Aþkýn Nur Yengi');
INSERT INTO Sanatcilar VALUES (4, 'Ayþe Hatun');
INSERT INTO Sanatcilar VALUES (5, 'Barýþ Akarsu');
INSERT INTO Sanatcilar VALUES (6, 'Barýþ Manço');
INSERT INTO Sanatcilar VALUES (7, 'Bengü');
INSERT INTO Sanatcilar VALUES (8, 'Bergen');
INSERT INTO Sanatcilar VALUES (9, 'Cem Karaca');
INSERT INTO Sanatcilar VALUES (10, 'Cem Özer');
INSERT INTO Sanatcilar VALUES (11, 'Cem Tosun');
INSERT INTO Sanatcilar VALUES (12, 'Demet Akalýn');
INSERT INTO Sanatcilar VALUES (13, 'Demet Saðýroðlu');
INSERT INTO Sanatcilar VALUES (14, 'Edip Akbayram');
INSERT INTO Sanatcilar VALUES (15, 'Emel Müftüoðlu');
INSERT INTO Sanatcilar VALUES (16, 'Emel Sayýn');
INSERT INTO Sanatcilar VALUES (17, 'Emre Aydýn');
INSERT INTO Sanatcilar VALUES (18, 'Esmeray');
INSERT INTO Sanatcilar VALUES (19, 'Ferhat Göçer');
INSERT INTO Sanatcilar VALUES (20, 'Funda Arar');
INSERT INTO Sanatcilar VALUES (21, 'Gökhan Özen');
INSERT INTO Sanatcilar VALUES (22, 'Gülben Ergen');
INSERT INTO Sanatcilar VALUES (23, 'Gülçin Ergül');
INSERT INTO Sanatcilar VALUES (24, 'Hadise');
INSERT INTO Sanatcilar VALUES (25, 'Hakan Altun');
INSERT INTO Sanatcilar VALUES (26, 'Haluk Levent');
INSERT INTO Sanatcilar VALUES (27, 'Hande Yener');
INSERT INTO Sanatcilar VALUES (28, 'Hülya Avþar');
INSERT INTO Sanatcilar VALUES (29, 'Ýlhan Þeþen');
INSERT INTO Sanatcilar VALUES (30, 'Kaan Tangöze');
INSERT INTO Sanatcilar VALUES (31, 'Kerem Güney');
INSERT INTO Sanatcilar VALUES (32, 'Mehmet Pekün');
INSERT INTO Sanatcilar VALUES (33, 'Murat Kekilli');
INSERT INTO Sanatcilar VALUES (34, 'Murat Ötünç');
INSERT INTO Sanatcilar VALUES (35, 'Mustafa Sandal');
INSERT INTO Sanatcilar VALUES (36, 'Nazan Þoray');
INSERT INTO Sanatcilar VALUES (37, 'Nilüfer');
INSERT INTO Sanatcilar VALUES (38, 'Nur Yoldaþ');
INSERT INTO Sanatcilar VALUES (39, 'Nükhet Duru');
INSERT INTO Sanatcilar VALUES (40, 'Oya Küçümen');
INSERT INTO Sanatcilar VALUES (41, 'Ömür Göksel');
INSERT INTO Sanatcilar VALUES (42, 'Özdemir Erdoðan');
INSERT INTO Sanatcilar VALUES (43, 'Selim Atakan');
INSERT INTO Sanatcilar VALUES (44, 'Sevda Karaca');
INSERT INTO Sanatcilar VALUES (45, 'Sezen Aksu');
INSERT INTO Sanatcilar VALUES (46, 'Suavi Karaibrahimgil');
INSERT INTO Sanatcilar VALUES (47, 'Þebnem Aksu');
INSERT INTO Sanatcilar VALUES (48, 'Turgay Merih');
INSERT INTO Sanatcilar VALUES (49, 'Yiðit Vural');
INSERT INTO Sanatcilar VALUES (50, 'Zerrin Özer');



--KULLANICILAR

--KULLANICILAR
INSERT INTO Kullanicilar (KullaniciID, KullaniciAdi, KullaniciEposta, KullaniciSifre, KullaniciTelNo, DogumTarihi, CinsiyetID, ilID)
VALUES(1, 'Nisa', 'Nisa@gmail.com', 'sifre123', 1234567890, '2004-10-08', 1, 08);

INSERT INTO Kullanicilar (KullaniciID, KullaniciAdi, KullaniciEposta, KullaniciSifre, KullaniciTelNo, DogumTarihi, CinsiyetID, ilID)
VALUES(2, 'Rýdvan', 'Ridvan@gmail.com', 'sifre321', 234567890, '2001-07-01', 2, 34);

INSERT INTO Kullanicilar (KullaniciID, KullaniciAdi, KullaniciEposta, KullaniciSifre, KullaniciTelNo, DogumTarihi, CinsiyetID, ilID)
VALUES(3, 'Þimal', 'Simal@gmail.com', 'sifre231', 345678901, '2002-05-07', 1, 53);

INSERT INTO Kullanicilar (KullaniciID, KullaniciAdi, KullaniciEposta, KullaniciSifre, KullaniciTelNo, DogumTarihi, CinsiyetID, ilID)
VALUES(4, 'Eray', 'Eray@gmail.com', 'sifre213', 4567890123, '2004-01-01', 2, 28);

INSERT INTO Kullanicilar (KullaniciID, KullaniciAdi, KullaniciEposta, KullaniciSifre, KullaniciTelNo, DogumTarihi, CinsiyetID, ilID)
VALUES(5, 'Ceyda', 'Ceyda@gmail.com', 'sifre132', 2134567890, '2003-04-12', 1, 47);


--CalmaListeleri
 INSERT INTO CalmaListeleri VALUES (1, 'Nisa Günlük',1);
 INSERT INTO CalmaListeleri VALUES (2, 'Spor',2);
 INSERT INTO CalmaListeleri VALUES (3, 'Eðlenceli',3);
 INSERT INTO CalmaListeleri VALUES (4, 'Kopmalýk',4);
 INSERT INTO CalmaListeleri VALUES (5, 'Efkarlý',5);
 INSERT INTO CalmaListeleri VALUES (6, 'Disco Party',1);
 INSERT INTO CalmaListeleri VALUES (7, 'Piyasa',3);

 --CalmaListesiIcerik
INSERT INTO CalmaListesiIcerik VALUES (1, 5, 15);
INSERT INTO CalmaListesiIcerik VALUES (2, 5, 25);
INSERT INTO CalmaListesiIcerik VALUES (3, 5, 17);
INSERT INTO CalmaListesiIcerik VALUES (4, 5, 70);
INSERT INTO CalmaListesiIcerik VALUES (5, 5, 75);
INSERT INTO CalmaListesiIcerik VALUES (6, 5, 19);
INSERT INTO CalmaListesiIcerik VALUES (7, 3, 35);
INSERT INTO CalmaListesiIcerik VALUES (8, 3, 58);
INSERT INTO CalmaListesiIcerik VALUES (9, 3, 40);
INSERT INTO CalmaListesiIcerik VALUES (10, 2, 29);
INSERT INTO CalmaListesiIcerik VALUES (11, 2, 13);
INSERT INTO CalmaListesiIcerik VALUES (12, 1, 7);
INSERT INTO CalmaListesiIcerik VALUES (13, 1, 2);
INSERT INTO CalmaListesiIcerik VALUES (14, 1, 8);

--beðenilme yeri güncelleme
UPDATE Sarkilar SET BegenilmeID = 15 WHERE SarkiID = 1;
UPDATE Sarkilar SET BegenilmeID = 35 WHERE SarkiID = 2;
UPDATE Sarkilar SET BegenilmeID = 24 WHERE SarkiID = 3;
UPDATE Sarkilar SET BegenilmeID = 16 WHERE SarkiID = 4;
UPDATE Sarkilar SET BegenilmeID = 23 WHERE SarkiID = 5;
UPDATE Sarkilar SET BegenilmeID = 41 WHERE SarkiID = 6;
UPDATE Sarkilar SET BegenilmeID = 25 WHERE SarkiID = 7;
UPDATE Sarkilar SET BegenilmeID = 13 WHERE SarkiID = 8;
UPDATE Sarkilar SET BegenilmeID = 17 WHERE SarkiID = 9;
UPDATE Sarkilar SET BegenilmeID = 29 WHERE SarkiID = 10;
UPDATE Sarkilar SET BegenilmeID = 39 WHERE SarkiID = 11;
UPDATE Sarkilar SET BegenilmeID = 37 WHERE SarkiID = 12;
UPDATE Sarkilar SET BegenilmeID = 40 WHERE SarkiID = 13;
UPDATE Sarkilar SET BegenilmeID = 38 WHERE SarkiID = 14;
UPDATE Sarkilar SET BegenilmeID = 15 WHERE SarkiID = 15;
UPDATE Sarkilar SET BegenilmeID = 28 WHERE SarkiID = 16;
UPDATE Sarkilar SET BegenilmeID = 26 WHERE SarkiID = 17;
UPDATE Sarkilar SET BegenilmeID = 37 WHERE SarkiID = 18;
UPDATE Sarkilar SET BegenilmeID = 34 WHERE SarkiID = 19;
UPDATE Sarkilar SET BegenilmeID = 32 WHERE SarkiID = 20;
UPDATE Sarkilar SET BegenilmeID = 30 WHERE SarkiID = 21;
UPDATE Sarkilar SET BegenilmeID = 19 WHERE SarkiID = 22;
UPDATE Sarkilar SET BegenilmeID = 32 WHERE SarkiID = 23;
UPDATE Sarkilar SET BegenilmeID = 20 WHERE SarkiID = 24;
UPDATE Sarkilar SET BegenilmeID = 14 WHERE SarkiID = 25;
UPDATE Sarkilar SET BegenilmeID = 2 WHERE SarkiID = 26;
UPDATE Sarkilar SET BegenilmeID = 5 WHERE SarkiID = 27;
UPDATE Sarkilar SET BegenilmeID = 35 WHERE SarkiID = 28;
UPDATE Sarkilar SET BegenilmeID = 25 WHERE SarkiID = 29;
UPDATE Sarkilar SET BegenilmeID = 32 WHERE SarkiID = 30;
UPDATE Sarkilar SET BegenilmeID = 41 WHERE SarkiID = 31;
UPDATE Sarkilar SET BegenilmeID = 41 WHERE SarkiID = 32;
UPDATE Sarkilar SET BegenilmeID = 12 WHERE SarkiID = 33;
UPDATE Sarkilar SET BegenilmeID = 13 WHERE SarkiID = 34;
UPDATE Sarkilar SET BegenilmeID = 17 WHERE SarkiID = 35;
UPDATE Sarkilar SET BegenilmeID = 23 WHERE SarkiID = 36;
UPDATE Sarkilar SET BegenilmeID = 24 WHERE SarkiID = 37;
UPDATE Sarkilar SET BegenilmeID = 26 WHERE SarkiID = 38;
UPDATE Sarkilar SET BegenilmeID = 28 WHERE SarkiID = 39;
UPDATE Sarkilar SET BegenilmeID = 33 WHERE SarkiID = 40;
UPDATE Sarkilar SET BegenilmeID = 36 WHERE SarkiID = 41;
UPDATE Sarkilar SET BegenilmeID = 24 WHERE SarkiID = 42;
UPDATE Sarkilar SET BegenilmeID = 29 WHERE SarkiID = 43;
UPDATE Sarkilar SET BegenilmeID = 16 WHERE SarkiID = 44;
UPDATE Sarkilar SET BegenilmeID = 20 WHERE SarkiID = 45;
UPDATE Sarkilar SET BegenilmeID = 27 WHERE SarkiID = 46;
UPDATE Sarkilar SET BegenilmeID = 21 WHERE SarkiID = 47;
UPDATE Sarkilar SET BegenilmeID = 23 WHERE SarkiID = 48;
UPDATE Sarkilar SET BegenilmeID = 30 WHERE SarkiID = 49;
UPDATE Sarkilar SET BegenilmeID = 38 WHERE SarkiID = 50;
UPDATE Sarkilar SET BegenilmeID = 35 WHERE SarkiID = 51;
UPDATE Sarkilar SET BegenilmeID = 28 WHERE SarkiID = 52;
UPDATE Sarkilar SET BegenilmeID = 22 WHERE SarkiID = 53;
UPDATE Sarkilar SET BegenilmeID = 24 WHERE SarkiID = 54;
UPDATE Sarkilar SET BegenilmeID = 27 WHERE SarkiID = 55;
UPDATE Sarkilar SET BegenilmeID = 36 WHERE SarkiID = 56;
UPDATE Sarkilar SET BegenilmeID = 25 WHERE SarkiID = 57;
UPDATE Sarkilar SET BegenilmeID = 17 WHERE SarkiID = 58;
UPDATE Sarkilar SET BegenilmeID = 32 WHERE SarkiID = 59;
UPDATE Sarkilar SET BegenilmeID = 31 WHERE SarkiID = 60;
UPDATE Sarkilar SET BegenilmeID = 33 WHERE SarkiID = 61;
UPDATE Sarkilar SET BegenilmeID = 37 WHERE SarkiID = 62;
UPDATE Sarkilar SET BegenilmeID = 27 WHERE SarkiID = 63;
UPDATE Sarkilar SET BegenilmeID = 22 WHERE SarkiID = 64;
UPDATE Sarkilar SET BegenilmeID = 24 WHERE SarkiID = 65;
UPDATE Sarkilar SET BegenilmeID = 39 WHERE SarkiID = 66;
UPDATE Sarkilar SET BegenilmeID = 30 WHERE SarkiID = 67;
UPDATE Sarkilar SET BegenilmeID = 26 WHERE SarkiID = 68;
UPDATE Sarkilar SET BegenilmeID = 18 WHERE SarkiID = 69;
UPDATE Sarkilar SET BegenilmeID = 28 WHERE SarkiID = 70;
UPDATE Sarkilar SET BegenilmeID = 40 WHERE SarkiID = 71;
UPDATE Sarkilar SET BegenilmeID = 33 WHERE SarkiID = 72;
UPDATE Sarkilar SET BegenilmeID = 30 WHERE SarkiID = 73;
UPDATE Sarkilar SET BegenilmeID = 19 WHERE SarkiID = 74;
UPDATE Sarkilar SET BegenilmeID = 26 WHERE SarkiID = 75;
UPDATE Sarkilar SET BegenilmeID = 21 WHERE SarkiID = 76;
UPDATE Sarkilar SET BegenilmeID = 35 WHERE SarkiID = 77;

select* from Kullanicilar
select *from Begenilme
select *from Sarkilar
select *from Albumler
select *from CalmaListeleri
select *from CalmaListesiIcerik
select *from Cinsiyet
select *from Turler
select *from SarkininCikisYili
select*from Donemler




