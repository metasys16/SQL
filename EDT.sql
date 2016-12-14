CREATE TABLE eleve (
	id INTEGER IDENTITY PRIMARY KEY NOT NULL,
	nom VARCHAR(255),
	prenom VARCHAR(255),
	mail VARCHAR(255)
);

CREATE TABLE promotion (
	id INTEGER IDENTITY PRIMARY KEY NOT NULL,
	nom VARCHAR(255),
	date_debut DATE,
	date_fin DATE,
	disponibilite TINYINT,
	id_eleve INT

	CONSTRAINT fk_promotionEleves
		FOREIGN KEY (id_eleve) REFERENCES eleve(id)
);

CREATE TABLE formation (
	id INTEGER IDENTITY PRIMARY KEY NOT NULL,
	nom VARCHAR(255),
	nb_heures_total FLOAT,
	id_promotion INT

	CONSTRAINT fk_formationPromotion
		FOREIGN KEY (id_promotion) REFERENCES promotion(id)
);

CREATE TABLE formateur (
	id INTEGER IDENTITY PRIMARY KEY NOT NULL,
	nom VARCHAR(255),
	prenom VARCHAR(255),
	mail VARCHAR(255),
	telephone VARCHAR(255)
);

CREATE TABLE matiere (
	id INTEGER IDENTITY PRIMARY KEY NOT NULL,
	nom VARCHAR(255),
	id_formation INT,
	id_formateur INT

	CONSTRAINT fk_matiereFormateur
		FOREIGN KEY (id_formateur) REFERENCES formateur(id),

	CONSTRAINT fk_matiereFormation
		FOREIGN KEY (id_formation) REFERENCES formation(id)
);

CREATE TABLE salle (
	id INTEGER IDENTITY PRIMARY KEY NOT NULL,
	nom VARCHAR(255),
	capacite INT
);

CREATE TABLE cours (
	id INTEGER IDENTITY PRIMARY KEY NOT NULL,
	date_debut DATE,
	date_fin DATE,
	id_promotion INT,
	id_formateur INT,
	id_matiere INT,
	id_salle INT

	CONSTRAINT fk_coursPromotion
		FOREIGN KEY (id_promotion) REFERENCES promotion(id),

	CONSTRAINT fk_coursFormateur
		FOREIGN KEY (id_formateur) REFERENCES formateur(id),

	CONSTRAINT fk_coursMatiere
		FOREIGN KEY (id_matiere) REFERENCES matiere(id),

	CONSTRAINT fk_coursSalle
		FOREIGN KEY (id_salle) REFERENCES salle(id)
);

CREATE TABLE absence (
	id_eleve INT,
	id_cours INT

	CONSTRAINT pk_absence
		PRIMARY KEY (id_eleve, id_cours),

	CONSTRAINT fk_absenceEleve
		FOREIGN KEY (id_eleve) REFERENCES eleve(id),

	CONSTRAINT fk_absenceCours
		FOREIGN KEY (id_cours) REFERENCES cours(id)
	
);

CREATE TABLE emploiDuTemps (
	id INTEGER IDENTITY PRIMARY KEY NOT NULL,
	date_debut DATE,
	date_fin DATE
);