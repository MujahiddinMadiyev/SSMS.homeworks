create database Homework_sql1

create table Students (StudentID int, FullName varchar(50), Age int, GPA decimal(3, 2))

alter table Students
add Email varchar(50)

exec sp_rename 'Students.Fullname', 'Name', 'Column'

alter table Students
drop column Age

truncate table Students

select @@SERVERNAME as [SQL Homework 1]

select GETDATE()

select * from Students