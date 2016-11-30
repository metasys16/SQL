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
	date_fin DATETIME,
	id_formation INTEGER NOT NULL,	

	CONSTRAINT pk_promotion
		PRIMARY KEY(id),

	CONSTRAINT fk_promotion_formation
		FOREIGN KEY(id_formation) REFERENCES Formation(id)
);

CREATE TABLE "Formateur" (
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	mail VARCHAR(50) NOT NULL,
	tel CHAR(10)

	CONSTRAINT pk_formateur
		PRIMARY KEY(nom, mail)
);

CREATE TABLE "Formation" (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL,
	nb_heures_total FLOAT NOT NULL

	CONSTRAINT pk_formation
		PRIMARY KEY(id)
);

CREATE TABLE "Matiere" (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL

	CONSTRAINT pk_matiere
		PRIMARY KEY(id)
);

CREATE TABLE "Formation_Matiere" (
	id_formation INTEGER NOT NULL,
	id_matiere INTEGER NOT NULL,

	CONSTRAINT pk_formation_matiere
		PRIMARY KEY(id_formation, id_matiere),

	CONSTRAINT fk_formation
		FOREIGN KEY(id_formation) REFERENCES Formation(id),

	CONSTRAINT fk_matiere
		FOREIGN KEY(id_matiere) REFERENCES Matiere(id)
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

	CONSTRAINT pk_session	
		PRIMARY KEY(id)
);

CREATE TABLE "EmploiDuTemps" (
	id INTEGER NOT NULL,
	date_debut DATETIME,
	date_fin DATETIME

	CONSTRAINT pk_EmploiDuTemps
		PRIMARY KEY(id)
);

--CREATE TABLE "Absence" ();