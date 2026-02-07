--SQLQuery2-SelectScheduleForGroup CREATE PROCEDURE.sql
USE SPU_411_Import;
GO

ALTER PROCEDURE sp_SelectSchedule
	@group_name			AS NVARCHAR(24),
	@discipline_name	AS NVARCHAR(150)
	
	AS
	BEGIN
		DECLARE @group_id		AS INT			=	(SELECT group_id FROM Groups WHERE group_name=@group_name);
		DECLARE @discipline_id	AS SMALLINT		=	(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name)
		SELECT
				[Группа]			= group_name,
				[Дата]				= [date],
				[День недели]		= DATENAME(WEEKDAY, [date]),
				[Время]				= [time],
				[Дисциплина]		= discipline_name,
				[Преподаватель]		= FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
				[Статус]			= IIF(spent=1, N'Проведено', N'Запланировано')
		FROM	Schedule
		JOIN	Groups				ON	[group]=group_id
		JOIN	Disciplines			ON	discipline=discipline_id
		JOIN	Teachers			ON	teacher=teacher_id
		WHERE	group_name			=	@group_name
		AND		discipline_name		LIKE	@discipline_name
	END