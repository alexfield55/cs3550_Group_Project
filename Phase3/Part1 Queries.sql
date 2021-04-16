-- 1
SELECT class.classID FROM class
INNER JOIN section ON section.sectionID = class.classID
INNER JOIN student_section ON student_section.sectionID = section.sectionID
INNER JOIN student ON student.studentID = student_section.studentID
WHERE student.studentID = 10

-- 2
SELECT class.classID FROM class
INNER JOIN section ON section.sectionID = class.classID
INNER JOIN student_section ON student_section.sectionID = section.sectionID
INNER JOIN student ON student.studentID = student_section.studentID
WHERE student.studentID = 10 AND student_section.semester = 'Spring 2020'

-- 3
SELECT assignment.description, assignment_student.grade FROM assignment
INNER JOIN student_section ON student_section.sectionID = assignment.sectionID
INNER JOIN assignment_student ON assignment_student.studentID = student_section.studentID
INNER JOIN section ON section.sectionID = student_section.sectionID
INNER JOIN class ON class.classID = section.classID
WHERE student_section.studentID = 5 AND class.classID = 2
ORDER BY assignment.due_date

-- 4
SELECT student.fname, student.lname FROM student
INNER JOIN student_section ON student_section.studentID = student.studentID
INNER JOIN section ON section.sectionID = student_section.sectionID
INNER JOIN class ON class.classID = section.classID
WHERE class.classID = 2

-- 5
SELECT student.fname, student.lname FROM student
INNER JOIN student_section ON student_section.studentID = student.studentID
INNER JOIN section ON section.sectionID = student_section.sectionID
INNER JOIN teacher ON teacher.teacherID = section.teacherID
WHERE teacher.teacherID = 2
ORDER BY student.lname

-- 6
SELECT assignment.description, AVG(assignment_student.grade) AS average_score FROM assignment_student
INNER JOIN student ON student.studentID = assignment_student.studentID
INNER JOIN student_section ON student_section.studentID = student.studentID
INNER JOIN assignment ON assignment.sectionID = student_section.sectionID
WHERE assignment.sectionID = 3

-- 7
--How many classes have more than one section, ordered by most classes
SELECT class.name, count(section.sectionID) AS num_sections FROM class
INNER JOIN section ON class.classID = section.classID
WHERE count(section.sectionID) > 1
ORDER BY count(section.sectionID) DESC

-- 8
--Find all classes that a teacher is teaching
SELECT class.name, description, section.sectionID, teacher.fname, teacher.lname FROM class,
INNER JOIN section on class.classID = section.classID
INNER JOIN teacher on teacher.sectionID = sectionID
WHERE teacher.fname = "John" and teacher.lname = "Doe"

-- 9
--find all announcements for a certain class
select class.name, section.sectionID, announcements.title, announcments.text FROM class
INNER JOIN section on class.classID = section.classID
INNER JOIN announcements on announcements.sectionID = section.sectionID
WHERE class.name = "Adv Database"

-- 10
--Find all teachers in a particular department
select teacher.fname, teacher.lname, department.name, from teacher
INNER JOIN department on department.departmentID = teacher.departmentID
WHERE department.name = "Computer Science"