CREATE TABLE produit (
	id INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL,
	code CHAR(5) UNIQUE NOT NULL,

	CONSTRAINT pk_produit
		PRIMARY KEY(id)
);

CREATE TABLE categorie (
	id INTEGER NOT NULL,
	libelle VARCHAR(50) NOT NULL,
	id_produit INTEGER UNIQUE NOT NULL,

	CONSTRAINT pk_produit
		PRIMARY KEY(id),
	CONSTRAINT fk_produitCategorie
		FOREIGN KEY (id_produit) REFERENCES produit(id)
);