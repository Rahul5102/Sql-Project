use library;
create table book_details( ISBN int primary key,book_title varchar(100),publication_year date,languages varchar(100),category_id int,binding_id int,No_of_actual_copies int,NO_of_copies_current int);
alter table book_details modify column category_id char;
alter table book_details modify column binding_id char;
alter table book_details modify column category_id char(10);
alter table book_details modify column binding_id char(10);

insert into  book_details values(01,'Dark','2000-01-01','english','e01','b01',100,50),(02,'Light','2001-02-01','english','e02','b02',100,50),(02,'pisassu','2000-03-01','english','e03','b03',100,80);
select*from book_details;
create table binding_details(binding_id int,binding_name varchar(100));
insert into binding_details values('b01','dramatic'),('b02','dramatic'),('b03','horror');
select*from binding_details;
create table category_details(category_id int primary key,category_name varchar(100));
alter table category_details modify column category_id char;
alter table category_details modify column category_id char(10);


insert into category_details values('e01','happy'),('e02','happy'),('e03','sad');
select * from category_details;
create table borrower_details (borrower_id int,book_id int,borrowed_from_date date,actual_return_date date,issued_by int);
create table staff_details(user_id int,user_name varchar(100),is_admin char(100));
insert into staff_details values(1000,'rocky bhai','yes'),(2000,'bheem','yes'),(3000,'khaliya','yes');
create table student_details(student_id int,student_name varchar(100),sex varchar(100),DOB date,Borrower_id char(100),department varchar(100),contact_number int);
insert into student_details values(001,'akhil','male','2000-09-03','a001','computer',0000000001),(001,'jino','male','2000-07-05','j001','computer',0000000002),(003,'jose','male','2000-05-19','s001','computer',0000000003);
alter table borrower_details modify column borrower_id char(100);
insert into borrower_details values('a001',10,'2022-10-12','2022-11-01',1000),('j001',20,'2022-07-09','2022-12-09',2000);
select* from borrower_details;

select* from staff_details;
select* from student_details;
update student_details set student_id = 2 where student_name='jino';
create table shelf_details(shelf_id char(100),floor_no char(100));
insert into shelf_details values('s005','f002'),('s007','f003'),('s001','f001');
select* from shelf_details;
update book_details set ISBN = 3 where book_title='pisassu';

alter table book_details modify column ISBN int primary key;
update binding_details set binding_name = 'sad' where binding_id='b02';

update binding_details set binding_id = 1001 where binding_name='dramatic';
update binding_details set binding_id = 1002 where binding_name='sad';
update binding_details set binding_id= 1003 where binding_name='horror';
alter table binding_details modify column binding_id int;
-- 7 --
alter table book_details modify column binding_id char not null;

SELECT 
    d.book_title, d.languages,m.binding_name
FROM
    book_details d
        INNER JOIN
    binding_details m ON d.ISBN= m.binding_id;
    
    insert into book_details  values(001,'dark','2000-01-02','english',1000,1001,100,20),(002,'light','2000-02-01','english',2000,2001,100,50);
    insert into binding_details values(001,'sad'),(002,'anger');

alter table binding_details add constraint foreign key(binding_id) references book_details(ISBN);

truncate binding_details;
truncate book_details;
update category_details set category_name= 'joy' where category_id='e02';

update category_details set category_id= 1000 where category_name='happy';
update category_details set category_id= 2000 where category_name='joy';
update category_details set category_id= 203 where category_name='sad';
alter table category_details modify column category_id int;
-- 8,9 --
alter table book_details add constraint foreign key (category_id) references category_details(category_id);
SELECT 
    d.No_of_actual_copies,
    d.No_of_copies_current,
    m.category_name
FROM
    book_details d
        INNER JOIN
    category_details m ON d.category_id = m.category_id;
    
-- 10 : book and borrower table relationship --

update borrower_details set borrower_id=1 where book_id=10;
update borrower_details set borrower_id=2 where book_id=20;
alter table borrower_details modify column borrower_id int;
alter table borrower_details add constraint foreign key (borrower_id) references book_details(ISBN);
SELECT 
    d.book_title, d.languages, m.borrowed_from_date
FROM
    book_details d
        INNER JOIN
    borrower_details m ON d.ISBN = m.borrower_id;

-- 11 : relationship between student and borrower 

update student_details set Borrower_id=1 where student_name='akhil';
update student_details set Borrower_id=2 where student_name='jino';
update student_details set Borrower_id=3 where student_name='jose';
alter table student_details modify column borrower_id int primary key ;
alter table borrower_details add constraint foreign key(borrower_id) references student_details(borrower_id);
SELECT 
    d.book_id, d.issued_by, m.contact_number
FROM
    borrower_details d
        INNER JOIN
    student_details m ON d.borrower_id = m.borrower_id;
    
    -- 13 : relationship between shelf and book --
    
update shelf_details set shelf_id=2 where floor_no='f002';
update shelf_details set shelf_id=3 where floor_no='f003';
update shelf_details set shelf_id=1 where floor_no='f001';
alter table shelf_details modify column shelf_id int;
alter table book_details add constraint foreign key (ISBN) references shelf_details(shelf_id);
select d.book_title,d.languages,m.floor_no from book_details d inner join shelf_details m on d.ISBN=m.shelf.id;



    
    
    -- 12--
    
    update staff_details set user_id=1 where user_name='rocky bhai';
    update staff_details set user_id=2 where user_name='bheem';
    update staff_details set user_id=3 where user_name='khaliya';
    alter table book_details add constraint foreign key (ISBN) references staff_details(user_id);



    SELECT 
    d.student_id,
    d.student_name,
    m.book_title,
    n.staff_name,
    s.borrowed_from_date
FROM
  student_details d
        INNER JOIN
    staff_details n
     on d.borrower_id=n.user_id
     join
     borrower_details  s on s.ISBN=n.user_id
     join book_details m on m.borrower_id=s.ISBN;

