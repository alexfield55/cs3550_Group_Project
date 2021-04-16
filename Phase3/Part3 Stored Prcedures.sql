--1. 
Create Procedure AllAssignments @teachID int
AS
SELECT Assignment.* FROM Assignment 
	JOIN Section ON Assignment.sectionID = Section.SectionID
	WHERE teacherID = @teachID AND dueDate = WEEK(GETDATE())
	ORDER BY dueDate;
GO

--2. Finding all teachers names for a particular class
Create Procedure AllSections @classID int
AS
SELECT Teacher.fname, Teacher.lname, Teacher.teacherID FROM Teacher 
	JOIN Section ON Teacher.teacherID = Section.teacherID
	WHERE classID = @classID
	ORDER BY Teacher.teacherID;
GO

--3. Finding all sections for a given department 
CREATE PROCEDURE AllSections @deptNum int
AS
SELECT Section.* FROM section 
	JOIN Class ON Section.ClassID = Class.classID
	WHERE deptNum = @deptNum
	ORDER BY sectionID;