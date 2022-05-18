--Query 1
USE AdventureWorksLT2012;
SELECT *
FROM dbo.View_1

--Query 2
SELECT p.ProductID,p.Name,p.ProductNumber,c.Name
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS c
ON 
p.ProductCategoryID=c.ProductCategoryID
--the condition for inner joining two tables is that they must have a common column, one is the primary key and the other is a foriegn key

--Query 3
SELECT p.ProductID
,p.Name
,p.SellStartDate
,p.SellEndDate
,p.ProductNumber
,p.DiscontinuedDate
,c.name
,c.ModifiedDate
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS c 
ON
p.ProductCategoryID=c.ProductCategoryID--this is the condition for inner joining

--Query 4
SELECT p.ProductID
,p.Name
,p.SellStartDate
,p.SellEndDate
,p.ProductNumber
,p.DiscontinuedDate
,c.name
,c.ModifiedDate
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS c 
ON
p.ProductCategoryID=c.ProductCategoryID
WHERE c.name='Road Bikes';

--Query 5
SELECT p.ProductID
,p.Name
,p.SellStartDate
,p.SellEndDate
,p.ProductNumber
,p.DiscontinuedDate
,c.name
,c.ModifiedDate
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS c 
ON
p.ProductCategoryID=c.ProductCategoryID
WHERE c.name IN ('Mountain Bikes', 'Road Bikes' , 'Touring Bikes');

--Query 6
SELECT SalesOrderID, OrderDate, ShipDate, Status, SubTotal,
TaxAmt,Freight, TotalDue
FROM SalesLT.SalesOrderHeader;

--Query 7
SELECT o.SalesOrderID, o.OrderDate,o.ShipDate, o.Status, o.SubTotal,
o.TaxAmt,o.Freight, o.TotalDue, c.FirstName+ ' '+c.LastName AS Fullname, c.EmailAddress
FROM SalesLT.SalesOrderHeader AS o
INNER JOIN SalesLT.Customer AS c
ON
o.CustomerID= c.CustomerID;

--Query 8
SELECT c.*,o.*
FROM SalesLT.Customer AS c 
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS o 
ON 
c.CustomerID=o.CustomerID
WHERE o.CustomerID IS NULL;

--Query 9
SELECT ISNULL(c.Firstname,'')+ ' '+ISNULL(c.Lastname,'') AS Fullname,--ISNULL checks the value and return values if not null, if any part is null, it will return empty string
c.CompanyName, c.EmailAddress, o.SalesOrderID, o.OrderDate, o.TotalDue
FROM SalesLT.Customer AS c
INNER  JOIN SalesLT.SalesOrderHeader AS o
ON 
c.CustomerID=o.CustomerID
WHERE o.OrderDate >= '01-01-2004'
ORDER BY o.TotalDue DESC

--Query 10
SELECT DISTINCT p.ProductNumber
FROM SalesLT.SalesOrderHeader AS o
INNER JOIN SalesLT.SalesOrderDetail AS d 
ON o.SalesOrderID=d.SalesOrderID
INNER JOIN SalesLT.Product AS p 
ON d.ProductID=p.ProductID

--Query 11
SELECT ISNULL(c.FirstName,'')+' '+ISNULL(c.LastName,'')  AS Fullname,
c.CompanyName, c.EmailAddress, a.CountryRegion
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.CustomerAddress AS ca
ON
c.CustomerID=ca.CustomerID
INNER JOIN SalesLT.Address AS a
ON
ca.AddressID=a.AddressID
WHERE a.CountryRegion= 'United Kingdom';

--Query 12
SELECT ISNULL(c.FirstName,'')+' '+ISNULL(c.LastName,'')  AS Fullname,
c.CompanyName, c.EmailAddress, concat(a.AddressLine1+'-'+a.AddressLine2,+' '+a.City+' '+a.PostalCode+' '
+a.StateProvince+' '+a.CountryRegion) AS FullAddress
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.CustomerAddress AS ca
ON
c.CustomerID= ca.CustomerID
INNER JOIN SalesLT.Address AS a
ON
ca.AddressID=a.AddressID
--PART 3
--Query 13
SELECT MAX(OrderDate) FROM SalesLT.SalesOrderHeader
--Query 14
SELECT SalesOrderID
,OrderDate
,ShipDate
,Status
,SubTotal
,TaxAmt
,Freight
,TotalDue
FROM SalesLT.SalesOrderHeader
WHERE OrderDate =(SELECT MAX(OrderDate) FROM SalesLT.SalesOrderHeader);

--Query 15
SELECT SalesOrderID
,OrderDate
,ShipDate
,Status
,SubTotal
,TaxAmt
,Freight
,TotalDue
FROM SalesLT.SalesOrderHeader
WHERE OrderDate =(SELECT MIN(OrderDate) FROM SalesLT.SalesOrderHeader);

--Query 16
SELECT ProductID,Name,ProductNumber
FROM SalesLT.Product
WHERE ProductID IN (SELECT DISTINCT ProductID 
FROM SalesLT.SalesOrderDetail
WHERE OrderQty >10)

--Query 17
SELECT ProductID,Name,ProductNumber
FROM SalesLT.Product
WHERE ProductID IN (SELECT DISTINCT ProductID 
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice >1000);

--Query 18
SELECT ISNULL(c.FirstName,'')+' '+ISNULL(c.LastName,'')  AS Fullname,
CompanyName, EmailAddress
FROM SalesLT.Customer AS c
WHERE EXISTS (SELECT 1
FROM SalesLT.SalesOrderHeader AS o
WHERE c.CustomerID=o.CustomerID)
--OR
SELECT ISNULL(c.FirstName,'')+' '+ISNULL(c.LastName,'')  AS Fullname,
CompanyName, EmailAddress
FROM SalesLT.Customer AS c
WHERE CustomerID IN (SELECT DISTINCT CustomerID
FROM SalesLT.SalesOrderHeader)

--Query 19
SELECT ISNULL(c.FirstName,'')+' '+ISNULL(c.LastName,'')  AS Fullname,
CompanyName, EmailAddress
FROM SalesLT.Customer AS c
WHERE NOT EXISTS (SELECT 1
FROM SalesLT.SalesOrderHeader AS o
WHERE c.CustomerID=o.CustomerID)
--OR
SELECT ISNULL(c.FirstName,'')+' '+ISNULL(c.LastName,'')  AS Fullname,
CompanyName, EmailAddress
FROM SalesLT.Customer AS c
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID
FROM SalesLT.SalesOrderHeader)

--Query 20
