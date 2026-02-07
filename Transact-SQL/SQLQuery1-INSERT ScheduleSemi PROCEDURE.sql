--SQLQuery1-INSERT ScheduleSemi PROCEDURE.sql
USE SPU_411_Import;
GO

CREATE PROCEDURE sp_InsertScheduleSemistacionar
		 @group_name		AS		NVARCHAR(24)
		,@discipline_name	AS		NVARCHAR(150)
		,@teacher			AS		NVARCHAR(50)
AS
BEGIN
	DECLARE @group_id			AS	INT		=	(SELECT group_id		FROM Groups		 WHERE group_name=@group_name);
	DECLARE @discipline_id		AS	SMALLINT=	(SELECT discipline_id	FROM Disciplines WHERE discipline_name LIKE @discipline_name);
	DECLARE @teacher_id			AS	SMALLINT=	(SELECT teacher_id		FROM Teachers	 WHERE last_name = @teacher);
	--DECLARE @start_date		AS	DATE	=	???;
	DECLARE @date				AS	DATE	=	dbo.GetLastDate(@group_name);
	DECLARE @start_time			AS	TIME	=	(SELECT start_time		FROM Groups		 WHERE group_id=@group_id);
	DECLARE @number_of_lessons	AS	TINYINT	=	(SELECT number_of_lessons	FROM Disciplines WHERE discipline_id=@discipline_id);
	DECLARE @lesson_number		AS	TINYINT	=	1;

	WHILE @lesson_number <= @number_of_lessons
	BEGIN
		SET @date	= dbo.GetNextDate(@group_name);
		SET @time	= @start_time;
		EXEC sp_InsertLesson @group_id, @discipline_id, @teacher_id, @date, @start_time, @lesson_number;
		SET @time = DATEADD(MINUTE, 95,@time);




END