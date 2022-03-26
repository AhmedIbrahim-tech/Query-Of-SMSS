/* Create database */
create database LearnSQLServer

/* Update database's Name */
Alter database SampleDatabase modify name = LearnSQLServer

-- Alter Name of Database by Stored Procedure --
-- sp_renamedb [Old Db Name] , [New DB Name]
/* 
sp_renamedb 'SampleDatabase','LearnSQLServer'; 
*/

/* Delete Database */
drop database LearnSQLServer

/* I Can't Drop Db If Connect With Anthor Server or Pc */


/**************************************************************************************************/
-- Data type -- 
/*
	******  String Data Types  ******

	** char(n)			Reserves the slots even if you don't use them
	** varchar(n)		Reserves the digits from 1 to [n]
	** varchar(max)		Variable width character string	1,073,741,824 characters	2 bytes + number of chars

	** nchar			Same as the previous one but used to store non-English characters
	** nvarchar			Same as the previous one but used to store non-English characters	 
	** nvarchar(max)	Same as the previous one but used to store non-English characters



*/

/**************************************************************************************************/


/* Create Table In Database 
	And Add [Use To Go Database]
*/
use LearnSQLServer
GO
create table tblperson(
ID int Not Null Primary key,
Name nvarchar(50),
Email nvarchar(100),
GenderID int Not null
)

create table tblGender(
ID int Not Null Primary key,
Name nvarchar(50),
)

create table tblEmployee(
ID int Not Null Primary key,
Name nvarchar(50),
Salary int,
Department int Not null
)

Create table tblDepartment(
ID int Not null Primary Key , 
Name nvarchar (50), 
)

Create table tblperson1(
ID int identity(1,1) Not null Primary Key , 
Name nvarchar (50), 
GenderID int Not Null ,
Foreign Key (GenderID) References tblGender(ID)
)

/* Alter Table and add relationship || Reference */
Alter Table tblperson 
add Constraint FK_tblperson_GenderID 
foreign key (GenderID) references tblGender(ID)

/* Update Table and add column */
Alter table tblperson add Email nvarchar(50)

/* Delete column in Table */
Alter table tblperson drop column Email

/* update column in Table */
Alter table tblperson alter column Email char(20)

/* Delete Table */
Drop table tblEmployee

/**************************************************************************************************/

/* Add Data To table */
INSERT INTO tblGender ( ID, Name) Values (1 , 'Male')
INSERT INTO tblGender Values (2 , 'Female')
INSERT INTO tblGender Values (3 , 'NuKnown')

insert into tblperson Values (1 ,'Aya' ,'Aya@gmail.com'  , 2);




/* Delete Table */
Drop table tblEmployee -- Drop The Table 
Delete from tblperson --  Delete All Data Not The Table From a Table
Delete from tblperson where ID = 7

/* Update Table */
Update tblperson set Age = 50 where ID = 1
Update tblperson set Age = 15 where age = 50
