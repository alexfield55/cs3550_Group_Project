--1. 
Create Procedure AllAssignments @teachID int
AS
SELECT Assignment.* FROM Assignment 
	JOIN Section ON Assignment.sectionID = Section.SectionID
	WHERE teacherID = @teachID AND DATEPART(WEEK, due_date) = DATEPART(WEEK, GETDATE())
	ORDER BY due_date;
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
CREATE PROCEDURE AllSectionsByDept @deptID int
AS
SELECT Section.* FROM section 
	JOIN Class ON Section.ClassID = Class.classID
	WHERE deptID = @deptID
	ORDER BY sectionID;