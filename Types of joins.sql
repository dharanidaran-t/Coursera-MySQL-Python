 CREATE DATABASE my_demo_joins;
 
 USE my_demo_joins;
 
 CREATE table customer
   (
     custid varchar(6),
     fname varchar(30),
     mname varchar(30),
     lname varchar(30),
     city varchar(15),
     mobileno varchar(10),
     occupation varchar(10),
     dob date,
     constraint customer_custid_pk primary key(custid)
     );

CREATE TABLE branch
  (
    bid varchar(6),
    bname varchar(30),
    bcity varchar(30),
    constraint branch_bid_pk primary key(bid)
    );
    
CREATE TABLE account
  (
    acnumber varchar(6),
    custid varchar(6),
    bid varchar(6),
    opening_balance int(7),
    acc_od date,
    actype varchar(10),
    acstatus varchar(10),
    constraint account_acnumber_pk primary key(acnumber),
    constraint account_custid_fk foreign key(custid) references customer(custid),
    constraint account_bid_fk foreign key(bid) references branch(bid)
    );
    
show tables;

INSERT INTO customer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi','9543194834','Service','1978-12-06');
INSERT INTO customer VALUES('C00002','Avinash','Sundar','Minha','Delhi','9545694834','Service','1974-10-16');
INSERT INTO customer VALUES('C00003','Rahul',null,'Rastogi','Delhi','9876544834','Student','1991-11-07');
INSERT INTO customer VALUES('C00004','Parul','Chandra','Sharma','Delhi','9543194834','Housewife','1978-12-06');
INSERT INTO customer VALUES('C00005','Naveen','Chandra','Sharma','Mumbai','9543194834','Student','1984-12-06');
INSERT INTO customer VALUES('C00006','Chitresh','Chandra','Sharma','Mumbai','9543194834','Service','1978-12-06');
INSERT INTO customer VALUES('C00007','Amit','Chandra','Sharma','Mumbai','9543194834','Service','1978-12-06');
INSERT INTO customer VALUES('C00008','Nisha','Chandra','Sharma','Mumbai','9543194834','Student','1988-12-06');
INSERT INTO customer VALUES('C00009','Abishek','Chandra','Sharma','Kolkata','9543194834','Service','1978-12-06');
INSERT INTO customer VALUES('C00010','Shankar','Chandra','Sharma','Chennai','9543194834','Service','1978-12-06');

describe customer;
select * from customer;

INSERT INTO branch VALUES('B00001','Asaf Ali road','Delhi');
INSERT INTO branch VALUES('B00002','New delhi main road branch','Delhi');
INSERT INTO branch VALUES('B00003','Delhi cantt','Delhi');
INSERT INTO branch VALUES('B00004','Jasola','Delhi');
INSERT INTO branch VALUES('B00005','Mahim','Mumbai');
INSERT INTO branch VALUES('B00006','Vile parle','Mumbai');
INSERT INTO branch VALUES('B00007','Mandvi','Mumbai');
INSERT INTO branch VALUES('B00008','Jadavpur','Kolkata');
INSERT INTO branch VALUES('B00009','Kodambakkam','Chennai');

describe BRANCH;
select * from branch;

INSERT INTO account VALUES('A00001','C00001','B00001',1000,'2010-12-15','Saving','Actice');
INSERT INTO account VALUES('A00002','C00002','B00001',1000,'2012-11-15','Saving','Actice');
INSERT INTO account VALUES('A00003','C00003','B00002',1000,'2012-10-12','Saving','Actice');
INSERT INTO account VALUES('A00004','C00002','B00005',1000,'2012-1-6','Saving','Actice');
INSERT INTO account VALUES('A00005','C00006','B00006',1000,'2013-2-15','Saving','Actice');
INSERT INTO account VALUES('A00006','C00007','B00007',1000,'2014-2-5','Saving','Suspended');
INSERT INTO account VALUES('A00007','C00007','B00001',1000,'2015-1-15','Saving','Actice');
INSERT INTO account VALUES('A00008','C00001','B00003',1000,'2015-4-5','Saving','Terminated');
INSERT INTO account VALUES('A00009','C00003','B00007',1000,'2016-2-1','Saving','Terminated');
INSERT INTO account VALUES('A00010','C00004','B00002',1000,'2017-1-5','Saving','Actice');

describe account;
select * from account;

SELECT COUNT(custid) from customer;
SELECT COUNT(acnumber) from account;

## INNER JOIN-- It helps to select the matching records from both tables ##

select * from branch 
inner join account 
on branch.bid=account.bid;

select * from customer 
inner join account 
on customer.custid=account.custid;

select count(fname) from customer 
inner join account 
on customer.custid=account.custid;

## Left join -- It helps to fetch all records from the left table and the matching records from the right table##


select * from branch 
left join account 
on branch.bid=account.bid;

SELECT * FROM customer
LEFT JOIN account
ON customer.custid=account.custid;

##we want all the customers with the account in our bank

SELECT * FROM account
LEFT JOIN customer
ON account.custid=customer.custid;

## Right join -- It helps to fetch all records from the right table and the matched records from the left table ##

select * from branch 
right join account 
on branch.bid=account.bid;

SHOW tables;

##I want my all the customers who has acc

SELECT * FROM account
RIGHT JOIN customer
ON customer.custid=account.custid;

SELECT * FROM customer
RIGHT JOIN account
ON account.custid=customer.custid;

## Full join-- It helps to fetchall the records from both the table whether there is a match or not ##

select * from branch 
full join account 
on branch.bid=account.bid;

SELECT * FROM account
FULL JOIN customer
ON account.custid=customer.custid;

## FOR MYSQL 4.0 (Higher versions above 4) THEY DO NOT SUPPORT FULL JOIN, SO WE NEED TO USE SOME OTHER FUNCTION SUCH AS UNION##

SELECT * FROM account
Left JOIN customer ON account.custid=customer.custid
UNION 
SELECT * FROM account
RIGHT JOIN customer ON account.custid=customer.custid;

## Self Join -- A self helps to join with itself # To avoid repetition of data##

CREATE TABLE student 
  (
     student_id varchar(6),
     name varchar(30),
     course_id varchar(30),
     duration int(4)
     );

drop table student;

insert into student values('1','Asif',2,4);
insert into student values('2','Atul',1,4);
insert into student values('1','Asif',2,4);
insert into student values('2','Atul',3,4);
insert into student values('5','Jasmine',1,4);
insert into student values('6','Adhil',1,4);

select * from student;

select s1.student_id, s1.name
from student AS s1, student s2
where s1.student_id=s2.student_id and s1.student_id<>s2.student_id;

