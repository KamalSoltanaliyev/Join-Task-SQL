CREATE DATABASE JoinsTask

USE JoinsTask

CREATE TABLE Students (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL,
	Surname NVARCHAR(55) NOT NULL DEFAULT 'XXXXXX'
);

CREATE TABLE Subjects (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL,
);

CREATE TABLE Exams (
	Id INT PRIMARY KEY IDENTITY,
	[Date] DATE,
	SubjectId INT,
	FOREIGN KEY (SubjectId) REFERENCES Subjects(Id)
);

create table StudentExams (
	Id INT PRIMARY KEY IDENTITY, 
	ExamResult INT CHECK(ExamResult >= 0 and ExamResult <= 100),
	ExamId INT,
	StudentId INT,
	FOREIGN KEY (StudentId) REFERENCES Students(Id),
	FOREIGN KEY (ExamId) REFERENCES Exams(Id)
);

SELECT 
    s.Name AS StudentName,
    s.Surname AS StudentSurname,
    sub.Name AS SubjectName,
    e.Date AS ExamDate,
    se.ExamResult
FROM 
    Students s
JOIN 
    StudentExams se ON s.Id = se.StudentId
JOIN 
    Exams e ON se.ExamId = e.Id
JOIN 
    Subjects sub ON e.SubjectId = sub.Id;


INSERT INTO Students ([Name], Surname)
VALUES ('Kamal', 'Soltanaliyev'),
       ('Jude', 'Bellingham'),
       ('Michael', 'Jordan')

INSERT INTO Subjects ([Name])
VALUES ('Mathematics'),
       ('Physics'),
       ('Chemistry')

INSERT INTO Exams ([Date], SubjectId)
VALUES ('2024-02-14', 1), 
       ('2024-02-14', 2), 
       ('2024-02-14', 3)

INSERT INTO StudentExams (ExamResult, ExamId, StudentId)
VALUES (100, 1, 1),  
       (100, 2, 2),  
       (100, 3, 3)
