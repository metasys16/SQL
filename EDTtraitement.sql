USE EDT;
GO

INSERT INTO eleve VALUES('Pierre','GPL','Pusspuss@gmail.com');
SELECT * FROM eleve;
-- Selectionner un eleve en fonction de son ID
SELECT * FROM eleve WHERE id=eleve.id;


INSERT INTO promotion(nom, date_debut, date_fin, id_eleve) VALUES('Appolo','20160901','20171030',1);

-- Selectionner une promotion en fonction de son nom 


