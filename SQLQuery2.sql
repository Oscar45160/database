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

TRUNCATE TABLE ODS.dbo.BNLC

BULK INSERT ODS.dbo.BNLC
FROM 'C:\Users\omicr\Documents\database\database\BNLC.csv'
WITH (
	FORMAT = 'csv',
    FIRSTROW = 2
);
