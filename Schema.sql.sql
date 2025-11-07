create database company;

use company;

create table employee(id int primary key auto_increment, name varchar(100), position varchar(100), salary decimal(10,2), date_of_joining date);

# Ques_02 Insert the following data into the employee table:
Insert into employee(name,position,salary,date_of_joining) values
("John Doe","Manager",55000.00,"2020-01-15"),
("Jane Smith","Developer",48000.00,"2019-07-10"),
("Alice Johnson","Designer",45000.00,"2021-03-22"),
("Bob Brown","Developer",50000.00,"2018-11-01");

select * from employee;

# Ques_03 Write a quary to retrieve all employee who are Developers.
select * from employee where position = "Developer";

# Ques_04 Write a quary to update the salary of Alice Johnson to 46000.00.alter
update employee
set salary = "46000"
where name = "Alice Johnson";

select * from employee;

# Ques_05 Write a quary to delete the employee record for Bob Brown.
delete from employee where name = "Bob Brown";

select * from employee;

# Ques_06 Write a quary find the employees who have a salary greater than 48000.
select * from employee where salary > 48000;

# Ques_07 Write a quary to add a new column email to the employees table.
alter table employee add column Email varchar(100);

select * from employee;

# Ques_08 Write a quary to update the email for John Deo to john.deo@company.com.
update employee
set email = "john.deo@company.com"
where id = 1;

select * from employee;

# Ques_09 Write a quary to retrieve only the name and salary of all employees.
select name,salary from employee;

# Ques_10 Write a query to count the number of employees who joined after January 1,2020.
select count(name) as "Number_of_employee" from employee
where date_of_joining > "2020-01-01";

# Ques_11 Write a query to order the employees by salary in descending order.
select * from employee order by salary desc;

# Ques_12 Write a query to drop email column from the employees table.
alter table employee drop email;

select * from employee;

# Ques_13 Write a query find the employee with the highest salary.
select * from employee
where salary = (select max(salary) as "Highest_Salary" from employee);