create table section
(
    sectionID int not null,
    teacherID int not null,
    classID int not null,
    constraint prim_sectionID primary key (sectionID),
    constraint foreign_teacherID foreign key (teacherID) references teacher(teacherID),
    constraint foreign_classID foreign key (classID) references class(classID)
);

create table assignment
(
    --alex changed this a bit, basically copied it from a previous assignemnt
	assignmentID int not null,
	description varchar(50),
	due_date date not null, 
	max_possible_grade decimal,
	submission_type varchar(30),
    constraint foreign_sectionID foreign key(sectionID) references section(sectionID)
	constraint submission_names check (submission_type in ('Text Entry', 'Media Recording', 'File Upload', 'Website URL')),
	constraint max_grade check (max_possible_grade <= 100),
	constraint min_grade check (max_possible_grade >= 0),
	constraint prim_assignmentID primary key (assignmentID)

);

create table student_section
(
    sectionID int not null,
    studentID int not null,
    letterGrade varchar(2) not null,
    score decimal not null,
    constraint composite_prim_key primary key (sectionID, studentID),
    constraint foreign_sectionID foreign key(sectionID) references section(sectionID),
    constraint foreign_studentID foreign key(studentID) references student(studentID),
	constraint max_sagrade check (score <= 100),
	constraint min_sagrade check (score >= 0),
    constraint letterGradeCheck check (letterGrade in ('A+', 'A', 'A-','B+', 'B', 'B-','C+', 'C', 'C-','D+', 'D', 'D-','F', 'E', 'w', 'I')),
);

create table teacher
(
    teacherID int not null,
	fname varchar(50) not null,
	lname varchar(50) not null,
    username varchar(50) not null, --alex added
	email varchar(50) not null,
	deptID int not null,
	constraint unique_email unique (email),
	constraint prim_teacherID primary key (teacherID),
    constraint foreign_deptID foreign key (deptID) references department(deptID)
);

create table student
(
	studentID int not null, --added surrogate key
    wNumber varchar(10), not null,
	fname varchar(50) not null,
	lname varchar(50) not null,
    username varchar(50)
	email varchar(50),
	majorID int, --this is not normal
    minorID int, --this is not normal
    tuituion decimal,
	constraint unique_email unique (email),
	constraint prim_studentID primary key (studentID),
    constraint foreign_minor foreign key (minorID) references department(deptID),
    constraint foreign_major foreign key (majorID) references department(deptID),
);

create table class
(
    classID int not null,
    name varchar(20) not null, --alex added
    description varchar(50) not null,
    prerequisites int not null, --this is not normalized
    deptID int not null,
    constraint prim_classID primary key (classID),
    constraint foreign_deptID foreign key (deptID) references department(deptID)  
);

create table department
(
    deptID int not null,
    name varchar(10) not null, --changed shortname to this
    description varchar(50) not null,
);

create table announcements
(
    announcementID int not null,
    title varchar(256) not null,
    text varchar(2048) not null,
    dateTime date not null,
    sectionID int not null,
    constraint prim_announcmentID primary key (announcementID),
    constraint foreign_sectionID foreign key(sectionID) references section(sectionID)
);