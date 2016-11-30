CREATE TABLE "Etudiant" (
	id INTEGER UNIQUE NOT NULL,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	mail VARCHAR(50) UNIQUE NOT NULL,
	id_promotion INTEGER NOT NULL,	
	
	CONSTRAINT pk_etudiant
		PRIMARY KEY(id),

	CONSTRAINT fk_etudiant_promotion
		FOREIGN KEY(id_promotion) REFERENCES Promotion(id)
);

CREATE TABLE "Promotion" (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL,
	date_debut DATETIME,
	date_fin DATETIME

	PRIMARY KEY(id)
);

CREATE TABLE "Formateur" (
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	mail VARCHAR(50) NOT NULL,
	tel CHAR(10)

	PRIMARY KEY(mail,tel)
);

CREATE TABLE "Formation" (
	nom VARCHAR(50) NOT NULL,
	nb_heures_total FLOAT NOT NULL

	PRIMARY KEY(nom)
);

CREATE TABLE "Matiere" (
	nom VARCHAR(50) NOT NULL

	PRIMARY KEY(nom)
);

CREATE TABLE "Salle" (
	nom VARCHAR(50) NOT NULL,
	capacite INT 

	PRIMARY KEY(nom)
);

CREATE TABLE "Session" (
	id INTEGER NOT NULL,
	date_debut DATETIME,
	date_fin DATETIME
	
	PRIMARY KEY(id)
);

CREATE TABLE "EmploiDuTemps" (
	id INTEGER NOT NULL,
	date_debut DATETIME,
	date_fin DATETIME

	PRIMARY KEY(id)
);

--CREATE TABLE "Absence" ();