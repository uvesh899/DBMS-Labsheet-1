CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Course;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Duration INT
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Dept_ID INT,
    Course_ID INT
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Dept_ID INT,
    Salary DECIMAL(10,2),
    Manager_ID INT
);

INSERT INTO Department VALUES
(1, 'CSE', 'Block A'),
(2, 'AI', 'Block B'),
(3, 'ECE', 'Block C'),
(4, 'Mechanical', 'Block D');

INSERT INTO Course VALUES
(1, 'Programming', 4),
(2, 'Machine Learning', 4),
(3, 'Electronics', 4);

INSERT INTO Student VALUES
(1, 'Aman', 1, 1),
(2, 'Riya', 2, 2),
(3, 'Kabir', 1, 1),
(4, 'Neha', 3, 3),
(5, 'Arjun', NULL, 2);

INSERT INTO Employee VALUES
(1, 'Vikram', 1, 60000, NULL),
(2, 'Priya', 2, 55000, 1),
(3, 'Rohit', 1, 45000, 1),
(4, 'Meena', 3, 50000, 1),
(5, 'Karan', 2, 40000, 2);

SELECT Student.Name, Department.Dept_Name
FROM Student INNER JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Student.Name, Department.Dept_Name
FROM Student INNER JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Employee.Emp_Name, Department.Dept_Name
FROM Employee INNER JOIN Department ON Employee.Dept_ID = Department.Dept_ID;

SELECT Student.Name, Course.Course_Name
FROM Student INNER JOIN Course ON Student.Course_ID = Course.Course_ID;

SELECT Student.Name, Department.Dept_Name
FROM Student INNER JOIN Department ON Student.Dept_ID = Department.Dept_ID
WHERE Department.Dept_Name = 'CSE';

SELECT Student.Name, Department.Dept_Name
FROM Student LEFT JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Student.Name, Department.Dept_Name
FROM Student LEFT JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Student.Name, Department.Dept_Name
FROM Student RIGHT JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Department.Dept_Name, Student.Name
FROM Student RIGHT JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Student.Name
FROM Student LEFT JOIN Department ON Student.Dept_ID = Department.Dept_ID
WHERE Department.Dept_ID IS NULL;

SELECT Department.Dept_Name
FROM Student RIGHT JOIN Department ON Student.Dept_ID = Department.Dept_ID
WHERE Student.Student_ID IS NULL;

SELECT Student.Name, Department.Dept_Name
FROM Student LEFT JOIN Department ON Student.Dept_ID = Department.Dept_ID
UNION
SELECT Student.Name, Department.Dept_Name
FROM Student RIGHT JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Student.Name, Course.Course_Name
FROM Student CROSS JOIN Course;

SELECT COUNT(*) AS Possible_Combinations
FROM Student CROSS JOIN Course;

SELECT Student.Name, Department.Dept_Name
FROM Student NATURAL JOIN Department;

SELECT Student.Name, Department.Dept_Name
FROM Student NATURAL JOIN Department;

SELECT Student.Name, Department.Dept_Name
FROM Student INNER JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Employee.Emp_Name, Manager.Emp_Name AS Manager_Name
FROM Employee
LEFT JOIN Employee AS Manager ON Employee.Manager_ID = Manager.Emp_ID;

SELECT Employee.Emp_Name, Manager.Emp_Name AS Manager_Name
FROM Employee
LEFT JOIN Employee AS Manager ON Employee.Manager_ID = Manager.Emp_ID;

SELECT Student.Name, Department.Dept_Name, Course.Course_Name
FROM Student
INNER JOIN Department ON Student.Dept_ID = Department.Dept_ID
INNER JOIN Course ON Student.Course_ID = Course.Course_ID;

SELECT Student.Name, Course.Course_Name, Department.Dept_Name
FROM Student
INNER JOIN Course ON Student.Course_ID = Course.Course_ID
LEFT JOIN Department ON Student.Dept_ID = Department.Dept_ID;

SELECT Employee.Emp_Name, Employee.Salary, Department.Dept_Name
FROM Employee
INNER JOIN Department ON Employee.Dept_ID = Department.Dept_ID
WHERE Employee.Salary > (
    SELECT AVG(E2.Salary)
    FROM Employee AS E2
    WHERE E2.Dept_ID = Employee.Dept_ID
);

SELECT Department.Dept_Name, COUNT(Student.Student_ID) AS Student_Count
FROM Department
LEFT JOIN Student ON Department.Dept_ID = Student.Dept_ID
GROUP BY Department.Dept_ID, Department.Dept_Name
HAVING COUNT(Student.Student_ID) = (
    SELECT MAX(Dept_Count)
    FROM (
        SELECT COUNT(Student_ID) AS Dept_Count
        FROM Student
        GROUP BY Dept_ID
    ) AS Counts
);

SELECT Department.Dept_Name, COUNT(Student.Student_ID) AS Total_Students
FROM Department
LEFT JOIN Student ON Department.Dept_ID = Student.Dept_ID
GROUP BY Department.Dept_ID, Department.Dept_Name;

SELECT Course.Course_Name, COUNT(Student.Student_ID) AS Total_Students
FROM Course
LEFT JOIN Student ON Course.Course_ID = Student.Course_ID
GROUP BY Course.Course_ID, Course.Course_Name;

SELECT Department.Dept_Name, Course.Course_Name, COUNT(Student.Student_ID) AS Total_Students
FROM Student
INNER JOIN Course ON Student.Course_ID = Course.Course_ID
LEFT JOIN Department ON Student.Dept_ID = Department.Dept_ID
GROUP BY Department.Dept_Name, Course.Course_Name;
