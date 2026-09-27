-- Employee Management Assignment Database

CREATE DATABASE employee_assignment;

USE employee_assignment;


CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);


INSERT INTO Employee VALUES
(101,'John','IT',60000,'Chennai','2022-01-15'),
(102,'David','HR',45000,'Bangalore','2021-03-10'),
(103,'Smith','IT',70000,'Chennai','2020-07-12'),
(104,'Mary','Finance',55000,'Mumbai','2023-01-20'),
(105,'James','HR',48000,'Delhi','2022-05-05'),
(106,'Linda','Finance',65000,'Mumbai','2021-08-18');



SELECT *
FROM Employee;


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);
-- Question 1: Find the total number of employees in each department
SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department;


-- Question 2: Find the average salary of employees in each department
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;


-- Question 3: Display departments having more than one employee
SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;


-- Question 4: Find the highest salary in each department
SELECT department, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;


-- Question 5: Find the lowest salary in each department
SELECT department, MIN(salary) AS lowest_salary
FROM Employee
GROUP BY department;


-- Question 6: Find departments whose average salary is greater than 50,000
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 50000;


-- Question 7: Calculate the total salary expenditure for each department
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;


-- Question 8: Display all employees sorted by salary in descending order
SELECT *
FROM Employee
ORDER BY salary DESC;


-- Question 9: Display employees sorted first by department and then by salary in descending order
SELECT *
FROM Employee
ORDER BY department ASC, salary DESC;


-- Question 10: Find cities that have more than one employee
SELECT city, COUNT(*) AS total_employees
FROM Employee
GROUP BY city
HAVING COUNT(*) > 1;


-- Question 11: Find the total salary paid in each city
SELECT city, SUM(salary) AS total_salary
FROM Employee
GROUP BY city;


-- Question 12: Display departments ordered by total salary expenditure from highest to lowest
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC;


-- Question 13: Find the number of employees in each department whose salary is greater than 50,000
SELECT department, COUNT(*) AS employee_count
FROM Employee
WHERE salary > 50000
GROUP BY department;


-- Question 14: Find the difference between the highest and lowest salary in each department
SELECT department,
       MAX(salary) - MIN(salary) AS salary_difference
FROM Employee
GROUP BY department;
SELECT * FROM Customers;
INSERT INTO Customers VALUES
(1, 'Janani', 'Chennai'),
(2, 'Arun', 'Bangalore'),
(3, 'Priya', 'Madurai'),
(4, 'Karthik', 'Salem'),
(5, 'Meena', 'Chennai');

INSERT INTO Orders VALUES
(101, 1, 5000, '2025-01-10'),
(102, 1, 3000, '2025-02-15'),
(103, 2, 7000, '2025-01-20'),
(104, 2, 4000, '2025-02-10'),
(105, 2, 2000, '2025-03-05'),
(106, 3, 6000, '2025-01-25'),
(107, 4, 2500, '2025-02-18'),
(108, 5, 9000, '2025-03-01');

-- Question 15: Display the top 3 highest-paid employees
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;

-- Question 16: Find the total order amount for each customer

SELECT c.customer_name,
       SUM(o.amount) AS total_order_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- Question 17: Find customers who have placed more than 3 orders

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 3;


-- Question 18: Find the average order amount for each customer

SELECT c.customer_name,
       AVG(o.amount) AS average_order_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- Question 19: Find the highest order amount placed by each customer

SELECT c.customer_name,
       MAX(o.amount) AS highest_order_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- Question 20: Display customers sorted by their total purchase amount

SELECT c.customer_name,
       SUM(o.amount) AS total_purchase_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase_amount DESC;


-- Question 21: Find customers whose total purchase amount exceeds 10,000

SELECT c.customer_name,
       SUM(o.amount) AS total_purchase_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 10000;


-- Question 22: Display customer names along with the total number of orders placed

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- Question 23: Find the customer who spent the highest amount

SELECT c.customer_name,
       SUM(o.amount) AS total_spent
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;


