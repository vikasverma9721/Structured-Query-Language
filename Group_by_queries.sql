create database company;

use company;

select * from employee;

# QUes_01 Find the average salary of employees in each department.
select department,
avg(salary) as Average_Salary 
from employee
group by department;

# QUes_02 Find the total number of employees hired after 2019. 
select count(emp_id) as Total_Emp
from employee
where hire_date > 2019;

# Ques_03 List the departments and the total salary of all employees in each department, ordered by the total salary. 
select department,
sum(salary) as Total_Salary
from employee
group by department
order by Total_salary;

# Ques_04 Find the highest salary in the Finance department. 
select max(salary) as Highest_Salary
from employee
where department = 'Finance';

# Ques_05 Get the top 3 highest-paid employees. 
select * from employee order by salary desc limit 3;

# Ques_06 Find the department with the minimum average salary. 
select department,
avg(salary) as min_avg_salary from employee
group by department
order by avg(salary) limit 1;

# Ques_07 Display the total number of employees in each department, ordered by the number of employees.
select department,
count(emp_id) as total_number_of_employees
from employee
group by department
order by total_number_of_employees;

# Ques_08 Find the average salary of employees who were hired before 2020.
select avg(salary) from employee
where hire_date < 2020;

# Ques_09 List the names of employees in the IT department ordered by hire date, with the most recently hired employees first.
select * from employee 
where department = 'IT'
order by hire_date desc;
 
# Ques_10 Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary.
select sum(salary) as Sum_Salary_All_Emp from employee
where hire_date > '2019-01-01'
order by salary;

# Ques_11 Get the employee with the lowest salary in the HR department. 
select * from employee
where department = "HR"
order by salary limit 1;

# Ques_12 Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.
  select department,
  sum(salary) Total_Salary 
  from employee
  group by department
  order by sum(salary) desc limit 2;
  
# Ques_13 List all employees hired after 2018, ordered by salary, and show only the first 4 employees.  
select * from employee 
where hire_date > '2018'
order by salary limit 4;

# Ques_14 Find the highest salary in the IT department, but limit the results to the top 1 result. 
# (i)
select max(salary) as Highest_Salary 
from employee 
where department = 'IT'
order by max(salary) desc limit 1;

# (ii)
select * from employee
where department = 'IT'
order by salary desc limit 1;

# Ques_15 Get the average salary of employees in each department and list only departments with an average salary greater than $60,000. 
 select department,
 avg(salary) as Average_Salary 
 from employee
 group by department
 having avg(salary) > 60000;
