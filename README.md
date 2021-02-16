Project Information
For the class project, we will design, implement, utilize and evaluate a Learning Management System (LMS) database. 

I attempt to give you some headstart in LMS via assignments. You should have your conceptual design. You should also have logical and physical design for a few entities. 

The project is divided into 4 phases. 

Design
Implementation
Utilization
Evaluation + Improvement
Phase 1: Design (Due 6th week, 2nd lecture)
During the design phase, first, you will do requirements engineering where you will discuss with your teammates what functionality the LMS should provide. Based on your discussion, you need to come up with 15 most important entities and the relationship between these entities. 

You need to build a logical design document and a physical design document for the entities of LMS. 

Logical design and physical design should be complete. If a database is implemented using the design, it should be able to drive a simple LMS web or mobile application. Make sure that you cover most of the important attributes. 

The logical design document should consist of an ER diagram with the following:

Attributes for each entity
Clearly specify attribute types like single-valued vs multi-valued, simple-composite, derived,  etc via your drawing. 
PK (Attempt to use logical keys at this stage and avoid surrogate keys)
Relationships
Weak entity (if any)
Cardinality, and
Total participation (if any) of relationships.
Relationship attributes if any. 
Super-type and sub-type relationships
The physical design document should be derived from the logical design document. Follow the rules of ERD to table conversion discussed during the class. The physical design document should consist of the following:

the primary key
foreign key
the domain of each column
constraints - consider all the constraints discussed during class. 
Any associative tables that you created to handle the m-n (or any other kind of) relationships. 
Surrogate key whenever needed. When you define a surrogate key, you may need to change the design of tables to accommodate the surrogate key. 
All the tables are normalized. You don't need to mention the normal form. 
If you have any derived attribute, provide a list of other attributes that this derived attribute is dependant on.
Submission for Phase 1:

project_p1_logical.pdf - a pdf file for logical design document. 
project_p1_logical.txt - a text file mentioning assumptions. Do not mention assumptions for something obvious. If you cannot accommodate anything as part of pdf document, mention it here. 
project_p1_physical.pdf - a pdf file for physical design document. 
project_p1_physical.txt - a text file mentioning any information that you cannot provide as part of pdf document. 
 

Phase 2: Implementation (Due week 10, first lecture)
During the implementation phase, we will use the logical and physical design created during Phase 1 to implement the database in MS SQL Server. 

The implementation should consist of the following:

Creation of a new database called LMS
All tables created in the database with appropriate columns. 
The Columns should have correct datatype as per logical and physical design.  
All primary keys are correctly implemented. 
If you use surrogate keys, they are implemented as an identity element with auto-increment. 
All foreign keys are correctly implemented. 
All constraints identified as part of the logical and physical design are correctly implemented. 
If you have any derived attribute, keep it empty right now. We will cover calculating it in the next phase. 
At least 3 instructors, 10 students, 4 sections and 3 classes are entered into the database. 
Submission for Phase 2:

No submission if the database is implemented on the Titan server. Or
LMS_p2.bak backup file that has 1-9 of phase 2 completed. 
Optional: project_p2.txt file to mention any assumptions or details that you want to include as part of the submission. 
Phase 3: Writing queries, stored procedures, functions, and triggers for the database (due Week 13 first lecture)
Write a total of 10 queries for the LMS database that we created. You may need to modify/enhance the database if your database is not good enough to perform certain queries. Whenever you need to modify the database,  document the changes. I will provide you 6 queries and choose 4 queries of your choice. Mentioned the query that you choose in the normal verbal format first.
Find all the classes that a student is ever enrolled in using student id. (you can hardcode the student id in where condition)
Find all the classes that a student is currently enrolled in using student id. 
List assignments and grades for each assignment for a student for a particular class using student id and class id.  Also, sort the assignment by the assignment due date. 
List all the students enrolled in a particular class. 
List first name, last name of all the students ordered by the last name who will be taking one or more courses under a particular instructor. (Use instructor id)
List the average assignment score for each assignment for a particular class. (using class id or section id)
Query of your choice
Query of your choice
Query of your choice
Query of your choice
Stored Procedure
TODO list that appears for the instructor. Write a stored procedure that will return all the assignments that are due this week in any of the class for an instructor. The stored procedure will take as its input instructor id and use the select statement to print the assignment. 
Stored-procedure of your choice. Clearly mention the purpose of the stored procedure. Just like 1. 
Stored-procedure of your choice. Clearly mention the purpose of the stored procedure. 
Function
Write a function that will return the number of students who miss two or more assignments for a particular class. (Use classid or sectionid as input)
The function of your choice.
Trigger
trigger_update_final_score trigger. Whenever any change is made in the score of any assignment, the trigger is used to update the final score. You can come with any reasonable formula to compute the final score based on assignments/exams/quizzes etc. 
Indexes
Come up with 2 non-clustered indexes for the LMS database. Why did you choose those 2 non-clustered indexes? Justify your choice. Implement the non-clustered index. 
Submission Instruction: 

A pdf or docx files containing all your queries, stored procedures, functions, triggers, and indexes information. The file also document any database changes that you need to make in order to make the queries/functions/stored-procedures work. project_phase3.pdf/docx. 
SQL statement for all 10 queries.
For "Your Choice" queries, specify the problem statement.
Create procedure  statement for Stored-procedures. For "Your Choice" stored procedure, specify the problem statement. 
Create function statement for Functions. For "Your Choice" functions, specify the problem statement. 
Create trigger statement for the trigger. 
Create index statement or picture of the index creation.
.bak file containing the backup of your database. Not needed if the Titan server is used. 
Phase 4: Reviewing the database. (Not needed for Fall 2020) (No implementation) (Due finals week Monday)
The instructor will provide you the "your choice" queries, stored procedures, and functions form one another team. 
Document how many of the queries, stored procedures, and functions you will not be able to implement. Specify the reasons behind that.  Add this information to the database enhancement/modification document that you created in phase 3. 