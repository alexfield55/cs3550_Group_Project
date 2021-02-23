use master;
drop database if exists LMS
create database LMS
go
use LMS;

create table module
(
    moduleID int not null,
    title varchar(50),
    name varchar(50),
    sectionID in not null,
    constraint prim_moduleID primary key (moduleID),
    constraint foreign_sectionID foreign key(sectionID) references section(sectionID)
);

create table final_grade
(
    gradeID in not null,
    letterGrade varchar(2) not null,
    score decimal not null,
    sectionID int not null,
    constraint prim_gradeID primary key (gradeID),
    constraint foreign_sectionID foreign key(sectionID) references section(sectionID),
    constraint letterGradeCheck check (letterGrade in ('A+', 'A', 'A-','B+', 'B', 'B-','C+', 'C', 'C-','D+', 'D', 'D-','F', 'E', 'w', 'I')),
);

create table discussion
(
    discussionID int not null,
    details varchar(50),
    sectionID int not null,
    constraint prim_discussionID primary key (discussionID),
    constraint foreign_sectionID foreign key(sectionID) references section(sectionID)
);

create table reply
(
    replyID int not null,
    usernameTeacher varchar(50),
    usernameStudent varchar(50) --this seems like it should connect to student
    discussionID int not null,
    constraint prim_replyID primary key (replyID),
    constraint foreign_discussionID foreign key (discussionID) references dicussion(discussionID),
    constraint foreign_usernameTeacher foreign key (usernameTeacher) references teacher(username),
    constraint foreign_usernameStudent foreign key (usernameStudent) references student(username)
);

create table home
(
    homeID int not null,
    pageShown varchar(50),
    sectionID int not null,
    constraint prim_homeID primary key (homeID),
    constraint foreign_sectionID foreign key(sectionID) references section(sectionID)
);

create table section
(
    sectionID int not null,
    roomID int,
    teacherID int not null,
    classID int not null,
    constraint prim_sectionID primary key (sectionID),
    constraint foreign_roomID foreign key (roomID) references room(roomID),
    constraint foreign_teacherID foreign key (teacherID) references teacher(teacherID),
    constraint foreign_classID foreign key (classID) references class(classID)
);

create table room
(
    roomID int not null,
    roomType varchar(50),
    buildingID int not null,
    constraint prim_roomID primary key (roomID),
    constraint foreign_buildingID foreign key (buildingID) references building(buildingID)
);

create table building
(
    buildingID int not null,
    location varchar(50) not null,
    name varchar(50) not null
    constraint prim_buildingID primary key buildingID
);

create table assignment
(
    --alex changed this a bit, basically copied it from a previous assignemnt
	assignmentID int not null,
	description varchar(50),
	due_date date not null, 
	max_possible_grade float,
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
    constraint composite_prim_key primary key (sectionID, studentID),
    constraint foreign_sectionID foreign key(sectionID) references section(sectionID),
    constraint foreign_studentID foreign key(studentID) references student(studentID)
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

create table student_assignment
(
	assignmentID int not null,
	studentID int not null,
	submission_date date,
	grade float,
	constraint max_sagrade check (grade <= 100),
	constraint min_sagrade check (grade >= 0),
	constraint comp_key primary key (assignment_id, studentID),
	constraint foreign1_sa foreign key(assignmentID) references assignment(assignmentID),
	constraint foreign2_sa foreign key(studentID) references student(studentID)

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