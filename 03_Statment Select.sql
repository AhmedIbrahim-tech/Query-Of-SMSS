
/* Start Select Statment */

select * from tblperson /* To Show All Data */
Select name from tblperson /* To Show Row name only */
Select distinct Age from tblperson /* To Show to without Repeat */
Select distinct GenderID,Age from tblperson /* To Show to without Repeat */
Select * from tblperson where Age != 33 Or Age = 60
Select * from tblperson where Age != 33 And Age != 60
Select * from tblperson where Age in (33 , 22 , 60)
Select * from tblperson where Age between 33 And  60
Select * from tblperson where Name Like 'A%'
Select * from tblperson where Name Not Like 'A%'

Select * from tblperson where Name Like '_Y_'      /*  "_"  It's Means one Character Before "Y" And One Char After */
Select * from tblperson where Name Not Like '_Y_' 

Select * from tblperson where Name Like '[AYS]%' /* "[AYS]" It's Means Any Name Start by A,Y,S */
Select * from tblperson where Name Not Like '[AYS]%'

Select * from tblperson where Name Like '[^AYS]%'  /* "[^AYS]" It's Means Any Name don't Start by A,Y,S */
Select * from tblperson where Name Not Like '[^AYS]%'

Select * from tblperson Where (City = 'London' or City = 'Egypt') and Age > 33

Select * from tblperson order by Age desc
Select * from tblperson order by Age asc

Select top 50 percent * from tblperson where age = 22

Delete from tblperson where ID = 7

/* End Select Statment */




/*Show All Data In Tables */



Select Count(*) as Total from tblperson where age between 20 and 25

Select * from tblperson where City Like '%E%'


SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';


SELECT * FROM Customers
WHERE Country='Germany' OR City='Berlin';

SELECT * FROM Customers
WHERE NOT Country='Germany'

SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='München')

SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';

