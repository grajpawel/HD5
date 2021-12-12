DROP TABLE Wykonanie;
DROP TABLE Szkolenie;
DROP TABLE Urzadzenie;
DROP TABLE Usluga;
DROP TABLE Relacja;
DROP TABLE Pracownik;
DROP TABLE Czas;
DROP TABLE Data;
DROP TABLE Klient;
DROP TABLE Salon;

CREATE TABLE Relacja (
	ID Numeric(18,0) IDENTITY(1,1) NOT NULL,
	Swiezosc_szkolenia Varchar(30) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE Czas (
	Czas Time NOT NULL,
	ID Numeric(18,0) IDENTITY(1,1) NOT NULL,
	Godzina Numeric(18,0) NOT NULL,
	Minuta Numeric(18,0) NOT NULL
	PRIMARY KEY (ID)
);
CREATE TABLE Data (
	Data Date NOT NULL,
	ID Numeric(18,0) IDENTITY(1,1) NOT NULL,
	DzienMiesiaca Numeric(18,0) NOT NULL,
	DzienNumer Numeric(18,0) NOT NULL,
	DzienNazwa Varchar(20) NOT NULL,
	MiesiacNumer Numeric(18,0) NOT NULL,
	MiesiacNazwa Varchar(20) NOT NULL,
	Rok Numeric(18,0) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE Pracownik (
	ID Numeric(18,0) IDENTITY(1,1) NOT NULL,
	Imiê Varchar(50) NOT NULL,
	Login Varchar(10) NOT NULL,
	Czy_aktualne bit NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE Usluga (
	ID Numeric(18,0) IDENTITY(1,1) NOT NULL,
	Nazwa Varchar(50) NOT NULL,
	Kategoria_ceny Varchar(10) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE Klient (
	ID Numeric(18,0) IDENTITY(1,1) NOT NULL,
	Imie Varchar(20) NOT NULL,
	Numer_telefonu Varchar(12) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE Salon (
	ID Numeric(18,0) IDENTITY(1,1) NOT NULL,
	Kod_pocztowy Varchar(5) NOT NULL,
	Ulica Varchar(50) NOT NULL,
	Miasto Varchar(30) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE Urzadzenie (
	ID Numeric(18,0) IDENTITY(1,1) NOT NULL,
	Kategoria_ceny Varchar(10) NOT NULL,
	Stan Varchar(15) NOT NULL,
	Data_przegladu Numeric(18,0) NOT NULL,
	Data_zakupu Numeric(18,0) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (Data_przegladu) REFERENCES Data(ID),
	FOREIGN KEY (Data_zakupu) REFERENCES Data(ID)
);
CREATE TABLE Szkolenie (
	FK_Pracownik Numeric(18,0) NOT NULL,
	FK_Usluga Numeric(18,0) NOT NULL,
	FK_DataRozpoczecia Numeric(18,0) NOT NULL,
	FK_DataZakonczenia Numeric(18,0) NOT NULL,
	FK_CzasRozpoczecia Numeric(18,0) NOT NULL,
	FK_CzasZakonczenia Numeric(18,0) NOT NULL,
	Cena_kursu money NOT NULL,
	FK_Relacja Numeric(18,0) NOT NULL
	FOREIGN KEY (FK_DataRozpoczecia) REFERENCES Data(ID),
	FOREIGN KEY (FK_DataZakonczenia) REFERENCES Data(ID),
	FOREIGN KEY (FK_CzasRozpoczecia) REFERENCES Czas(ID),
	FOREIGN KEY (FK_CzasZakonczenia) REFERENCES Czas(ID),
	FOREIGN KEY (FK_Pracownik) REFERENCES Pracownik(ID),
	FOREIGN KEY (FK_Usluga) REFERENCES Usluga(ID),
	FOREIGN KEY (FK_Relacja) REFERENCES Relacja(ID)
);
CREATE TABLE Wykonanie (
	FK_Pracownik Numeric(18,0) NOT NULL,
	FK_Usluga Numeric(18,0) NOT NULL,
	FK_Urzadzenie Numeric(18,0) NOT NULL,
	FK_Data Numeric(18,0) NOT NULL,
	FK_Salon Numeric(18,0) NOT NULL,
	FK_Klient Numeric(18,0) NOT NULL,
	FK_Relacja Numeric(18,0) NOT NULL,
	FK_Czas Numeric(18,0) NOT NULL,
	Cena money NOT NULL,
	Ocena Numeric(18,0) NOT NULL,
	Czy_wykonane Numeric(1,0) NOT NULL,
	Numer_wizyty Numeric(18,0) NOT NULL
	FOREIGN KEY (FK_Data) REFERENCES Data(ID),
	FOREIGN KEY (FK_Urzadzenie) REFERENCES Urzadzenie(ID),
	FOREIGN KEY (FK_Czas) REFERENCES Czas(ID),
	FOREIGN KEY (FK_Salon) REFERENCES Salon(ID),
	FOREIGN KEY (FK_Pracownik) REFERENCES Pracownik(ID),
	FOREIGN KEY (FK_Usluga) REFERENCES Usluga(ID),
	FOREIGN KEY (FK_Relacja) REFERENCES Relacja(ID),
	FOREIGN KEY (FK_Klient) REFERENCES Klient(ID)
);

