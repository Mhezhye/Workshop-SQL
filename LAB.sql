--Option 1
SELECT GETDATE() AS CurrentDateTime,
CONVERT (DATE,GETDATE()) AS CurrentDate,
CONVERT (TIME,GETDATE()) AS CurrentTime,
DATEPART (YEAR,GETDATE()) AS CurrentYear,
DATEPART (MONTH,GETDATE()) AS CurrentMonth,
DATEPART (DAY,GETDATE()) AS CurrentDay;

--Option 2
SELECT GETDATE() AS CurrentDateTime,
CAST(GETDATE() AS DATE) AS CurrentDate,
CAST(GETDATE() AS TIME) AS CurrentTime,
YEAR(GETDATE()) AS CurrentYear,
MONTH(GETDATE()) AS CurrentMonth,
DAY(GETDATE()) AS CurrentDay

--Q2
SELECT FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE LEN(FirstName) > 10;
SELECT FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE PATINDEX('%@%',EmailAddress)>2;--PATINDEX returns the correct position of a string, if the pattern is not found, it comes out as zero
--Option 2
SELECT FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE EmailAddress LIKE 
'[a-z,0-9,_,-,.]%@[a-z,0-9,_,-]%.[a-z][a-z]%';
SELECT CustomerID,
OrderDate,
GETDATE() AS Today,
DATEDIFF(MONTH, OrderDate, GETDATE()) AS ElapsedMonths
FROM [AdventureWorks2014].[Sales].[SalesOrderHeader]

--Q2
SELECT CustomerID,
OrderDate,
DATENAME(MONTH, OrderDate) AS MonthName,
DATENAME(WEEKDAY, OrderDate) AS WeekDayName
FROM [AdventureWorks2014].[Sales].[SalesOrderHeader]
OrderDate,
DATEPART(YEAR, OrderDate) AS [Year],
DATEPART(MONTH, OrderDate) AS [Month],
DATEPART(DAY, OrderDate) AS [Day]
FROM [AdventureWorks2014].[Sales].[SalesOrderHeader]
ROUND(EndOfDayRate,0) AS EODR_Dollar,
ROUND(EndOfDayRate,2) AS EODR_Cent
FROM Sales.CurrencyRate
SUM(Quantity) AS Quantity,
SUM(ROUND(Quantity,-1)) as Q10,
SUM(ROUND(Quantity,-2)) as Q100
FROM Production.ProductInventory
GROUP BY ProductID