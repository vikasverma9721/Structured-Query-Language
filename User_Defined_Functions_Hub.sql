create database def_function;

use def_function;

## Ques_01 Create a function to check even and odd
create function check_even_odd(n int)
returns varchar(10)
deterministic
return if (n %  2 = 0, "Even", "Odd");

select check_even_odd(5), check_even_odd(8);

## Ques_02 Create a function that returns the square of a number.
delimiter //

create function square_num(n int)
returns int
deterministic
begin 
return n * n;
end //

delimiter //;

select square_num(8), square_num(5);

## Ques_03 Create a function that takes two numbers and returns their sum.
delimiter //

create function sum_number(a float, b float)
returns float
deterministic
begin
return a + b;
end //

delimiter //;

select sum_number(5,8);

## Ques_04 Create a function that checks whether a given number is positive, negative, or zero.
DELIMITER //
CREATE FUNCTION CheckNumber(n INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
IF n > 0 THEN RETURN 'POSITIVE';
 ELSEIF n < 0 THEN RETURN 'NEGATIVE';
ELSE RETURN 'ZERO';
END IF ;
END //
DELIMITER ;

select CheckNumber(5),CheckNumber(-6),CheckNumber(0);

# Ques_05 Create a function to find the maximum of two numbers.
DELIMITER //
CREATE FUNCTION findmax(x INT, Y INT)
RETURNS INT
DETERMINISTIC
BEGIN
IF x > y THEN
RETURN x;
ELSE
RETURN y;
END IF;
END //
DELIMITER ;

select findmax(5,8);

# Ques_06 Create a function to greet a user by thier name.
DELIMITER //
CREATE FUNCTION GreetUser(username VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN
RETURN CONCAT('Hello', username, 'Welcome!');
END//
DELIMITER ;

select greetUser('Alice');


# Ques_07 Create a function to calculate Net Salary after 10% tax deduction.
DELIMITER //
CREATE FUNCTION NetSalary(gross_salary DECIMAL(10,2))
RETURNS DECIMAL
DETERMINISTIC
BEGIN
RETURN gross_salary - (gross_salary * 0.10);
END //
DELIMITER ;

select NetSalary(50000.00);


# Ques_08 Create a function to find the area of a circle.
DELIMITER //
CREATE FUNCTION CircleArea(radius FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
RETURN 3.14 * radius * radius;
END //
DELIMITER ;

select CircleArea(154);


# Ques_09 Create a function to check if a person is eligible to vote (Age >= 18).
DELIMITER //
CREATE FUNCTION CanVote(age INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
IF age >= 18 THEN RETURN 'YES';
ELSE RETURN 'NO';
END IF;
END //
DELIMITER ;

select CanVote(15), CanVote(19);


# Ques_10 Create a function to reverse a string.
DELIMITER //
CREATE FUNCTION ReverseText(text VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
RETURN REVERSE(text);
END //
DELIMITER ;

select reverseText('Hello I am Bob');