select *from student
insert into student(reg,adate,name,fname,gender,class,section,dob,father_cont,father_occ,address,tuition,concession,withdraw,withdraw_class,status) values (3434,'2021-09-19','Alina','Khan','female','7','A','2021-11-19','09348984','worker','xyz',7878,77,'2021-11-19','8','left')
insert into student(reg,adate,name,fname,gender,class,section,dob,father_cont,father_occ,address,tuition,concession,withdraw,withdraw_class,status) values (545,'2021-09-19','Aliya','Khan','female','7','A','2021-11-19','09348984','worker','xyz',7878,'sibling','2021-11-19','8','left')
insert into student(reg,adate,name,fname,gender,class,section,dob,father_cont,father_occ,address,tuition,concession,withdraw,withdraw_class,status) values (5666,'2021-09-19','Anaya','Khan','female','7','A','2021-11-19','09348984','worker','xyz',7878,'sibling','2021-11-19','8','left')

insert into student(reg,adate,name,fname,gender,class,section,dob,father_cont,father_occ,address,tuition,concession,withdraw,withdraw_class,status,session) values (121,'2021-09-19','Amina','Khan','female','6','A','2021-11-19','04444984','worker','xyz',738,'sibling','2021-11-19','8','left',(select session from sessiont where status = 'active'))
insert into student(reg,adate,name,fname,gender,class,section,dob,father_cont,father_occ,address,tuition,concession,withdraw,withdraw_class,status,session) values (234,'2021-09-19','Amina','Khan','female','6','A','2021-11-19','0422284','officer','xyz',738,'sibling','2021-11-19','8','left',(select session from sessiont where status = 'active'))
insert into student(Withdraw,withdraw_class) values ('2021-09-19','7') where reg
update student set withdraw = '2021-09-19',withdraw_class='7' where reg=234
update student set withdraw = null,withdraw_class=null 
alter table student add  aclass varchar(25)

select *from staff
select *from admin

update staff set category = 'teaching'

select fname as 'father\'s name' from student
drop concession from student

alter table student drop column concession
alter table student add concession varchar(20)

select *from classt
insert into classt values('Prep')

select *from sessiont
insert into sessiont values ('2019-2020','active') 
select *from student
select reg as 'Registration no.', adate as 'Admission date', name as 'Name', fname as 'Father name', gender as 'Gender', class as 'Class', section as 'Section', dob as 'Date of Birth',father_cont as 'Father contact', father_occ as 'Father occupation', address as 'Address',tuition as 'Tuition',concession as 'Concession type' from student where status != 'left'          
update student set status = 'active'    
update student set status = 'left' where reg = 676767    

update student set aclass all (select class from student)

alter table sessiont add status varchar(20)

insert into sessiont values ('2020-2021', 'active'),('2019-2020','inactive'),('2018-2019','inactive') and status ='inactive' where status = 'active'
alter table set status = 'inactive'

update student set session = (select session from sessiont where status = 'active')
select *from student
select session from sessiont where status = 'active'
update sessiont set status = 'inactive ' where session = '2019-2020'

select *from  subjectt
alter table
drop table subjectt

create table subjectt (subject varchar(20) primary key)
create table subclass(subject varchar(20), class varchar(25) primary key(subject,class))
alter table subclass add constraint f1 foreign key(subject) references subjectt(subject)
alter table subclass add constraint f2 foreign key(class) references classt(class)
select *from subclass

insert into subjectt values ('English'),('Science')
insert into subclass values ('English','6'),('English','7'),('Science','6'),('English','3')


create table annual(reg int,class varchar(25),section char(1),session char(9) primary key(reg,class,section,session))
create table annual(regi int,class varchar(25),section char(1),session char(9) primary key(regi,class,section,session))
select *from annual
alter table annual add constraint f99 foreign key( regi) references student(reg)
alter table annual drop constraint f99


insert into annual values (33,'7','A','2019-2020'),(33,'8','A','2020-2021')
delete from annual
drop table annual

