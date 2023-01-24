create database Railway_reservation_system;
use Railway_reservation_system;
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    address VARCHAR(100),
    gender VARCHAR(100),
    phone_no INT,
    DOB INT,
    salary INT
);

insert  into employee values(100,'akhil','marthandam','male',1234567890,2000-01-06,30000),(101,'aswathy','nemom','female',2134567890,2000-02-13,30000);
select * from employee;

CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100),
    seat_no INT,
    gender VARCHAR(100),
    phone_no INT,
    employee_id INT,
    FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id),
    reservation_status VARCHAR(100)
);
insert into passenger values(1000,'rohit',10,'male',1324567890,100,'waiting list'),(1001,'virat',11,'male',1413567890,101,'confirm');
select * from passenger;

CREATE TABLE station (
    station_id CHAR(100),
    station_name VARCHAR(100),
    no_of_lines INT,
    no_of_platforms INT
);
insert into station values('s01','tvm',10,5),('c01','chennai',10,6);
alter table station modify column station_id char(100) primary key;
select * from station;

CREATE TABLE train (
    train_id INT PRIMARY KEY,
    station_id CHAR(100),
    FOREIGN KEY (station_id)
        REFERENCES station (station_id),
    train_name VARCHAR(100)
);
insert into train values (10020,'c01','lokmanya tilak'),(10030,'s01','chennai express');
select * from train;

CREATE TABLE ticket (
    ticket_no INT,
    source VARCHAR(100),
    destination VARCHAR(100),
    class_id CHAR(100),
    fare INT,
    train_id INT,
    FOREIGN KEY (train_id)
        REFERENCES train (train_id)
);
insert into ticket values(2000100,'online','goa','AC1',1500,10020),(2000200,'online','salem','s6',650,10030);
select * from ticket;
alter table ticket modify column train_id int primary key;

CREATE TABLE fare (
    recepit_no BIGINT,
    train_id INT,
    FOREIGN KEY (train_id)
        REFERENCES ticket (train_id),
    source VARCHAR(100),
    destination VARCHAR(100),
    class VARCHAR(100),
    fare INT,
    ticket_no INT
);
insert into fare values(123456,10020,'online','goa','AC tire 1',1500,2000100),(1234567,10030,'online','salem','AC tire 2',650,2000200);
select * from fare;
alter table fare modify column fare int primary key ;
alter table fare drop primary key ;
alter table fare modify column train_id int primary key;

CREATE TABLE class (
    class VARCHAR(100),
    journey_date DATE,
    no_of_seats INT,
    train_id INT,
    FOREIGN KEY (train_id)
        REFERENCES fare (train_id)
);
insert into class values('AC tire 1','2022-07-28',2,10020),('AC tire 2','2022-08-12',3,10030);
select * from class;

CREATE TABLE times (
    reference_no INT,
    departure_time TIME,
    arrival_time TIME,
    train_id INT,
    FOREIGN KEY (train_id)
        REFERENCES train (train_id),
    station_id CHAR(100),
    FOREIGN KEY (station_id)
        REFERENCES station (station_id)
);
insert into times values(12300,'01:12:12','12:09:09',10020,'c01'),(12400,'03:12:12','11:01:09',10030,'s01');
select * from times;
alter table times modify column arrival_time time primary key;

CREATE TABLE route (
    arrival_time TIME,
    FOREIGN KEY (arrival_time)
        REFERENCES times (arrival_time),
    departure_time TIME,
    stop_no INT
);
insert into route values('12:09:09','01:12:12',18),('11:01:09','03:12:12',14);
select* from route;
select * from employee;

-- 1 --

SELECT 
    employee_name, gender = 'male', salary
FROM
    employee
WHERE
    gender = 'male'
        AND salary < (SELECT 
            (min) salary
        FROM
            employee
        WHERE
            gender = 'female');
select * from passenger;

-- 2 --

SELECT 
    passenger_name, gender, reservation_status, employee_id
FROM
    passenger
WHERE
    employee_id = 100;
    
-- 3 --

SELECT 
    train_id, source, destination, class, fare
FROM
    fare
WHERE
    source = 'online' AND fare > 650;

-- 5 --

SELECT 
    station_name, no_of_lines, no_of_platforms
FROM
    station
WHERE
    no_of_lines >= 10
        AND no_of_platforms >= 6;

-- 6 --

SELECT 
    train_id, train_name, station_id
FROM
    train
WHERE
    NOT station_id = 'c01';

-- 7  inner join --

SELECT 
    t.train_id, t.train_name, s.class
FROM
    train t
        INNER JOIN
    class s ON t.train_id = s.train_id; 

-- 8 --

SELECT 
    e.employee_id,
    e.gender,
    e.employee_name,
    e.phone_no,
    p.passenger_name,
    p.reservation_status
FROM
    employee e join
    passenger p ON e.employee_id = p.employee_id;
    
-- 9 --

SELECT 
    e.employee_id,
    e.gender,
    e.employee_name,
    e.phone_no,
    p.passenger_name,
    p.reservation_status
FROM
    employee e
   
        JOIN
    passenger p ON e.employee_id = p.employee_id
    and e.phone_no like('1234567890');
    
    -- 10 --
    
    SELECT 
    s.station_id,
    s.train_name,
    c.journey_date,
    c.class,
    c.no_of_seats
FROM
    train s
        JOIN
    class c ON s.train_id = c.train_id
        AND c.journey_date LIKE ('2022-08-12');

-- 11 --


SELECT 
    f.receipt_no,
    f.train id,
    t.train_name,
    n.class_id,
    f.source,
    f.destination,
    f.class,
    f.fare,
    f.ticket_no,
    m.departure_time,
    m.arrival_time
FROM
    fare f
        JOIN
    ticket n ON f.ticket_no = n.ticket_no
        JOIN
    time m ON m.train_id = t.train_id
        JOIN
    train t ON t.train_id = m.train_id;





