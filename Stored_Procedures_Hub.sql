create database company2;

use company2;

select * from sales;

# Ques_01Create a Procedure to display all employees detail
DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
select * from sales;
END //
DELIMITER ;

call ShowAllEmployees();


# Ques_02 Create a stored procedure to fetch all employees from a specific department.
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_name varchar(50))
BEGIN 
select * from sales where department = dept_name;
END //
DELIMITER ;

CALL GetEmployeesByDept("HR");


# Ques_03 Create a stored procedure to insert a new employee.
DELIMITER //
CREATE PROCEDURE AddEmployee(IN emp_name varchar(50), IN emp_dept varchar(50), IN emp_salary INT)
BEGIN
INSERT INTO sales(name, department, salary) values
(emp_name, emp_dept, emp_salary);
END //
DELIMITER ;

CALL AddEmployee("Frank", "Finance",62000);
select * from sales;

# Ques_04Create a stored procedure to return the total salary of all employees.
DELIMITER //
CREATE PROCEDURE TotalSalary()
BEGIN 
select sum(salary) from sales;
END //
DELIMITER ;

CALL TotalSalary();

# Ques _05 Create a stored procedure to increase salary by a given percentage for a department.
DELIMITER //
CREATE PROCEDURE IncreaseSalaryByDept(IN dept_name varchar(50), IN percent_increase Decimal(8,2))
BEGIN
update sales set salary = salary + (salary * percent_increase / 100)
where department = dept_name;
END //
DELIMITER ;

set sql_safe_updates = 0;
CALL IncreaseSalaryBYDept("IT",10);

select * from sales;

# Ques_06 Create a stored procedure to delete an e,mployee by ID.
DELIMITER //
CREATE PROCEDURE DeleteEmployeeBYId(IN empId INT)
BEGIN
delete from sales where emp_id = empId;
END //
DELIMITER ;

CALL DeleteEmployeeBYId(2);
select * from sales;

# Create a stored procedure that takes min_salary and max_salary and returns employees with salaries between them.
DELIMITER //
CREATE PROCEDURE SalaryRange(IN min_salary int, IN max_salary int)
BEGIN
select * from sales where salary BETWEEN min(salary) and max(salary);
END //
DELIMITER //;

CALL SalaryRange(50000,60000);


# Ques_07 Create a stored procedure to update Employee Name.
DELIMITER //
CREATE PROCEDURE updatename(IN id int, IN emp_name varchar(50))
BEGIN
update sales set name = emp_name where emp_id = id;
END //
DELIMITER ;

set sql_safe_updates = 0;
CALL updatename(5,"John");
select * from sales;


# Ques_08 Create a stored procedure to Get Highest Salary Employee.
DELIMITER //
CREATE PROCEDURE HighestSalary()
BEGIN
select max(salary) from sales;
END //
DELIMITER ;

CALL HighestSalary;


# Ques_09 Create a stored procedure to Return Average Salary;
DELIMITER //
CREATE PROCEDURE AverageSalary()
BEGIN
select avg(salary) from sales;
END //
DELIMITER ;

CALL AverageSalary()


# Ques_10 Create a stored procedure to count Total Employee.
DELIMITER //
CREATE PROCEDURE CountEmployee()
BEGIN
select count(*) from sales;
END //
DELIMITER ;

CALL CountEmployee();


# Ques_11 Create a stored procedure to Return Average Salary department wise.
DELIMITER //
CREATE PROCEDURE DeptWiseSalary()
BEGIN
select avg(salary) as DepartmentWiseAvgSalary from sales group by department;
END //
DELIMITER ;

CALL DeptWiseSalary();


# Ques_12 Create a stored procedure to Get Employees Above a Salary.
DELIMITER //
CREATE PROCEDURE AboveSalary(IN salary_inter int)
BEGIN
select * from sales where salary > salary_inter;
END //
DELIMITER ;

CALL AboveSalary(50000);


# Ques_13 Create a stored procedure to add 2 numbers.
DELIMITER //
CREATE PROCEDURE Addnumbers(IN x float, IN y float)
BEGIN
 select x + y as Additional;
END //
DELIMITER ; 

CALL Addnumbers(4 , 5);