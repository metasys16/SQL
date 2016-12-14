USE EDT;
GO

INSERT INTO eleve VALUES('Erwan','Raulo','Raulo@gmail.com');
SELECT * FROM eleve;
-- Selectionner un eleve en fonction de son ID
SELECT * FROM eleve WHERE id=eleve.id;

INSERT INTO promotion(nom, date_debut, date_fin, id_eleve) VALUES('Appolo','20160901','20171030',6);
-- Selectionner une promotion en fonction de son nom ex : 'Appolo' 
SELECT * FROM promotion WHERE nom = 'Appolo';

INSERT INTO formation(nom, nb_heures_total, id_promotion) VALUES('Concepteur',768,1);
-- Selectionner la formation suivie par un nom de promotion
SELECT * FROM formation
	INNER JOIN promotion ON id_promotion = promotion.id
WHERE promotion.nom = 'Appolo';

-- Compter le nombre d'eleves d'une promotion qui suivent une formation
SELECT formation.nom AS 'Formation', promotion.nom AS 'Promotion', COUNT(eleve.id) AS 'Nombre d eleves inscrits' FROM formation
	INNER JOIN promotion ON id_promotion = promotion.id
	INNER JOIN eleve ON id_eleve = promotion.id
WHERE formation.nom = 'Concepteur'
GROUP BY formation.nom , promotion.nom;


