create database VT;

use VT;

create table emp(
emp_id int,
emp_name varchar(10),
dept_name varchar(10),
salary float
);

insert into emp(emp_id,emp_name,dept_name,salary)values
(1,'Alice','HR',50000),
(2,'Bob','IT',70000),
(3,'Charlie','IT',60000),
(4,'David','HR',55000),
(5,'Eve','Finance',65000);

select * from emp;

# Q-1 Creating a view to show employee name and salary ?
create view employee_salaries as
select emp_name,salary from emp;

select * from employee_salaries;

# Q-2 Create a view to show highest salary of employees ?
create view high_earners as
select emp_name,dept_name,salary
from emp
where salary > 60000;

select * from high_earners;

# Q-3 Create a view that shows total salary by department ?
create view department_salary as
select dept_name,sum(salary) as total_salary
from emp
group by dept_name;

select * from department_salary;

# Q-4 Update a view ?
create or replace view high_earners as
select emp_name,dept_name,salary from emp where salary > 65000;

select * from high_earners;

# Q-5 Drop a view ?
drop view if exists high_earners;

select * from emp;

create table department(
dept_id int,
dept_name varchar(50)
);

insert into department(dept_id,dept_name)values
(1,'HR'),
(2,'IT'),
(3,'Finance');

select * from department;

create table employee(
emp_id int,
emp_name varchar(10),
salary int,
dept_id int
);

insert into employee(emp_id,emp_name,salary,dept_id)values
(101,'Amit',50000,1),
(102,'Riya',70000,2),
(103,'Karan',60000,2),
(104,'Neha',55000,3);

select * from employee;

# Q-1 Create a view display employee name and department name ?
create view employees_department as
select e.emp_name, d.dept_name
from employee e
inner join department d
on e.dept_id = d.dept_id;

select * from employees_department;

create table employeee(
emp_id int,
emp_name varchar(10),
salary int,
dept_id int
);

insert into employeee(emp_id,emp_name,salary,dept_id)values
(1,'Amit',50000,1),
(2,'Riya',70000,2),
(3,'Karan',60000,2),
(4,'Neha',55000,3),
(5,'Rohit',80000,1);

select * from employeee;

create table departmentt(
dept_id int,
dept_name varchar(50)
);

insert into departmentt(dept_id,dept_name)values
(1,'HR'),
(2,'IT'),
(3,'Finance');

select * from departmentt;

# Q-1 Display employee name and salary status using if(salary > 60000) ?
select emp_name,salary,
if (salary > 60000, 'high salary','low salary') as salary_level
from employeee;

# Q-2 Show employee bonus eligibility (salary > 65000) ?
select emp_name,salary,
if (salary > 65000, 'bonus', 'no bonus') as bonus 
from employeee;

## Ques on ANY :-

# Q-1 Employees earning more than any IT employee ?
select emp_name,salary
from employeee
where salary > any(
select salary
from employeee
where dept_id = 2
);

# Q-2 Employee earning more than any HR employee ?
select emp_name,salary
from employeee
where salary > any(
select salary
from employeee
where dept_id = 1
);

## Ques on ALL :-

# Q-1 Employees earning more than any ALL IT employee ?
select emp_name,salary
from employeee
where salary > all(
select salary
from employeee
where dept_id = 2
);