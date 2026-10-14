CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Course;

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
    Salary DECIMAL(10,2)
);

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Duration INT,
    Fees DECIMAL(10,2)
);

INSERT INTO Student VALUES (1, 'Aman', 20, 'CSE', 'Roorkee');

INSERT INTO Student VALUES (2, 'Riya', 19, 'AI', 'Delhi');
INSERT INTO Student VALUES (3, 'Kabir', 21, 'CSE', 'Meerut');
INSERT INTO Student VALUES (4, 'Neha', 20, 'ECE', 'Delhi');
INSERT INTO Student VALUES (5, 'Arjun', 22, 'AI', 'Roorkee');
INSERT INTO Student VALUES (6, 'Sara', 19, 'CSE', 'Meerut');

INSERT INTO Student VALUES
(7, 'Ishita', 20, 'AI', 'Delhi'),
(8, 'Rahul', 21, 'ECE', 'Noida'),
(9, 'Meera', 19, 'CSE', 'Meerut');

INSERT INTO Employee VALUES (1, 'Vikram', 'IT', 45000);
INSERT INTO Employee VALUES (2, 'Priya', 'HR', 40000);
INSERT INTO Employee VALUES (3, 'Rohit', 'IT', 55000);

INSERT INTO Department VALUES (1, 'CSE', 'Block A');
INSERT INTO Department VALUES (2, 'AI', 'Block B');
INSERT INTO Department VALUES (3, 'ECE', 'Block C');

INSERT INTO Product VALUES (1, 'Keyboard', 800, 10);
INSERT INTO Product VALUES (2, 'Mouse', 500, 15);
INSERT INTO Product VALUES (3, 'Monitor', 9000, 0);

INSERT INTO Customer VALUES (1, 'Anil', 'anil@example.com', '9876543210');
INSERT INTO Customer VALUES (2, 'Pooja', 'pooja@example.com', '9876501234');

INSERT INTO Course VALUES (1, 'CSE', 4, 80000);
INSERT INTO Course VALUES (2, 'AI', 4, 90000);
INSERT INTO Course VALUES (3, 'ECE', 4, 75000);

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (10, 'Dev', 20, 'CSE', 'Delhi');

UPDATE Student SET City = 'Jaipur' WHERE Student_ID = 1;
UPDATE Employee SET Salary = 50000 WHERE Emp_ID = 1;
UPDATE Employee SET Salary = Salary * 1.10;
UPDATE Product SET Price = Price * 1.05;
UPDATE Student SET Course = 'AI' WHERE Student_ID = 2;
UPDATE Employee SET Department = 'Finance' WHERE Emp_ID = 2;
UPDATE Student SET City = 'Delhi' WHERE City = 'Meerut';
UPDATE Course SET Fees = 85000 WHERE Course_ID = 1;
UPDATE Student SET Age = 21, City = 'Noida' WHERE Student_ID = 3;

DELETE FROM Student WHERE Student_ID = 10;
DELETE FROM Student WHERE City = 'Noida';
DELETE FROM Employee WHERE Salary < 42000;
DELETE FROM Product WHERE Quantity = 0;
DELETE FROM Student WHERE Age < 20 AND City = 'Delhi';

INSERT INTO Student VALUES (20, 'Karan', 20, 'CSE', 'Roorkee');
SELECT * FROM Student;
UPDATE Student SET City = 'Delhi' WHERE Student_ID = 20;
SELECT * FROM Student;
DELETE FROM Student WHERE Student_ID = 20;
SELECT * FROM Student;
