--SQLQuery0-CHECK PROCEDURES
SET DATEFIRST 1;
USE SPU_411_Import;
--SET LANGUAGE N'Russian';

EXEC sp_SelectScheduleFull;
--EXEC sp_SelectSchedule N'SPU_411', N'Процедурное%';

PRINT (dbo.GetNextDate(N'SPU_411'));