DROP TABLE Formation;

CREATE TABLE "Formation" (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL,
	nb_heures_total FLOAT NOT NULL

	CONSTRAINT pk_formation
		PRIMARY KEY(id),
);

CREATE TABLE "Promotion" (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL,
	date_debut DATETIME,
	date_fin DATETIME,
	id_formation INTEGER UNIQUE NOT NULL,	

	CONSTRAINT pk_promotion
		PRIMARY KEY(id),

	CONSTRAINT fk_promotionFormation
		FOREIGN KEY(id_formation) REFERENCES Formation(id)
);

CREATE TABLE "Etudiant" (
	id INTEGER UNIQUE NOT NULL,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	mail VARCHAR(50) UNIQUE NOT NULL,
	id_promotion INTEGER UNIQUE NOT NULL,	
	
	CONSTRAINT pk_etudiant
		PRIMARY KEY(id),

	CONSTRAINT fk_etudiantPromotion
		FOREIGN KEY(id_promotion) REFERENCES Promotion(id)
);


CREATE TABLE "Formateur" (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	mail VARCHAR(50) NOT NULL,
	tel CHAR(10)

	CONSTRAINT pk_formateur
		PRIMARY KEY(id)
);

CREATE TABLE "Matiere" (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL

	CONSTRAINT pk_matiere
		PRIMARY KEY(id)
);

CREATE TABLE "Salle" (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL,
	capacite INT 

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

CREATE TABLE "Session" (
	id INTEGER NOT NULL,
	date_debut DATETIME,
	date_fin DATETIME,
	id_salle INTEGER NOT NULL,
	id_formateur INTEGER NOT NULL,
	id_promotion INTEGER NOT NULL,
	id_matiere INTEGER NOT NULL

	CONSTRAINT pk_session	
		PRIMARY KEY(id)

	CONSTRAINT fk_salle
		FOREIGN KEY(id_salle) REFERENCES Salle(id),

	CONSTRAINT fk_formateur
		FOREIGN KEY(id_formateur) REFERENCES Formateur(id),

	CONSTRAINT fk_promotion
		FOREIGN KEY(id_promotion) REFERENCES Promotion(id),

	CONSTRAINT fk_matiere
		FOREIGN KEY(id_matiere) REFERENCES Matiere(id),

);


CREATE TABLE "Absence" (

	id_etudiant INTEGER NOT NULL,
	id_session INTEGER NOT NULL,

	CONSTRAINT pk_Absence
		PRIMARY KEY(id_etudiant, id_session),

	CONSTRAINT fk_etudiant
		FOREIGN KEY(id_etudiant) REFERENCES Etudiant(id),

	CONSTRAINT fk_session
		FOREIGN KEY(id_session) REFERENCES "Session"(id)
);

--CREATE TABLE "EmploiDuTemps" (); Pas besoin d'enregistrer notre emploi du temps dans la base, c'est un Objet qu'on va se servir tout le temps. On fera peut etre un .pdf à enregistrer sur serveur