-- Question 24: Find the customer who placed the maximum number of orders

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC
LIMIT 1;


-- Question 25: Find customers whose average order amount is greater than 2,000

SELECT c.customer_name,
       AVG(o.amount) AS average_order_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING AVG(o.amount) > 2000;


-- Question 26: Display the top 5 customers based on total purchase amount

SELECT c.customer_name,
       SUM(o.amount) AS total_purchase_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase_amount DESC
LIMIT 5;


-- Question 27: Find the minimum order amount for each customer

SELECT c.customer_name,
       MIN(o.amount) AS minimum_order_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- Question 28: Find customers who have placed orders worth more than 5,000 in total

SELECT c.customer_name,
       SUM(o.amount) AS total_purchase_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 5000;


-- Question 29: Display customer-wise total orders and total purchase amount

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_purchase_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- Question 30: Find customers who placed more than 2 orders and spent more than 8,000

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_purchase_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 2
   AND SUM(o.amount) > 8000;
   
   INSERT INTO Students (student_id, student_name, department, marks) VALUES
(1, 'Rahul', 'Arts', 85),
(2, 'Priya', 'Arts', 92),
(3, 'Arun', 'Arts', 78),
(4, 'Sneha', 'Arts', 88),
(5, 'Karthik', 'Arts', 95),
(6, 'Meena', 'Arts', 72),

(7, 'John', 'Mathematics', 76),
(8, 'Divya', 'Mathematics', 82),
(9, 'Ravi', 'Mathematics', 68),
(10, 'Anjali', 'Mathematics', 90),
(11, 'Suresh', 'Mathematics', 74),
(12, 'Lakshmi', 'Mathematics', 80),

(13, 'David', 'Science', 88),
(14, 'Mary', 'Science', 91),
(15, 'James', 'Science', 79),
(16, 'Linda', 'Science', 85),
(17, 'Robert', 'Science', 94),
(18, 'Swathi', 'Science', 73),

(19, 'Vijay', 'Sports', 70),
(20, 'Pooja', 'Sports', 75),
(21, 'Naveen', 'Sports', 82),
(22, 'Harini', 'Sports', 89),
(23, 'Manoj', 'Sports', 77),
(24, 'Keerthi', 'Sports', 93);

SELECT * FROM Students;

   
   
   -- Question 31: Find the average marks scored by students in each department

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department;


-- Question 32: Find departments whose average marks are above 75

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) > 75;


-- Question 33: Find the highest mark scored in each department

SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department;


-- Question 34: Find the total number of students in each department

SELECT department, COUNT(student_id) AS total_students
FROM Students
GROUP BY department;


-- Question 35: Find departments having more than 5 students

SELECT department, COUNT(student_id) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(student_id) > 5;


-- Question 36: Display departments sorted by average marks in descending order

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC;


-- Question 37: Find the top 3 departments based on average marks

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 3;


-- Question 38: Find departments whose average marks are between 70 and 90

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;


-- Question 39: Find the total marks scored by students in each department

SELECT department, SUM(marks) AS total_marks
FROM Students
GROUP BY department;


-- Question 40: Display departments sorted by the total number of students

SELECT department, COUNT(student_id) AS total_students
FROM Students
GROUP BY department
ORDER BY total_students DESC;


-- Question 41: Find the lowest mark scored in each department

SELECT department, MIN(marks) AS lowest_marks
FROM Students
GROUP BY department;


-- Question 42: Find departments where the highest mark is greater than 90

SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
HAVING MAX(marks) > 90;


-- Question 43: Find the number of students scoring above 80 in each department

SELECT department, COUNT(*) AS students_above_80
FROM Students
WHERE marks > 80
GROUP BY department;


-- Question 44: Find departments where more than 3 students scored above 75

SELECT department, COUNT(*) AS students_above_75
FROM Students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;


-- Question 45: Display departments ordered by highest mark in descending order

SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
ORDER BY highest_marks DESC;
   
   
   