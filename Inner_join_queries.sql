create database company1;

use company1;

create table employee(emp_id int primary key, emp_name varchar(50), dept_id int, salary int);

insert into employee(emp_id,emp_name,dept_id,salary) values
(1,"John",101,50000),
(2,"Emma",101,65000),
(3,"Raj",102,45000),
(4,"Meera",103,70000),
(5,"Ravi",102,48000),
(6,"Naina",103,52000),
(7,"Alex",101,58000);

select * from employee;

create table department(dept_id int, dept_name varchar(50));

insert into department(dept_id,dept_name) values
(101,"Sales"),
(102,"Marketing"),
(103,"Finance"),
(104,"HR");

select * from department;

#Q1.Display employee name with their department name.
select e.emp_name, d.dept_name from employee e
inner join department d
on e.dept_id = d.dept_id;

#Q2.List all employees including those with no matching department.
select e.emp_name,d.dept_name
from employee e
left join department d
on e.dept_id = d.dept_id;

#Q3.List all departments even if no employees.
select e.emp_name,d.dept_name
from employee e
right join department d
on e.dept_id = d.dept_id;

#Q4.Show employees from sales department.
select e.emp_name,d.dept_name
from employee e
inner join department d
on d.dept_id = e.dept_id
where d.dept_name = "Sales";

#Q5.Find top 3 highest paid employees.
select emp_name,salary
from employee
order by salary desc 
limit 3;

#Q6.Find employees earning more than 50,000 from Marketing. 
select e.emp_name,e.salary,d.dept_name
from employee e
inner join department d
on d.dept_id = e.dept_id
where salary > 50000 and d.dept_name = "Marketing";

#Q7.Count employees in each department. 
select count(e.emp_id),d.dept_name
from employee e
right join department d
on e.dept_id = d.dept_id
group by d.dept_name;

#Q8.Show departments having more than 2 employees. 
select d.dept_name,count(e.emp_id)
from employee e
right join department d
on d.dept_id = e.dept_id
group by d.dept_name
having count(e.emp_id) > 2;

#Q9.Show highest salary in each department. 
select d.dept_name,max(e.salary)
from employee e
right join department d
on e.dept_id= d.dept_id
group by d.dept_name;

#Q10. Show employees whose salary is above department average. 
select e.emp_name,d.dept_name,salary
from employee e
inner join department d
on d.dept_id = e.dept_id
where salary > (select avg(salary) from employee);

#Q11. Show employees and their departments sorted by department name.
select e.emp_name,d.dept_name
from employee e
inner join department d
on e.dept_id = d.dept_id
order by d.dept_name;

#Q12.List the 2 lowest-paid employees with department names. 
select e.emp_name,d.dept_name,e.salary
from employee e
inner join department d
on e.dept_id = d.dept_id
order by salary 
limit 2;

#Q13.Show total salary expenditure per department. 
select d.dept_name,sum(salary)
from employee e
inner join department d
on e.dept_id = d.dept_id
group by d.dept_name;

#Q14.Show departments where total salary spent is more than 150,000. 
select d.dept_name,sum(salary)
from employee e
inner join department d
on e.dept_id = d.dept_id
group by d.dept_name
having sum(salary) > 150000;

#Q15.Show employees who belong to departments starting with 'S'. 
select e.emp_name,d.dept_name
from employee e
inner join department d
on e.dept_id = d.dept_id
where d.dept_name like "S%";

#Q16.Find employees whose salary is the highest in their department. 
select e.emp_name, d.dept_name, e.salary
from employee e
inner join department d 
on e.dept_id = d.dept_id
where e.salary = (select MAX(e2.salary)from employee e2 where e2.dept_id = e.dept_id );

#Q17.Show employees and department sorted by salary descending. 
select e.emp_name,d.dept_name,e.salary
from employee e
inner join department d 
on d.dept_id = e.dept_id
order by e.salary desc;

#Q18.Count how many employees earn above 50,000 per department. 
select count(e.emp_id), d.dept_name
from employee e
inner join department d
on e.dept_id = d.dept_id
where salary > 50000
group by d.dept_name;