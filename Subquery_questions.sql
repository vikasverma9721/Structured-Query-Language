create database company;

use company;

create table employee(emp_id int not null primary key, emp_name varchar(50), dept_name varchar(50), salary int, manager_id int);

insert into employee(emp_id, emp_name, dept_name, salary, manager_id) values
(1,'Arjun','HR',40000,null),
(2,'Neha','IT',65000,5),
(3,'Rohan','IT',55000,5),
(4,'Meera','Finance',70000,null),
(5,'Suresh','IT',90000,4),
(6,'Alia','HR',45000,1),
(7,'Karan','Finance',75000,4),
(8,'Rahul','Marketing',30000,null),
(9,'Priya','Marketing',35000,8),
(10,'Varun','IT',50000,5);

select * from employee;

# Ques_01 List employees earning more than the average salary.
select emp_name, salary from employee
where salary > (select avg(salary) from employee);

# Ques_02 Find employees who earn the maximum salary.
select emp_name,salary from employee
where salary = (select max(salary) from employee);

# Ques_03 Find employees working in the same department as ‘Neha’.
select emp_name, dept_name from employee
where dept_name = (select dept_name from employee where emp_name = 'Neha');

# Ques_04 List employees whose salary is higher than Suresh’s salary.
select emp_name, salary from employee
where salary > (select salary from employee where emp_name = 'Suresh');

# Ques_05 Show departments where the minimum salary is less than 40,000.
select dept_name from employee 
where salary in (select min(salary) from employee where salary < 40000 group by dept_name);


# Ques_06 Find employees who do not have a manager.
select emp_name from employee
where emp_id in (select emp_id from employee where manager_id is null);

# Ques_ 07 Find employees who report to the same manager as Rohan.
select emp_name, manager_id from employee
where manager_id = (select manager_id from employee where emp_name = 'Rohan');

# Ques_08 List employees in IT with salary above the IT average.
select emp_name, salary from employee
where salary > (select avg(salary) from employee 
where dept_name = 'IT') and dept_name = 'IT';

# Ques_09 Show employees whose salary is in the bottom 3.
select emp_name, salary from employee
where salary in (select salary from (select distinct salary from employee order by salary asc limit 3) as t);

# Ques_10 Show employees whose salary is within the top 3.
select emp_name, salary from employee
where salary in (select salary from (select distinct salary from employee order by salary desc limit 3) as t);

# Ques_11 Find employees earning more than HR department average salary.
select emp_name, salary from employee
where salary > (select avg(salary) from employee where dept_name = 'HR');

# Ques_12 List employees having the same salary as Priya.
select emp_name, salary from employee 
where salary = (select salary from employee where emp_name = 'Priya');

# Ques_13 Count employees who earn below overall average.
select count(*) from employee
where salary < (select avg(salary) from employee);

# Ques_14 Show employees whose manager earns more than 70,000.
select emp_name, salary, manager_id from employee
where manager_id in (select emp_id from employee where salary > 70000);

# Ques_15 Display employees in departments where more than 2 employees work.
select emp_name, dept_name from employee
where dept_name = (select dept_name from employee
group by dept_name
having count(emp_name) > 2);

# Ques_16 Show departments where the average salary is above company average.
select dept_name , avg(salary) as Average_salary from employee
group by dept_name 
having avg(salary) > (select avg(salary) from employee);

# Ques_17 Find the 2nd highest salary.
select max(salary) as Second_Highest_salary from employee
where salary < (select max(salary) from employee);


# Ques_18 Employees with salary greater than the average salary of their manager’s team.
select emp_name, salary from employee
where salary > (select avg(salary) from employee where manager_id is not null);


# Ques_19 Show employees who work in a department where Suresh works.
select emp_name, dept_name from employee
where dept_name = (select dept_name from employee where emp_name = 'Suresh');


# Ques_20 List employees whose manager earns the maximum salary.
select emp_name from employee
where manager_id = (select emp_id from employee 
where salary = (select max(salary) from employee 
where emp_id in (select manager_id from employee
where manager_id is not null)));


# Ques_21 Show employees whose salaries appear more than once.
select emp_name, salary from employee
where salary in (select salary from employee group by salary having count(*) > 1);

# Ques_22 List employees earning less than the minimum IT salary.
select emp_name, salary from employee
where salary < (select min(salary) from employee where dept_name = 'IT');


# Ques_23 Show employees with salary higher than Finance average salary.
select emp_name, salary from employee 
where salary > (select avg(salary) from employee where dept_name = 'Finance');


# Ques_24 Find employees earning exactly the 3rd highest salary.
select emp_name, salary from employee 
where salary in (select max(salary) from employee
where salary < (select max(salary) from employee where salary < (select max(salary) from employee)));

# Ques_25 List employees having salary in the same salary group as Meera’s department.
select emp_name, dept_name, salary from employee
where dept_name = (select dept_name from employee 
where emp_name = 'Meera');

