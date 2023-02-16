-- ODS and DWH database creation --

-- CREATE DATABASE ODS;
-- CREATE DATABASE DWH;

-- ODS database object BNLC creation to collect data
CREATE TABLE ODS.dbo.BNLC (
	id_lieu VARCHAR(MAX),
	id_local VARCHAR(MAX),
	nom_lieu VARCHAR(MAX),
	ad_lieu VARCHAR(MAX),
	com_lieu VARCHAR(MAX),
	insee VARCHAR(MAX),
	type_place VARCHAR(MAX),
	date_maj VARCHAR(MAX),
	ouvert VARCHAR(MAX),
	source VARCHAR(MAX),
	Xlong VARCHAR(MAX),
	Ylat VARCHAR(MAX),
	nbre_pl VARCHAR(MAX),
	nbre_pmr VARCHAR(MAX),
	duree VARCHAR(MAX),
	horaire VARCHAR(MAX),
	proprio VARCHAR(MAX),
	lumiere VARCHAR(MAX),
	comm VARCHAR(MAX)
);

-- Empty the table -- 
TRUNCATE TABLE ODS.dbo.BNLC

BULK INSERT ODS.dbo.BNLC
FROM 'C:\Users\omicr\Documents\database\database\BNLC.csv'
WITH (
	FORMAT = 'csv',
    FIRSTROW = 2,
	KEEPNULLS,
    FIELDTERMINATOR = ';', 
    FIELDQUOTE='"',
    ROWTERMINATOR='\n'
);




/*
DELETE FROM DWH.dbo.VILLE
DBCC CHECKIDENT (DWH.dbo.VILLE, RESEED, 0)

--TRUNCATE TABLE DWH.dbo.VILLE;
INSERT INTO DWH.dbo.VILLE
SELECT DISTINCT insee,
CASE
	WHEN insee = '03185'
	THEN 'MONTLUCON'
	ELSE com_lieu
END
FROM ODS.dbo.BNLC
*/



