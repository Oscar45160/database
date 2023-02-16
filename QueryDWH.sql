
DROP TABLE DWH.dbo.LIEU
DROP TABLE DWH.dbo.TYPE_PLACE
DROP TABLE DWH.dbo.VILLE
DROP TABLE DWH.dbo.DATE
DROP TABLE DWH.dbo.SOURCE



CREATE TABLE DWH.dbo.TYPE_PLACE(
	type_place VARCHAR(50),
	CONSTRAINT pk_type_place PRIMARY KEY NONCLUSTERED (type_place)
);

CREATE TABLE DWH.dbo.VILLE(
	insee VARCHAR(50),
	CONSTRAINT pk_insee PRIMARY KEY NONCLUSTERED (insee),
	com_lieu VARCHAR(1000)
);

CREATE TABLE DWH.dbo.DATE(
	date_maj DATE,
	CONSTRAINT pk_date_maj PRIMARY KEY NONCLUSTERED (date_maj),
);

CREATE TABLE DWH.dbo.SOURCE(
	source INT,
	CONSTRAINT pk_source PRIMARY KEY NONCLUSTERED (source),
);

CREATE TABLE DWH.dbo.LIEU(
	id_lieu VARCHAR(11),
	CONSTRAINT pk_id_lieu PRIMARY KEY NONCLUSTERED (id_lieu),
	id_local VARCHAR(30),
	nom_lieu VARCHAR(100) NOT NULL,
	ad_lieu VARCHAR(1000),
	nbre_pl INT,
	nbre_pmr INT,
	lumiere BIT,
	horaire VARCHAR(20),
	duree INT,
	Xlong FLOAT,
	Ylat FLOAT,
	proprio VARCHAR(100),
	comm VARCHAR(1000),
	fk_type_place VARCHAR(50),
	fk_insee VARCHAR(50),
	fk_date_maj DATE,
	fk_source INT,
	CONSTRAINT type_place_fk FOREIGN KEY (fk_type_place)
		REFERENCES DWH.dbo.TYPE_PLACE (type_place),
	CONSTRAINT insee_fk FOREIGN KEY (fk_insee)
		REFERENCES DWH.dbo.VILLE (insee),
	CONSTRAINT date_maj_fk FOREIGN KEY (fk_date_maj)
		REFERENCES DWH.dbo.DATE (date_maj),
	CONSTRAINT source_fk FOREIGN KEY (fk_source)
		REFERENCES DWH.dbo.SOURCE (source)
);



INSERT INTO DWH.dbo.TYPE_PLACE
SELECT DISTINCT (type_place) FROM ODS.dbo.BNLC

INSERT INTO DWH.dbo.VILLE
SELECT DISTINCT insee, com_lieu FROM ODS.dbo.BNLC

INSERT INTO DWH.dbo.DATE
SELECT DISTINCT (date_maj) FROM ODS.dbo.BNLC

INSERT INTO DWH.dbo.SOURCE
SELECT DISTINCT (source) FROM ODS.dbo.BNLC

INSERT INTO DWH.dbo.LIEU
SELECT DISTINCT id_lieu, id_local, nom_lieu, ad_lieu, nbre_pl, nbre_pmr, lumiere, horaire, duree, Xlong, Ylat, proprio, comm, type_place, insee, date_maj, source FROM ODS.dbo.BNLC
