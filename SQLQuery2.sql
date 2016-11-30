CREATE TABLE "Etudiant" (
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	mail VARCHAR(50) NOT NULL	

	PRIMARY KEY(mail)
);

CREATE TABLE "Promotion" (
	nom VARCHAR(50) NOT NULL,
	date_debut DATETIME,
	date_fin DATETIME

	PRIMARY KEY(nom)
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