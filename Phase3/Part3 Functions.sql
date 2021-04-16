--1. 
CREATE FUNCTION num_students_missed_two_or_more
(@secID int)
RETURNS int
AS
BEGIN 
	DECLARE @retnum int;
	SET @retnum = (SELECT COUNT(*) FROM assignment JOIN assignment_student ON assignment.assignmentID = assignment_student.assignment_studentID 
		WHERE sectionID = @secID AND submissionDate IS NULL)

	RETURN @retnum;
END
GO
--2. Counting number of secions a class has 
CREATE FUNCTION num_section_by_class
(@classID int) 
RETURNS int 
AS
BEGIN 
	DECLARE @retnum int;
	SET @retnum = (SELECT COUNT(*) FROM section WHERE classID = @classID);
	RETURN @retnum;
END