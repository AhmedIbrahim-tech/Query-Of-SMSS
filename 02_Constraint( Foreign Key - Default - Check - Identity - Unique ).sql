/* Start Constraint */

/* Add Constraint Foreign key For GenderId */
ALTER TABLE tblperson
ADD CONSTRAINT FK_tblPerson_GenderId
Foreign Key (GenderID) references GenderID(ID)


/* Add Constraint Default For GenderId */
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);

ALTER TABLE tblperson
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 3 FOR GenderID

/* Add Constraint Default For Age */
Alter table tblperson 
Add Constraint DF_tblperson_age 
Default 33 for Age

/* Add Constraint Check For Age */
Alter table [dbo].[TblPerson] add constraint CK_tblperson_Age 
Check (Age > 0 and Age < 150)

/* Drop constraint from Table */
Alter table tblperson Drop constraint FK_tblperson_GenderID

-- DROP a DEFAULT Constraint
/* 
ALTER TABLE Persons ALTER COLUMN City DROP DEFAULT;
*/


/*start Unique*/

CREATE TABLE tblPersons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
	Email nvarchar(50) UNIQUE
);


Alter Table TblGender 
Add Constraint UQ_TblGender_Name 
Unique(Name)


Alter Table tblperson 
Drop Constraint UQ_tblperson_Email

/*End Unique*/






/* Delete Constraint Default For GenderId */
Alter Table tblperson Drop constraint DF_tblPerson_GenderId

/* End Constraint */



/* Start Identity Insert */

SET IDENTITY_INSERT tblperson1 OFF -- or ON

insert into tblperson (Name) Values ('Mohmaoud');

/* Delete All Data From Table */
Delete from tblperson

/* To Set Id Reset From 0 */
DBCC CheckIdent(tblperson1 , reseed , 0)

/* End Identity Insert */


