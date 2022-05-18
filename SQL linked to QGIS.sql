ALTER TABLE [Housing].[dbo].[pp-2019]
ADD ID INT IDENTITY;
ALTER TABLE [Housing].[dbo].[pp-2019]
ADD CONSTRAINT PK_Id PRIMARY KEY NONCLUSTERED (ID);
GO

ALTER TABLE [Housing].[dbo].[NSPL_NOV_2019_UK_M]
ADD [GeoLocation] GEOGRAPHY

UPDATE [Housing].[dbo].[NSPL_NOV_2019_UK_M]
SET [GeoLocation] = geography::Point(lat, long, 4326)
WHERE [long] IS NOT NULL
AND [lat] IS NOT NULL
AND CAST(lat AS decimal(10, 6)) BETWEEN -90 AND 90
AND CAST(long AS decimal(10, 6)) BETWEEN -90 AND 90

SELECT p.*,m.*
 FROM [Housing].[dbo].[pp-2019] p
 INNER JOIN [Housing].[dbo].[NSPL_NOV_2019_UK_M] m 
 ON p.[Postcode]= m.[pcd]

 OR

 SELECT p.*,m.*
 FROM [Housing].[dbo].[pp-2019] p
 INNER JOIN [Housing].[dbo].[NSPL_NOV_2019_UK_M] m 
 ON REPLACE(p.[Postcode],' ','')= REPLACE(m.[pcd], ' ','')

 --View 1
CREATE View Housing_M_Postcodes
WITH SCHEMABINDING
AS
SELECT p.[ID],m.[GeoLocation],p.[Price],p.[Postcode]
FROM [dbo].[pp-2019] p
INNER JOIN [dbo].[NSPL_NOV_2019_UK_M] m 
ON REPLACE(p.[Postcode],' ','')= REPLACE(m.[pcd], ' ','')
--View 2
CREATE View Housing_M_Postcodes_Detached
WITH SCHEMABINDING
AS
SELECT p.[ID],m.[GeoLocation],p.[Price],p.[Postcode]
FROM [dbo].[pp-2019] p
INNER JOIN [dbo].[NSPL_NOV_2019_UK_M] m 
ON REPLACE(p.[Postcode],' ','')= REPLACE(m.[pcd], ' ','')
WHERE [Property_type] = 'D'
--View 3
CREATE View Housing_M_Postcodes_Semi_Detached
WITH SCHEMABINDING
AS
SELECT p.[ID],m.[GeoLocation],p.[Price],p.[Postcode]
FROM [dbo].[pp-2019] p
INNER JOIN [dbo].[NSPL_NOV_2019_UK_M] m 
ON REPLACE(p.[Postcode],' ','')= REPLACE(m.[pcd], ' ','')
WHERE [Property_type] = 'S'

--View 4
CREATE View Housing_M_Postcodes_Terraced
WITH SCHEMABINDING
AS
SELECT p.[ID],m.[GeoLocation],p.[Price],p.[Postcode]
FROM [dbo].[pp-2019] p
INNER JOIN [dbo].[NSPL_NOV_2019_UK_M] m 
ON REPLACE(p.[Postcode],' ','')= REPLACE(m.[pcd], ' ','')
WHERE [Property_type] = 'T'
--View 5
CREATE View Housing_M_Postcodes_Flats_Maisonettes
WITH SCHEMABINDING
AS
SELECT p.[ID],m.[GeoLocation],p.[Price],p.[Postcode]
FROM [dbo].[pp-2019] p
INNER JOIN [dbo].[NSPL_NOV_2019_UK_M] m 
ON REPLACE(p.[Postcode],' ','')= REPLACE(m.[pcd], ' ','')
WHERE [Property_type] = 'F'----Create indexes for all the newly created Views
CREATE UNIQUE CLUSTERED INDEX idx_id ON Housing_M_Postcodes(ID)
GO
CREATE UNIQUE CLUSTERED INDEX idx_id ON Housing_M_Postcodes_Detached(ID)
GO
CREATE UNIQUE CLUSTERED INDEX idx_id ON Housing_M_Postcodes_Flats_Maisonettes(ID)
GO
CREATE UNIQUE CLUSTERED INDEX idx_id ON Housing_M_Postcodes_Semi_Detached(ID)
GO
CREATE UNIQUE CLUSTERED INDEX idx_id ON Housing_M_Postcodes_Terraced(ID)