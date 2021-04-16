--1.
CREATE TRIGGER trigger_update_final_score
ON assignment_student
AFTER UPDATE
AS
BEGIN
	DECLARE @studID int;
	DECLARE @secID int;
	DECLARE @startScore decimal;
	SET @studID = (SELECT studentID FROM deleted);
	SET @secID = (SELECT sectionID FROM deleted JOIN assignment ON deleted.assignment_studentID = assignment.assignmentID);
	SET @startScore = (SELECT score FROM student_section WHERE studentID = @studID AND sectionID = @secID)

	UPDATE student_section
		SET score = @startScore + (SELECT grade FROM inserted)
		WHERE studentID = @studID AND sectionID = @secID;
END