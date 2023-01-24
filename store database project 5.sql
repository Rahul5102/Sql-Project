create database store_management;
use store_management;
CREATE TABLE category (
    category_id INT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(100)
);
insert into category values(100,'voltas','bulb'),(101,'apple','fruits');
select * from category;

CREATE TABLE customer (
    customer_id INT primary key,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_no BIGINT
);
insert into customer values(1000,'mani','kuttan',1234567890),(1001,'sivan','kutty',1234567800);
select * from customer;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email CHAR(100),
    phone_no BIGINT,
    job_id INT,
    hire_date DATE,
    location_id CHAR(100)
);
select * from employees;
insert into employees values (2000,'vishal','raman','vishal@gmail.com',8888888888,900,'2021-09-08',500),(2001,'raja','ram','raja@gmail.com',7777777777,800,'2019-03-23',501);
select * from employees;

CREATE TABLE job (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100),
    salary INT
);
alter table job add constraint foreign key (job_id) references employees(job_id);
insert into job values(900,'manager',30000),(800,'sales',20000);

CREATE TABLE location (
    location_id INT,
    province VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(100)
);
alter table location modify column location_id int primary key;
insert into location values(500,'tamil nadu','kanyakumari','marthandam'),(501,'kerala','tvm','puram');
select * from location;

CREATE TABLE manager (
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    location_id INT,
    email_id CHAR(100),
    phone_no BIGINT
);
insert into manager values('amir','khan',230,'amir@gmail.com',1111111111),('mohamed','khan',231,'mohamed@gmail.com',2222222222);
select * from manager;

CREATE TABLE product (
    product_id INT,
    name VARCHAR(100),
    description VARCHAR(100),
    Qty_stock INT,
    price INT(100),
    category_id INT,
    FOREIGN KEY (category_id)
        REFERENCES category (category_id)
);
alter table product modify column product_id int primary key;
insert into product values( 120,'voltas','bulb',90,100,100),(130,'apple','fruits',30,40,101);
select * from product;

CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    location_id INT,
    phone_no BIGINT
);

insert into supplier values(701,'alibaba',10000,9999999999),(702,'amazon',10001,9090909090);
select * from supplier;

CREATE TABLE type (
    type CHAR(100),
    type_id INT PRIMARY KEY
) ; 
insert into type values('marketing',1234),('sales marketing',4321); 
select * from type;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    user_name VARCHAR(100),
    password CHAR(100),
    type_id INT,
    FOREIGN KEY (type_id)
        REFERENCES type (type_id),
    location_id INT,
    phone_no BIGINT
);
insert into users values(3000,'lalu','nambi','lalu','lalu123',1234,10000,9999999999),(3001,'ooty','kuttan','ooty','ooty1234',4321,10001,9090909090);
select * from users;



SELECT 
    n.name,  p.product_id
FROM
    n category
        JOIN
    p product ON n.category_id = p.category_id;
 
 -- 9 --
    
SELECT 
    e.first_name, e.last_name, e.phone_no, j.job_id
FROM
    employees e
        JOIN
    job j ON e.job_id = j.job_id;

-- 10 --

SELECT 
    u.first_name, u.last_name, u.type_id, t.type
FROM
    users u
        JOIN
    type t ON t.type_id = u.type_id;