create database bank;
use bank;
CREATE TABLE branch (
    Branch_name VARCHAR(100) PRIMARY KEY,
    Branch_city VARCHAR(100),
    Assets VARCHAR(100)
);
insert into branch values('Marthandams','Kanyakumari','bike'),('North street','parasala','car');
SELECT 
    *
FROM
    branch;
CREATE TABLE customer (
    customer_name VARCHAR(100) PRIMARY KEY,
    customer_street VARCHAR(100),
    customer_city VARCHAR(100)
);
insert into customer values('Tom','north','mars'),('jerry','south','jupiter');
SELECT 
    *
FROM
    customer;
CREATE TABLE account (
    account_no INT PRIMARY KEY,
    branch_name VARCHAR(100),
    Balance DOUBLE
);
insert into account values(123456,'south','20000'),(234567,'north','10000');
SELECT 
    *
FROM
    account;
CREATE TABLE loan (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(100)
);
insert into loan values(01,'marthandam'),(02,'pattam');
insert into loan values(03,'pattam');
SELECT 
    *
FROM
    loan;
SELECT 
    branch_name
FROM
    loan
GROUP BY branch_name;
CREATE TABLE depositer (
    customer_name VARCHAR(100),
    account_no INT PRIMARY KEY
);
insert into depositer values('bheem',020304),('kaliya',040506);
SELECT 
    *
FROM
    depositer;
CREATE TABLE borrower (
    customer_name VARCHAR(100),
    loan_no INT
);
insert into borrower values('ben',0908),('john',0809);
SELECT 
    *
FROM
    borrower;
CREATE TABLE employee (
    employee_name VARCHAR(100),
    branch_name VARCHAR(100),
    salary DOUBLE
);
insert into employee value('rock','south',10000),('cena','west',20000);
SELECT 
    *
FROM
    employee;
SELECT 
    customer_name
FROM
    customer;
SELECT 
    branch_name
FROM
    loan;
SELECT 
    balance < 20000
FROM
    account;
SELECT 
    account_no, balance
FROM
    account
WHERE
    balance > 10000;
SELECT 
    branch_name, assets
FROM
    branch;
alter table branch rename column assets to assets_in_thousand;
SELECT 
    *
FROM
    branch;
SELECT 
    branch_city
FROM
    branch;
SELECT 
    account_no, branch_name
FROM
    account;
SELECT 
    account_no, branch_name, balance
FROM
    account
WHERE
    balance > 10000;
SELECT 
    employee_name
FROM
    employee
WHERE
    salary > 10000
        AND branch_name <> 'south';







