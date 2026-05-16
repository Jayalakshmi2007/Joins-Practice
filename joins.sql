CREATE TABLE Employees (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Dept_ID INT
);

INSERT INTO Employees VALUES
(1, 'Ravi', 101),
(2, 'Sita', 102),
(3, 'Arun', 103),
(4, 'Meena', NULL);

CREATE TABLE Departments (
    Dept_ID INT,
    Dept_Name VARCHAR(50)
);

INSERT INTO Departments VALUES
(101, 'HR'),
(102, 'Finance'),
(104, 'IT');

SELECT Employees.Emp_ID,
       Employees.Emp_Name,
       Departments.Dept_Name
FROM Employees
INNER JOIN Departments
ON Employees.Dept_ID = Departments.Dept_ID;

SELECT Employees.Emp_ID,
       Employees.Emp_Name,
       Departments.Dept_Name
FROM Employees
RIGHT JOIN Departments
ON Employees.Dept_ID = Departments.Dept_ID;

SELECT Employees.Emp_ID,
       Employees.Emp_Name,
       Departments.Dept_Name
FROM Employees
LEFT JOIN Departments
ON Employees.Dept_ID = Departments.Dept_ID;

SELECT Employees.Emp_ID,
       Employees.Emp_Name,
       Departments.Dept_Name
FROM Employees
FULL OUTER JOIN Departments
ON Employees.Dept_ID = Departments.Dept_ID;