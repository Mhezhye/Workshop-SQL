USE master;
GO
CREATE DATABASE ADB2017_Demo;


USE ADB2017_Demo
GO
CREATE TABLE Employees
(
Empid INT NOT NULL IDENTITY,
Title NVARCHAR(30) NOT NULL,
Firstname NVARCHAR(10) NOT NULL,
Lastname NVARCHAR(20) NOT NULL,
Birthdate DATE NOT NULL,
Hiredate DATE NOT NULL,
Phone NVARCHAR(24) NOT NULL
);



USE ADB2017_Demo
GO
INSERT Employees(title, firstname, lastname, birthdate, hiredate, phone)
VALUES ('Mr','Mike','Lawrence','01-10-1990','01-01-2016', 07960606838),
('Mr','Simon','Carter','12-10-1978','01-02-2016', 07760896338),
('Mr','John','Smith','11-12-1980','01-04-2016', 07966336811),
('Mrs','Sara','Thompson','06-08-1990','01-03-2016', 07865406535)CREATE TRIGGER reminder4 
ON dbo.Employees
AFTER INSERT, UPDATE   
AS RAISERROR ('Notify Customer Relations', 16, 10); 
ROLLBACK TRANSACTION; 
GO USE ADB2017_Demo
GO
INSERT Employees(title, firstname, lastname, birthdate, hiredate, phone)
VALUES ('Miss','Jane','Colvin','07-04-1996','01-02-2016', 07456606765)