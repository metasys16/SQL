--1. Indiquer le CompanyName de James D. Kramer
SELECT CompanyName FROM SalesLT.Customer WHERE LastName = 'Kramer'

--2. Indiquer toutes les adresses pour  'Modular Cycle Systems'
SELECT * FROM SalesLT.Customer
INNER JOIN SalesLT.CustomerAddress ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
INNER JOIN SalesLT.Address ON SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID
WHERE CompanyName = 'Modular Cycle Systems'

--3. Lister OrdeQty, Name, ListPrice pour la commande passée par le CustomerID 30102 (edited)


--4. Donner les CompanyName des clients ayant des commandes à plus de 100000$