select CONSTRAINT_NAME
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where TABLE_NAME = 'student'

alter table student drop constraint FK__student__class__29572725
alter table student drop constraint FK__student__section__2A4B4B5E
alter table student drop constraint FK__student__session__2B3F6F97

alter table student drop column class
alter table student drop column section
alter table student drop column session


select reg as 'Registration no.', adate as 'Admission date', name as 'Name', fname as 'Father name', gender as 'Gender', class as 'Class', section as 'Section', dob as 'Date of Birth',father_cont as 'Father contact', father_occ as 'Father occupation', address as 'Address',tuition as 'Tuition',concession as 'Concession type' from student,annual where student.reg=annual.regi
 and status = 'active'  and session = '2020-2021'       

 select *from sessiont

select *from student,annual where student.reg=annual.regi
update student set status='active'
 and session = '2020-2021'
 where session = ''

 select *from student
 update student set father_occ='player',tuition=900 where reg =122

 select *from student,annual where student.reg=annual.regi 
update student set status = 'active'
 and class='8'

 alter table student add withdraw_session char(9)

 select reg as 'Registration no.', adate as 'Admission date', name as 'Name', fname as 'Father name', gender as 'Gender', aclass as 'Admission class', section as 'Section', dob as 'Date of Birth',father_cont as 'Father contact', father_occ as 'Father occupation', address as 'Address',withdraw as 'Withdrawal date',withdraw_class as 'withdrawal class',tuition as 'Tuition',concession as 'Concession type' from student,annual where student.reg=annual.regi and withdraw_session = '2020-2021' and status = 'left'

 select reg as 'Registration no.', adate as 'Admission date', name as 'Name', fname as 'Father name', gender as 'Gender', aclass as 'Admission class', section as 'Section', dob as 'Date of Birth',father_cont as 'Father contact', father_occ as 'Father occupation', address as 'Address',withdraw as 'Withdrawal date',withdraw_class as 'withdrawal class',tuition as 'Tuition',concession as 'Concession type' from student,annual where student.reg=annual.regi and withdraw between '2021-09-24' and '2021-09-24' and status = 'left'

 select reg as 'Registration no.',  name as 'Name', fname as 'Father name' from student,annual where student.reg=annual.regi and status = 'active'  and session = (select session from sessiont where status = 'active')
  and  class = '8' and section ='A' 


 select *from login

 insert into login values ('admin','123')

 create table test(no int , name varchar(9), primary key(no, name)) 
 insert into test values (1,'ali'),(2,'sana'),(3,'aliya'),(4,'saba'),(5,'sibgha'),(6,'Hina')
  alter table test add state varchar(20)
 select *from test
 drop table test

 select session from sessiont where status = 'active'
update test set state = 'hiiiii'
create view sum as (select session from sessiont where status = 'active')
select *from sum
select *from test
insert into test(9,sum)

select *from annual
insert into annual where class =
select nxt_word from classt where class=1

alter table annual add constraint ff foreign key (class) references classt(class)

drop table income
select *from income
delete from income
insert into income(session) values ((select session from sessiont where status = 'active'))
select *from classt,sectiont
create table income (id int primary key identity(1,1),session char(9),month varchar(15),class varchar(25),section char(1),amount int)

insert into income(session,month,class,section,amount) values ((select *from sum),'January','Prep','A',7687)

select sum(amount) from income where month = 'February' and session = (select session from sessiont where status = 'active')

select month,sum(amount) from income  where session = (select *from sum) group by month
select *from expense
select *from income
alter table expense add amount int

create view profit as select amount as 'income amount' from income, amount as 'expense amount' from expense
select amount as 'income' from income, amount as 'expense' from expense
select sum(amount) from income where session = '2020-2021'

select *from staff
update staff set status='active'
alter table staff add salary int
select *from admin
update staff set qual = 'MA',status='inactive' where name = 'adf'
alter table staff set 