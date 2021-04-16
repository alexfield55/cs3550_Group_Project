-- 1
SELECT class.classID FROM class
INNER JOIN section ON section.sectionID = class.classID
INNER JOIN student_section ON student_section.sectionID = section.sectionID
INNER JOIN student ON student.studentID = student_section.studentID
WHERE student.studentID = 10 -- CHANGE THIS!!!

-- 2
SELECT class.classID FROM class
INNER JOIN section ON section.sectionID = class.classID
INNER JOIN student_section ON student_section.sectionID = section.sectionID
INNER JOIN student ON student.studentID = student_section.studentID
WHERE student.studentID = 10 AND student_section.semester = 'Spring 2020' -- CHANGE THIS!!!

-- 3
SELECT assignment.description, assignment_student.grade FROM assignment
INNER JOIN student_section ON student_section.sectionID = assignment.sectionID
INNER JOIN assignment_student ON assignment_student.studentID = student_section.studentID
INNER JOIN section ON section.sectionID = student_section.sectionID
INNER JOIN class ON class.classID = section.classID
WHERE student_section.studentID = 5 AND class.classID = 2

-- 4
SELECT student.fname, student.lname from student
INNER JOIN student_section ON student_section.studentID = student.studentID
INNER JOIN section ON section.sectionID = student_section.sectionID
INNER JOIN class ON class.classID = section.classID
WHERE class.classID = 2

-- 5


-- 6

-- 7

-- 8

-- 9

-- 10