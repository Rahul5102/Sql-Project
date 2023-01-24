create database employee_payroll;
use employee_payroll;
CREATE TABLE user_table (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(250),
    password VARCHAR(250),
    email_id VARCHAR(250),
    user_type VARCHAR(250)
);
insert into user_table values(1001,'rocky','rocky1001','rocky@gmail.com','employee');
insert into user_table values(1002,'john','john1002','john@gmail.com','employee');
select * from user_table;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(250)
);
insert into department values(1000,'CSE'),(2000,'IT'),(3000,'EEE');
select * from department;

CREATE TABLE grade (
    grade_id INT PRIMARY KEY,
    grade_name VARCHAR(250),
    grade_short_name VARCHAR(250),
    grade_basic INT,
    grade_ta INT,
    grade_da INT,
    grade_hra INT,
    grade_ma INT,
    grade_bonus INT,
    grade_pf INT,
    grade_pt INT
);
insert into grade values(200,'employee','emp',25000,500,1000,1500,550,5000,10000,2500),(201,'manager','mang',30000,1000,600,4000,700,6800,3000,2500);
SELECT * from grade;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_title VARCHAR(250),
    emp_name VARCHAR(250),
    emp_dob DATE,
    emp_doj DATE,
    emp_address VARCHAR(250),
    emp_city VARCHAR(250),
    emp_pincode INT,
    emp_mobile_no INT,
    emp_state VARCHAR(250),
    emp_mail_id VARCHAR(250),
    emp_pan_no VARCHAR(250)
);
insert into employee values(400,'manager','roman','2000-01-02','2020-01-03','marthandam','nagercoil',629165,123456,'tamilnadu','roman@gmail.com','pan roman'),
(401,'HR','sivan kutty','1999-01-01','2021-01-02','nemom','tvm',600001,2222222,'kerala','sivan@gmail.com','pan sivan');
select * from employee;

CREATE TABLE grade_details (
    transation_id INT PRIMARY KEY,
    emp_id INT,
    FOREIGN KEY (emp_id)
        REFERENCES employee (emp_id),
    emp_dept_id INT,
    FOREIGN KEY (emp_dept_id)
        REFERENCES department (dept_id),
    emp_grade_id INT,
    FOREIGN KEY (emp_grade_id)
        REFERENCES grade (grade_id),
    emp_from_date DATE,
    emp_to_date DATE
);
insert into  grade_details values(1010,400,1000,200,'2000-01-01','2020-01-01'),(1020,401,2000,201,'1999-01-01','2021-01-01');
select * from grade_details;
 
CREATE TABLE salary_details (
    transaction_id INT,
    FOREIGN KEY (transaction_id)
        REFERENCES grade_details (transation_id),
    emp_id INT,
    FOREIGN KEY (emp_id)
        REFERENCES employee (emp_id),
    emp_salary_month VARCHAR(100),
    emp_salary_year VARCHAR(100),
    emp_salary_eimbursment_date DATETIME,
    emp_dept_id INT,
    FOREIGN KEY (emp_dept_id)
        REFERENCES department (dept_id),
    emp_grade_id INT,
    FOREIGN KEY (emp_grade_id)
        REFERENCES grade (grade_id),
    emp_basic INT,
    emp_da INT,
    emp_ta INT,
    emp_hra INT,
    emp_ma INT,
    emp_bonus INT,
    emp_pf INT,
    emp_pt INT,
    emp_gross INT,
    emp_total_salary INT
);
alter table salary_details modify column emp_salary_year int;

insert into salary_details values (1010,400,'may',2022,'2022-09-08 12:33:23',1000,201,110,120,130,140,150,160,170,180,190,15000),(1020,401,'july',2022,'2022-11-11 13:23:44',2000,201,210,220,230,240,250,260,270,280,290,15000);


SELECT 
    e.emp_da, e.emp_ma, s.emp_to_date
FROM
    salary_details e
        INNER JOIN
    grade_details s ON e.emp_grade_id = s.emp_grade_id;
    



