?--SQLQuery2-SELECT COUNT Disciplines OF Directions

USE SPU_411_Import;

--SELECT
--			[N'Направление']	=	direction_name,
--			[N'Дисциплина']		=	COUNT(discipline_name)
--FROM		Disciplines, Directions, DisciplinesDirectionsRelation
--WHERE		discipline			=		discipline_id
--AND			direction		=		direction_id
--GROUP BY	direction_name
--;

--SELECT * FROM Disciplines;

--SELECT
--			[Направление]	=	direction_name,
--			[Дисциплина]	=	discipline_name
--FROM		Disciplines, Directions, DisciplinesDirectionsRelation
--WHERE		direction	=	direction_id
--AND		discipline	=	discipline_id 
--AND		discipline_name    LIKE N'Системное%' 

--ORDER BY	direction_name
--;

SELECT
			[Направление]	=	direction_name,
			[Дисциплина]	=	discipline_name
FROM		Disciplines, Directions, DisciplinesDirectionsRelation
WHERE		discipline	=	discipline_id
--AND		direction	=	direction_id 
AND		discipline_name    LIKE N'Теория баз%'

ORDER BY	direction_name
;