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
WHERE LEN(FirstName) > 10;--Q3--Option 1
SELECT FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE PATINDEX('%@%',EmailAddress)>2;--PATINDEX returns the correct position of a string, if the pattern is not found, it comes out as zero
--Option 2
SELECT FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE EmailAddress LIKE 
'[a-z,0-9,_,-,.]%@[a-z,0-9,_,-]%.[a-z][a-z]%';--Q4SELECT SalesOrderID, OrderDate, TotalDueFROM SalesLT.SalesOrderHeaderWHERE DATEDIFF(d, OrderDate, GETDATE())<=7--d =day, y=year,m=month--PART 2
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
FROM [AdventureWorks2014].[Sales].[SalesOrderHeader]--Q3SELECT CustomerID,
OrderDate,
DATEPART(YEAR, OrderDate) AS [Year],
DATEPART(MONTH, OrderDate) AS [Month],
DATEPART(DAY, OrderDate) AS [Day]
FROM [AdventureWorks2014].[Sales].[SalesOrderHeader]--Q4SELECT EndOfDayRate,
ROUND(EndOfDayRate,0) AS EODR_Dollar,
ROUND(EndOfDayRate,2) AS EODR_Cent
FROM Sales.CurrencyRate--Option 2SELECT ProductID,
SUM(Quantity) AS Quantity,
SUM(ROUND(Quantity,-1)) as Q10,
SUM(ROUND(Quantity,-2)) as Q100
FROM Production.ProductInventory
GROUP BY ProductID--PART 3--Q2SELECT ProductID, Name, Color, Name + ISNULL(':'+ color,'') AS DescriptionFROM SalesLT.Product--Q3SELECT CAST(ProductID AS VARCHAR)+ ':'+Name AS IDNameFROM SalesLT.Product--Q4SELECT CompanyName, LEFT(CompanyName,10) AS [Company Name]FROM SalesLT.Customer--Option 2SELECT CompanyName, SUBSTRING(CompanyName,1,10) AS [Company Name]FROM SalesLT.Customer--Q5SELECT CompanyName, SUBSTRING(CompanyName, 10, 6) AS [Company Name]---10=is the xter from where you want to start showing, 6 is the number of xters you wantto displayFROM SalesLT.Customer--Q6SELECT UPPER(FirstName) AS FirstName,UPPER(LastName) AS LastNameFROM SalesLT.Customer--Q7SELECT SalesOrderID, OrderDate, SubTotal,ROUND(SubTotal,2) AS SubTotalFROM SalesLT.SalesOrderHeader--Q8SELECT SalesOrderID, OrderDate, SubTotal,ROUND(SubTotal,0) AS SubTotalFROM SalesLT.SalesOrderHeader--Q9SELECT CAST(RAND() * (100-1)+1 AS INT)--Q10SELECT SalesOrderID, OrderDate, ShipDate,DATEDIFF(d, OrderDate, ShipDate) AS NumberOfDaysFROM SalesLT.SalesOrderHeader--Q11SELECT SalesOrderID, Status,CAST(OrderDate AS Date) AS OrderDate2,CAST(ShipDate AS Date) AS ShipDate2FROM SalesLT.SalesOrderHeader--Q12SELECT SalesOrderID, OrderDate,YEAR(OrderDate) AS OrderYear,MONTH(OrderDate) AS OrderMonthFROM SalesLT.SalesOrderHeader--Q13SELECT SalesOrderID, OrderDate,DATEPART(yyyy,OrderDate) AS OrderYear,DATENAME(m,OrderDate) AS OrderMonth,DATENAME(weekday,OrderDate) AS OrderDayFROM SalesLT.SalesOrderHeader--Q14SELECT SalesOrderID, OrderDate,DATEADD(m,6,OrderDate) Plus6months--m(what i wan to add), 6(number of the 1st parameters i want to add), OrderDate(is the date)---Dateadd is used to add some values to different part of the dateFROM SalesLT.SalesOrderHeader--Q15SELECT SalesOrderID, OrderDateFROM SalesLT.SalesOrderHeaderWHERE YEAR(OrderDate)=2004--Q16SELECT CustomerID, FirstName, LastName, ModifiedDateFROM SalesLT.CustomerORDER BY YEAR(modifiedDate), MONTH(ModifiedDate)--Q17CREATE FUNCTION dbo.addTwoNumbers(@NumberOne INT, @NumberTwo INT)--name of table,column and data typeRETURNS INTASBEGINRETURN @NumberOne+@NumberTwoendSELECT dbo.addTwoNumbers(1,55)--Q18CREATE FUNCTION dbo.fnTrim(@Expression VARCHAR(250))RETURNS VARCHAR(250)ASBEGINRETURN LTRIM(RTRIM(@Expression))endSELECT dbo.fnTrim('I am a child of God   ')