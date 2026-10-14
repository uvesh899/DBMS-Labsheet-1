CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Joining_Date DATE
);

INSERT INTO Student VALUES
(1, 'Aman', 20, 'CSE', 'Roorkee'),
(2, 'Riya', 19, 'AI', 'Delhi'),
(3, 'Kabir', 21, 'CSE', 'Meerut'),
(4, 'Neha', 20, 'ECE', 'Delhi'),
(5, 'Arjun', 22, 'AI', 'Roorkee');

INSERT INTO Employee VALUES
(1, 'Vikram', 'IT', 45500.75, '2022-01-15'),
(2, 'Priya', 'HR', 40200.50, '2021-06-10'),
(3, 'Rohit', 'IT', 55800.25, '2023-03-20'),
(4, 'Meena', 'Sales', 35000.90, '2020-11-05');

SELECT ABS(-25);
SELECT ROUND(12.567, 2);
SELECT CEIL(12.3), FLOOR(12.9);
SELECT MOD(17, 5);
SELECT Emp_Name, ROUND(Salary, 0) AS Rounded_Salary FROM Employee;

SELECT COUNT(*) AS Total_Students FROM Student;
SELECT SUM(Salary) AS Total_Salary FROM Employee;
SELECT AVG(Salary) AS Average_Salary FROM Employee;
SELECT MAX(Salary) AS Highest_Salary FROM Employee;
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;

SELECT UPPER(Name) FROM Student;
SELECT LOWER(Name) FROM Student;
SELECT Name, LENGTH(Name) AS Name_Length FROM Student;
SELECT CONCAT('Aman', ' ', 'Sharma') AS Full_Name;
SELECT SUBSTRING(Name, 1, 3) FROM Student;

SELECT CONVERT(123, CHAR) AS Number_As_Text;
SELECT CAST('250' AS UNSIGNED) AS Text_As_Number;
SELECT DATE_FORMAT('2026-10-14', '%d-%m-%Y') AS Formatted_Date;
SELECT CAST('45.75' AS DECIMAL(10,2)) AS Converted_Number;
SELECT CONVERT('2026-10-14', DATE) AS Converted_Date;

SELECT CURDATE() AS Current_Date;
SELECT YEAR(Joining_Date), MONTH(Joining_Date), DAY(Joining_Date) FROM Employee;
SELECT DATEDIFF('2026-12-31', '2026-10-14') AS Days_Difference;
SELECT DATE_ADD('2026-10-14', INTERVAL 10 DAY) AS New_Date;
SELECT Emp_Name, DATE_FORMAT(Joining_Date, '%d-%m-%Y') AS Joining_Date_Formatted FROM Employee;
