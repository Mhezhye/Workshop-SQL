--Renaming a Column
SELECT [CustomerID] AS CID
 ,[Title]
 ,[FirstName]
 ,[MiddleName]
 ,[LastName]
 ,[EmailAddress] as Email
 ,[Phone] as Land_Line
FROM [AdventureWorksLT2012].[SalesLT].[Customer]--Q1SELECT [FirstName]      ,[LastName]	  ,[EmailAddress] AS EmailFROM [SalesLT].[Customer]-- Building a Column from an ExpressionSELECT [CustomerID]
 ,[FirstName] + ' ' + [LastName] AS Full_Name
 ,[EmailAddress]
 ,[Phone]
FROM [AdventureWorksLT2012].[SalesLT].[Customer]--Negating a Search ConditionSELECT *
FROM [AdventureWorksLT2012].[SalesLT].[Customer]
WHERE NOT (Title = 'Ms.' OR Title = 'Mrs.')SELECT *
FROM [AdventureWorksLT2012].[SalesLT].[Customer]
WHERE Title <> 'Ms.' AND Title <> 'Mrs.'--Checking for NULL ValuesSELECT [ProductID]
 ,[Name]
 ,[Color]
 ,[StandardCost]
 ,[ListPrice]
 ,[Size]
 ,[Weight]
FROM [AdventureWorksLT2012].[SalesLT].[Product]
WHERE [Weight] IS NULL;SELECT [ProductID]
 ,[Name]
 ,[Color]
 ,[StandardCost]
 ,[ListPrice]
 ,[Size]
 ,[Weight]
FROM [AdventureWorksLT2012].[SalesLT].[Product]
WHERE [Weight] IS NOT NULL;-- Sorting Your ResultsSELECT [ProductID]
 ,[Name]
 ,[Color]
 ,[StandardCost]
 ,[ListPrice]
 ,[Size]
 ,[Weight]
FROM [AdventureWorksLT2012].[SalesLT].[Product]
ORDER By [ProductID]SELECT [ProductID]
 ,[Name]
 ,[StandardCost]
 ,[ListPrice]
 ,[Size]
 ,[Weight]
FROM [AdventureWorksLT2012].[SalesLT].[Product]
ORDER By [Color]--you can also order by an attribute not returned in the query-- Paging Through A Result SetSELECT [ProductID]
 ,[Name]
 ,[Color]
 ,[StandardCost]
 ,[ListPrice]
 ,[Size]
 ,[Weight]
FROM [AdventureWorksLT2012].[SalesLT].[Product]
ORDER By [ProductID]
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;--Changing the offset from 0 to 8  and 10 t0 20 will fetch 20 rows. The offset will skip the first eight rows. 
SELECT [ProductID]
 ,[Name]
 ,[Color]
 ,[StandardCost]
 ,[ListPrice]
 ,[Size]
 ,[Weight]
FROM [AdventureWorksLT2012].[SalesLT].[Product]
ORDER By [ProductID]
OFFSET 8 ROWS FETCH NEXT 20 ROWS ONLY;-- Declaring Variables--char (10) must be 10, character length is fixed--varchar(10) may be less than or equal to 10 characters but accepts charaters in 1byte(limited)--nchar(10) character length is fixed but uses more bytes to install characters and can install special characters--nvarchar(10) may be less than orequal to 10 but uses more bytes to install characters and can install special characters