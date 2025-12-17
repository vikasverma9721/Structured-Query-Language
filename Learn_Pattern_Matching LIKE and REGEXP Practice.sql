create database school;

use school;

create table student(
    id int primary key,
    name varchar(50),
    email varchar(100),
    phone varchar(15)
);

insert into student(id,name,email,phone) values
(1,'Amit Sharma','amit.sharma@abc.com','9876543210'),
(2,'Priya Singh','priya.singh@xyz.com','9988776655'),
(3,'Raj Patel','raj.patel@abc.com','8877665544'),
(4,'Neha Gupta','neha.gupta@xyz.com','7766554433'),
(5,'Rohan Mehta','rohan.mehta@abc.com','6655443322'),
(6,'Sunita Verma','sunita.verma@xyz.com','5544332211'),
(7,'Vikram Yadav','vikram.yadav@abc.com','4433221100'),
(8,'Anjali Mishra','anjali.mishra@xyz.com','3322110099');

select * from student;

#Q1. Display the names of students whose names start with 'A'.
#..(i)
select * from student
where name like "A%";

#..(ii)
select * from student
where name regexp "^A";

#Q2. Display the names of students whose names contain 'a'.
#..(i)
select * from student
where name like "%A%";

#..(ii)
select * from student
where name regexp "A";

#Q3. Display the names of student whose names end with 'i'.
#..(i)
select * from student
where name like "%i";

#..(ii) 
select * from student
where name regexp "i$";

#Q4. Display the names of students whose second character is 'a'.
#..(i)
select * from student
where name like "_a%";

#..(ii)
select * from student
where name regexp "^.a";

#Q5. Display the names of students whose emails end with 'abc.com'.
#..(i)
select * from student
where email like "%abc.com";

#..(ii)
select * from student
where email regexp "abc.com$";

#Q6. Display the names of students whose phone numbers start with '7'.
#..(i)
select * from student
where phone like "7%";

#..(ii)
select * from student
where phone regexp "^7";

#Q7. Display the names of students whose names contain 'ra'.
#..(i)
select * from student
where name like "%ra%";

#..(ii)
select * from student
where name regexp "ra";

#Q8. Display the names of students whose emails contain '@xyz.com'.
#..(i)
select * from student
where email like "%xyz.com%";

#..(ii)
select * from student
where email regexp "xyz.com";

#Q9. Display the names of students whose phone numbers contain '55'.
#..(i)
select * from student
where phone like "%55%";

#..(ii)
select * from student
where phone regexp "55";

#Q10. Display the names of students whose names contain 'a' or 'i'.
#..(i)
select * from student
where name like "%a%" or "%i%";

#..(ii)
select * from student
where name regexp "a" or "i";