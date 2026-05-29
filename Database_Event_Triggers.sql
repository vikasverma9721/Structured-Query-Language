create database trigger1;

use trigger1;

CREATE TABLE employee(emp_id INT PRIMARY KEY, name VARCHAR(50),salary DECIMAL(10,2));

CREATE TABLE employee_log(log_id INT AUTO_INCREMENT PRIMARY KEY,emp_id INT,action varchar(50),log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO employee(emp_id,name,salary) VALUES
(101,"Amit",50000),
(102,"Rahul",45000),
(103,"John",60000),
(104,"Vishal",55000);

select * from employee;

# Ques_01 Trigger to log insert activity.
DELIMITER //
CREATE TRIGGER after_employee_insert AFTER INSERT ON employee FOR EACH ROW
BEGIN
INSERT INTO employee_log(emp_id,action) VALUES
(NEW.emp_id, "Inserted");
END //
DELIMITER ;

INSERT INTO employee(emp_id,name,salary) VALUES
(105,"Neha",25000);

select * from employee;
select * from employee_log;


# Ques_02 Trigger to log salary changes.
DELIMITER //
CREATE TRIGGER after_changes_salary AFTER UPDATE ON employee FOR EACH ROW
BEGIN
IF OLD.salary <> NEW.salary then
INSERT INTO employee_log(emp_id,action) VALUES
(OLD.emp_id,concat(OLD.salary,NEW.salary,"Salary Changed"));
END IF;
END //
DELIMITER ;

update employee set salary = 30000 where emp_id = 101;

select * from employee;
select * from employee_log;

# Ques_03 Trigger to Convert Employee Name to Uppercase.alter
DELIMITER //
CREATE TRIGGER beforenameuppercase BEFORE INSERT ON employee FOR EACH ROW
BEGIN
set NEW.name = UPPER(NEW.name);
END //
DELIMITER ;

insert into employee(emp_id,name,salary) VALUES
(106,"raj",45000.00);

select * from employee;
select * from employee_log;

# Ques_04 Trigger to Prevent Negative Salary.
DELIMITER //
CREATE TRIGGER trg_before_insert_salary BEFORE INSERT ON employee FOR EACH ROW
BEGIN
IF NEW.salary < 0 then 
SIGNAL SQLSTATE "45000"
SET MESSAGE_TEXT = "Salary cannot be negative";
END IF;
END //
DELIMITER ;

insert into employee(emp_id,name,salary) VALUES
(107,"Ram",-10);


# Ques_05 Trigger to Restrict Salary Reduction.
DELIMITER //
CREATE TRIGGER trg_before_upadet_salary BEFORE UPDATE ON employee FOR EACH ROW
BEGIN
IF NEW.salary < 20000 THEN
SIGNAL SQLSTATE "45000"
SET MESSAGE_TEXT = "salary reduction not allow";
END IF;
END //
DELIMITER ;

update employee set salary = 10000 where emp_id = 105;


# Ques_06 Trigger to Log Name Changes.
DELIMITER //
CREATE TRIGGER updated_name AFTER UPDATE ON employee FOR EACH ROW
BEGIN
IF OLD.name <> NEW.name then 
INSERT INTO employee_log(emp_id,action) VALUES
(NEW.emp_id,"Employee_name_changed");
END IF;
END //
DELIMITER ;

UPDATE employee SET name = "Raju" WHERE emp_id = 103;
select * from employee;
select * from employee_log;

# Ques_07 Set Default Salary.
DELIMITER //
CREATE TRIGGER trg_default_salary BEFORE INSERT ON employee FOR EACH ROW
BEGIN
if NEW.salary IS NULL then 
SET NEW.salary = 20000;
END IF;
END //
DELIMITER ;

INSERT INTO employee(emp_id,name) VALUES
(108,"RUHI");
select * from employee;
select * from employee_log;

# Ques_08 create a trigger to automatically increase salary by 10%.
DELIMITER //
CREATE TRIGGER trg_before_insert BEFORE INSERT ON employee FOR EACH ROW
BEGIN 
SET NEW.salary = NEW.salary * 1.10;
END//
DELIMITER ;

INSERT INTO employee(emp_id,name,salary) VALUES
(109,"Amit",1000);

select * from employee;
select * from employee_log;

# Ques_09 Trigger to Store Old and New Salary Change
# 1st
DELIMITER //
CREATE TRIGGER trg_after_update AFTER UPDATE ON employee FOR EACH ROW
BEGIN
INSERT INTO employee_log(emp_id,action) VALUES
(NEW.emp_id,CONCAT("salary changed from",OLD.salary,"to",NEW.salary));
END //
DELIMITER ;

UPDATE employee set salary = 25000 where emp_id = 105;
select * from employee;
select * from employee_log;

## 2nd 
DELIMITER //
CREATE TRIGGER trg_after_update_salary AFTER UPDATE ON employee FOR EACH ROW
BEGIN
IF NEW.salary <> OLD.salary then 
INSERT INTO employee_log(emp_id,action) VALUES
(NEW.emp_id,CONCAT("salary changed",OLD.salary,NEW.salary));
END IF;
END //
DELIMITER ;

UPDATE employee set salary = 25000 where emp_id = 102;

select * from employee;
select * from employee_log;


# Ques_10 create a trigger to count total employees.
CREATE TABLE emp_count(total INT);

INSERT INTO emp_count VALUES (0);

DELIMITER //
CREATE TRIGGER count_employee AFTER INSERT ON employee FOR EACH ROW
BEGIN 
UPDATE emp_count SET total = total + 1;
END //
DELIMITER ;	

INSERT INTO employee(emp_id,name,salary) VALUES
(110,"Sumit",10);

select * from emp_count;

# Ques_11 Trigger to Give Automatic Bonus on Joining?
DELIMITER //
CREATE TRIGGER trg_auto_joining_bonus BEFORE INSERT ON employee FOR EACH ROW
BEGIN
IF NEW.salary < 25000 THEN
SET NEW.salary = NEW.salary + 5000;
END IF;
END //
DELIMITER ;

INSERT INTO employee(emp_id,name,salary) VALUES
(111,"Radha",10000);

select * from employee;
select * from employee_log;

# Ques_12 Trigger to Block Name Update with Numbers?
DELIMITER //
CREATE TRIGGER trg_invalid_name BEFORE UPDATE ON employee FOR EACH ROW
BEGIN 
IF NEW.name LIKE "%Khan%" THEN
SET NEW.name = OLD.name;
END IF;
END //
DELIMITER ;

UPDATE employee set name = "Salman Khan" where emp_id = 105;
select * from employee;

# Ques_13 Trigger to Trim Spaces from Employee Name?
DELIMITER //
CREATE TRIGGER trg_trim_name BEFORE INSERT ON employee FOR EACH ROW
BEGIN 
SET NEW.name = TRIM(NEW.name);
END //
DELIMITER ;

INSERT INTO employee(emp_id,name,salary) VALUES 
(112,"  Bob  ",5000);

select * from employee;
select * from employee_log;

# Ques_14 Trigger to Log Percentage of Salary Hike?
DELIMITER //
CREATE TRIGGER trg_log_salary_diff AFTER UPDATE ON employee FOR EACH ROW 
BEGIN
IF NEW.salary > OLd.salary THEN
INSERT INTO employee_log(emp_id,action) VALUES
(NEW.emp_id,CONCAT("Salary increased by ", (New.salary - OLD.salary), "Rupees"));
END IF;
END //
DELIMITER ;

UPDATE employee SET salary = 32000 where emp_id = 102;
select * from employee;
select * from employee_log;

# Ques_15 Trigger to Auto-Capitalize First Letter Only?
DELIMITER //
CREATE TRIGGER trg_capitalize_first_letter BEFORE INSERT ON employee FOR EACH ROW
BEGIN
SET NEW.name = CONCAT(UPPER(SUBSTRING(NEW.name, 1,1)), LOWER(SUBSTRING(NEW.name,2)));
END //
DELIMITER ;

INSERT INTO employee(emp_id,name,salary) VALUES
(113,"raja",42000);

INSERT INTO employee(emp_id,name,salary) VALUES
(114,"rAHUL",25634);

select * from employee;
select * from employee_log;