create database Employeepayroll22;
use Employeepayroll22;
create table Employees(
employee_id int primary key unique,
employee_name varchar(255),
department varchar(100),
position varchar(100),
hire_date date,
base_salary decimal(10,2));
create table Attendance(
attendance_id int primary key,
employee_id int, foreign key(employee_id) references Employees(employee_id),
attendance_date date,
status enum('Present','Absent','Leave'));
create table Salaries(
salary_id int primary key,
employee_id int, foreign key(employee_id) references Employees(employee_id),
base_salary decimal(10,2),
bonus decimal(10,2),
deductions decimal(10,2),
month varchar(20),
year int);
create table Payroll(
payroll_id int primary key,
employee_id int, foreign key(employee_id) references Employees(employee_id),
total_salary decimal(10,2),
payment_date date);
insert into Employees(employee_id, employee_name, department, position, hire_date, base_salary) values
(1, 'Alice Johnson', 'Finance', 'Accountant', '2018-03-12', 58000.00),
(2, 'Brian Smith', 'Engineering', 'Software Engineer', '2020-07-22', 95000.00),
(3, 'Carla Mendes', 'Marketing', 'Marketing Manager', '2017-11-03', 72000.00),
(4, 'David Nguyen', 'Human Resources', 'HR Specialist', '2021-02-15', 61000.00),
(5, 'Ella Thompson', 'Engineering', 'Data Analyst', '2019-05-18', 87000.00),
(6, 'Franklin Lee', 'Sales', 'Sales Executive', '2022-01-25', 65000.00),
(7, 'Grace Kim', 'Finance', 'Financial Analyst', '2020-10-10', 68000.00),
(8, 'Henry Patel', 'Engineering', 'DevOps Engineer', '2016-08-09', 98000.00),
(9, 'Isabella Garcia', 'Customer Support', 'Support Representative', '2023-03-30', 48000.00),
(10, 'Jack Wilson', 'Marketing', 'Content Strategist', '2021-12-01', 69000.00);
insert into Attendance(attendance_id, employee_id, attendance_date, status) values
(1, 1, '2025-11-01', 'Present'),
(2, 1, '2025-11-02', 'Present'),
(3, 1, '2025-11-03', 'Absent'),
(4, 2, '2025-11-01', 'Present'),
(5, 2, '2025-11-02', 'Leave'),
(6, 2, '2025-11-03', 'Present'),
(7, 3, '2025-11-01', 'Present'),
(8, 3, '2025-11-02', 'Present'),
(9, 3, '2025-11-03', 'Present'),
(10, 4, '2025-11-01', 'Absent');
INSERT INTO Salaries (salary_id, employee_id, base_salary, bonus, deductions, month, year) VALUES
(1, 1, 58000.00, 1500.00, 300.00, 'October', 2025),
(2, 2, 95000.00, 2500.00, 800.00, 'October', 2025),
(3, 3, 72000.00, 2000.00, 500.00, 'October', 2025),
(4, 4, 61000.00, 1200.00, 200.00, 'October', 2025),
(5, 5, 87000.00, 1800.00, 600.00, 'October', 2025),
(6, 6, 65000.00, 1700.00, 400.00, 'October', 2025),
(7, 7, 68000.00, 1400.00, 350.00, 'October', 2025),
(8, 8, 98000.00, 3000.00, 1000.00, 'October', 2025),
(9, 9, 48000.00, 900.00, 150.00, 'October', 2025),
(10, 10, 69000.00, 1600.00, 250.00, 'October', 2025);
INSERT INTO Payroll (payroll_id, employee_id, total_salary, payment_date) VALUES
(1, 1, 58920.50, '2025-11-05'),
(2, 2, 97340.75, '2025-11-05'),
(3, 3, 72780.10, '2025-11-05'),
(4, 4, 61890.00, '2025-11-05'),
(5, 5, 87550.20, '2025-11-05'),
(6, 6, 65230.00, '2025-11-05'),
(7, 7, 68670.85, '2025-11-05'),
(8, 8, 99500.60, '2025-11-05'),
(9, 9, 48480.40, '2025-11-05'),
(10, 10, 69790.15, '2025-11-05');
SET SQL_SAFE_UPDATES = 0;
update Employees
set position="Senior Accountant" where employee_id=1;
update Employees
set base_salary = 65000 where employee_id=4;
select * from Attendance;
SELECT 
    Salaries.employee_id,
    (Salaries.base_salary + Salaries.bonus - Salaries.deductions) AS Sum_salary
FROM 
    Salaries;
SELECT 
    Salaries.employee_id,
    Employees.employee_name,
    (Salaries.base_salary + Salaries.bonus - Salaries.deductions) AS Sum_salary
FROM 
    Salaries
inner join 
	Employees on Salaries.employee_id = Employees.employee_id;
update Salaries 
set bonus = 3500 where employee_id = 10;
select 
  Payroll.employee_id,
  (Salaries.base_salary + Salaries.bonus - Salaries.deductions) AS Sum_salary
from 
 Payroll
 inner join
 Salaries on Payroll.employee_id = Salaries.employee_id;
   
 select 
  Payroll.employee_id,
  Payroll.payment_date,
  (Salaries.base_salary + Salaries.bonus - Salaries.deductions) AS Sum_salary
from 
 Payroll
 inner join
 Salaries on Payroll.employee_id = Salaries.employee_id;
 SELECT 
    Employees.employee_id,
    Employees.employee_name,
    Payroll.total_salary,
    Salaries.bonus,
    Salaries.deductions
FROM Employees
INNER JOIN Payroll
    ON Employees.employee_id = Payroll.employee_id
inner join Salaries
    on Employees.employee_id=Salaries.employee_id;
    
 SELECT 
    Employees.employee_id,
    Employees.employee_name,
    Salaries.base_salary,
    Salaries.bonus,
    Salaries.deductions,
    Payroll.total_salary
FROM Employees
INNER JOIN Payroll
    ON Employees.employee_id = Payroll.employee_id
inner join Salaries
    on Employees.employee_id=Salaries.employee_id;






