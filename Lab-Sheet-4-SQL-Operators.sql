CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Product;

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
    City VARCHAR(50)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);

INSERT INTO Student VALUES
(1, 'Aman', 20, 'CSE', 'Delhi'),
(2, 'Riya', 19, 'AI', 'Roorkee'),
(3, 'Kabir', 21, 'CSE', 'Meerut'),
(4, 'Neha', 20, 'ECE', 'Delhi');

INSERT INTO Employee VALUES
(1, 'Vikram', 'IT', 45000, 'Delhi'),
(2, 'Priya', 'HR', 40000, 'Noida'),
(3, 'Rohit', 'IT', 55000, 'Meerut');

INSERT INTO Product VALUES
(1, 'Keyboard', 800, 10),
(2, 'Mouse', 500, 15),
(3, 'Monitor', 9000, 0);

SELECT 10 + 5 AS Addition;
SELECT 10 - 5 AS Subtraction;
SELECT 10 * 5 AS Multiplication;
SELECT 10 / 5 AS Division;
SELECT Product_Name, Price * Quantity AS Total_Amount FROM Product;

SELECT * FROM Student WHERE Course = 'CSE' AND City = 'Delhi';
SELECT * FROM Employee WHERE Department = 'IT' OR Department = 'HR';
SELECT * FROM Student WHERE NOT City = 'Delhi';
SELECT * FROM Student WHERE Course = 'CSE' AND City = 'Delhi';
SELECT * FROM Employee WHERE Department IN ('IT', 'HR');

SELECT * FROM Student WHERE Age = 20;
SELECT * FROM Employee WHERE Salary > 40000;
SELECT * FROM Employee WHERE Salary < 50000;
SELECT * FROM Employee WHERE Salary >= 40000 AND Salary <= 50000;
SELECT * FROM Student WHERE City <> 'Delhi';
SELECT * FROM Employee WHERE Salary BETWEEN 40000 AND 50000;
SELECT * FROM Student WHERE City IN ('Delhi', 'Roorkee');
SELECT * FROM Student WHERE City NOT IN ('Delhi', 'Roorkee');
SELECT * FROM Student WHERE Name LIKE 'A%';
SELECT * FROM Student WHERE Course IS NULL;
SELECT * FROM Student WHERE Course IS NOT NULL;

SELECT City FROM Student UNION SELECT City FROM Employee;
SELECT City FROM Student UNION ALL SELECT City FROM Employee;
SELECT City FROM Student WHERE City IN (SELECT City FROM Employee);
SELECT City FROM Student WHERE City NOT IN (SELECT City FROM Employee);
SELECT * FROM Product WHERE Price > 500 AND Quantity > 0 AND Product_Name LIKE 'M%';
