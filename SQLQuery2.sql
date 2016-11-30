CREATE TABLE "Etudiant" (
	id INTEGER UNIQUE NOT NULL,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	mail VARCHAR(50) UNIQUE NOT NULL,
	id_promotion INTEGER NOT NULL,	
	
	CONSTRAINT pk_etudiant
		PRIMARY KEY(id),

	CONSTRAINT fk_etudiantPromotion
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

	CONSTRAINT fk_promotionFormation
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

CREATE TABLE "Formation_matiere" (
	id_formation INTEGER NOT NULL,
	id_matiere INTEGER NOT NULL,

	CONSTRAINT pk_formationMatiere
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
	date_fin DATETIME,
	nom_salle VARCHAR(50) NOT NULL,
	nom_formateur VARCHAR(50) NOT NULL,
	id_promotion INTEGER NOT NULL,
	id_matiere INTEGER NOT NULL

	CONSTRAINT pk_session	
		PRIMARY KEY(id)

	CONSTRAINT fk_salle
		FOREIGN KEY(nom_salle) REFERENCES Salle(nom),

	CONSTRAINT fk_formateur
		FOREIGN KEY(nom_formateur) REFERENCES Formateur(nom),

	CONSTRAINT fk_promotion
		FOREIGN KEY(id_promotion) REFERENCES Promotion(id),

	CONSTRAINT fk_matiere
		FOREIGN KEY(id_matiere) REFERENCES Matiere(id),

);

CREATE TABLE "EmploiDuTemps" (
	id INTEGER NOT NULL,
	date_debut DATETIME,
	date_fin DATETIME,
	id_session INTEGER NOT NULL

	CONSTRAINT pk_emploiDuTemps
		PRIMARY KEY(id)

	CONSTRAINT fk_emploiDuTemps
		FOREIGN KEY(id_session) REFERENCES "Session"(id),
);

--CREATE TABLE "Absence" ();