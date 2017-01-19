--1. Indiquer le CompanyName de James D. Kramer
SELECT CompanyName FROM SalesLT.Customer WHERE LastName = 'Kramer'

--2. Indiquer toutes les adresses pour  'Modular Cycle Systems'
SELECT * 
FROM SalesLT.Customer
	INNER JOIN SalesLT.CustomerAddress ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
	INNER JOIN SalesLT.Address ON SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID
WHERE CompanyName = 'Modular Cycle Systems'

--3. Lister OrdeQty, Name, ListPrice pour la commande passée par le CustomerID 30102 (edited)
SELECT OrderQty, Name, ListPrice 
FROM SalesLT.SalesOrderHeader
	INNER JOIN SalesLT.SalesOrderDetail ON SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID
	INNER JOIN SalesLT.Product ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID
WHERE CustomerID = '30102'

--4. Donner les CompanyName des clients ayant des commandes à plus de 100000$
SELECT CompanyName
FROM SalesLT.Customer
	INNER JOIN SalesLT.SalesOrderHeader ON SalesLT.SalesOrderHeader.CustomerID = SalesLT.Customer.CustomerID
WHERE TotalDue > '100000'

--6. On appelle "Commande unitaire" une commande ne contenant qu'un seul objet. Donner les SalesOrderID et les UnitPrice de chaque commande unitaire
SELECT DISTINCT SalesOrderID, UnitPrice
FROM SalesLT.SalesOrderDetail
GROUP BY SalesOrderID, UnitPrice
HAVING SUM(OrderQty) = 1

--7. Où vont les chaussettes de courses ? Donner la liste des noms des produits 
--   et des CompanyName aini que des Customers qui ont commandé le ProductModel 'Racing Socks'
SELECT SalesLT.Product.Name, SalesLT.Customer.CompanyName, SalesLT.Customer.FirstName, SalesLT.Customer.LastName 
FROM SalesLT.ProductModel
	INNER JOIN SalesLT.Product ON SalesLT.Product.ProductModelID = SalesLT.ProductModel.ProductModelID
	INNER JOIN SalesLT.SalesOrderDetail ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
	INNER JOIN SalesLT.SalesOrderHeader ON SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID
	INNER JOIN SalesLT.Customer ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID
WHERE SalesLT.ProductModel.Name = 'Racing Socks'

--8. Donner la description dans la culture 'fr' du produit avec le ProductId 736
SELECT Description
FROM SalesLT.Product
	INNER JOIN SalesLT.ProductModel ON SalesLT.ProductModel.ProductModelID = SalesLT.Product.ProductModelID
	INNER JOIN SalesLT.ProductModelProductDescription ON SalesLT.ProductModelProductDescription.ProductModelID = SalesLT.ProductModel.ProductModelID
	INNER JOIN SalesLT.ProductDescription ON SalesLT.ProductDescription.ProductDescriptionID = SalesLT.ProductModelProductDescription.ProductDescriptionID
WHERE ProductID = '736' AND Culture = 'fr'

--9. Utiliser la valeur de SubTotal de SaleOrderHeader pour classer les commandes par valeurs décroissante. 
--   Pour chaque commande indiquer le CompanyName, le SubTotal et le poid total de la commande
SELECT SubTotal
FROM SalesLT.SalesOrderHeader
ORDER BY SubTotal DESC

--10. Combien de produits de la catégorie 'Cranksets' ont été vendu à des adresses à Londres ?