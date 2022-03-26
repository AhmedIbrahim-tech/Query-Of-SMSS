/* Start Function */

/* String Function */
Select ASCII('A') -- Return 65
Select CHAR(65)   -- Return  A
Select REVERSE('Select') -- Return tceleS
Select Len('Select')     -- Return 6
Select UPPER('Select')   -- Return SELECT
Select LOWER('Select')   -- Return select
Select RTRIM(' Select  ') -- Return Select
Select LTRIM('    Select') -- Return Select
Select LEFT('Select' , 2)  -- Return Se
Select Right('Select' , 2) -- Return ct
Select CHARINDEX('@' , 'Ahmed@gmail.com') -- Return 6
Select SUBSTRING('Ahmed@gmail.com' , 7 , 9) -- Return [ gmail.com ]
Select REPLICATE('Ahmed' , 3) -- Return [ AhmedAhmedAhmed ]
Select Space(5) -- Return [Space]
Select REPLACE(Email , 'gmail.com' , 'yahoo.com') from tblperson
Select Stuff(Email , 2 , 3 , '******') from tblperson
Select AVG(Price) from tblperson -- المتوسط

select * from tblperson
/*Date Time */
Select GETDATE()
Select CURRENT_TIMESTAMP
Select SYSDATETIME()
Select SYSDATETIMEOFFSET()
Select GETUTCDATE()
Select SYSUTCDATETIME()

Select ISDATE('Ahmed') -- Return 0 It's Means False --
Select ISDATE(GETDATE()) -- Return 1 It's Means True --
Select DAY(GETDATE())
Select DAY('09/05/1998')

Select Month(GETDATE())
Select Month('09/05/1998')

Select Year(GETDATE())
Select Year('05/09/1998')

Select	DATENAME(DAY , '09/05/1998')
Select	DATENAME(WEEKDAY , '09/05/1998')
Select	DATENAME(MONTH , '09/05/1998')
Select	DATENAME(YEAR , '09/05/1998')s


Select	DATENAME(DAY , GETDATE())
Select	DATENAME(WEEKDAY , GETDATE())
Select	DATENAME(MONTH , GETDATE())
Select	DATENAME(YEAR , GETDATE())


Select	Datepart(WEEKDAY , '09/05/1998') -- Return Day by int Like : 7
Select	DATENAME(WEEKDAY , '09/05/1998') -- Return Day by Name Like : Saturday

Select DATEADD(DAY , 20 , GETDATE())
Select DATEADD(DAY , -20 , GETDATE())

Select DATEDIFF(YEAR , '09/05/1998' , GETDATE())
Select DATEDIFF(MONTH , '09/05/1998' , GETDATE())

Select CAST(GETDATE() as date)
Select Convert(nvarchar ,  GETDATE() , 101)


/* MAth Function */
Select ABS(-105.5)
Select CEILING(105.5)
Select FLOOR(106.5)
Select POWER(9 , 3)
Select SQUARE(9)
Select SQRT(81)
Select RAND() -- return Each Time Different Numbers
Select RAND(1) -- return Each Time The Same Number 




-- Create Table Date Time

Create Table tblDOB(
ID int Primary Key Not Null Identity(1,1) ,
Name nvarchar(50),
DateOfBirth datetime,
)

insert into tblDOB Values ('Mahmpud' , '10/28/1994')
insert into tblDOB Values ('Ahmed' , '09/05/1998')
insert into tblDOB Values ('Mohmamed' , '09/25/2001')
insert into tblDOB Values ('Sara' , '09/25/2001')

select * from tblDOB

/* Cast / Convert  */ -- To Convert Datatype To Anthor Datatype

Select * , CAST(DateOfBirth as nvarchar) As [Date Birth] from tblDOB
Select * , Convert(nvarchar , DateOfBirth , 101) As [Date Birth] from tblDOB

select CAST(GETDATE() as nvarchar(20))
select CAST(GETDATE() as date)
Select CONVERT(nvarchar(20) , GETDATE() , 103)
Select CONVERT(date , GETDATE() , 103)

/*
101 = mm/dd/yyyy
102 = yy.mm.dd
103 = dd/mm/yyyy
104 = dd.mm.yyyy
105 = dd-mm-yyyy
*/

/*Example For String Functions*/
/*EX 1 */
Declare @Start int
Set @Start = 65
While (@Start <= 90) 
Begin
Print CHAR (@start)
Set @Start = @Start + 1
End

/*EX 2 */
Select RTRIM(LTRIM( UPPER( Name))) ,  SUBSTRING(Email , CHARINDEX('@' , Email) + 1 , len(Email) - CHARINDEX('@' , Email) + 1) as Email
From tblperson 

/*EX 3 */
Select SUBSTRING(Email , CHARINDEX('@' , Email) + 1 , len(Email) - CHARINDEX('@' , Email) + 1) as Email , COUNT(Email) as CountTotal
From tblperson 
group by
SUBSTRING(Email , CHARINDEX('@' , Email) + 1 , len(Email) - CHARINDEX('@' , Email) + 1)

/*EX 4 */
Select Name , SUBSTRING(Email , 1 , 1) + REPLICATE('*' , 5) + SUBSTRING(Email , CHARINDEX('@' , Email) , Len(Email) - CHARINDEX('@' , Email)  + 1 ) As Email
From tblperson


/*EX 5 */
Select Email , PATINDEX('%gmail.com' , Email) as FirstOccurence
From tblperson
Where PATINDEX('%gmail.com' , Email) > 0

/*EX 6 */
Select Email , REPLACE(Email , 'gmail.com' , 'yahoo.com') as FirstOccurence from tblperson

/*EX 7 */
Select Email , STUFF(Email , 2 ,3 , '*********') as FirstOccurence from tblperson




/* Example For Date Time */
-- Ex 1

DECLARE @DOB DATETIME, @tempdate DATETIME, @years INT, @months INT, @days INT
Set @DOB = '09/05/1998'
SELECT @tempdate = @DOB

SELECT @years = DATEDIFF(YEAR, @tempdate, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(YEAR, @years, @tempdate)

SELECT @months = DATEDIFF(MONTH, @tempdate, GETDATE()) - CASE WHEN DAY(@DOB) > DAY(GETDATE()) THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(MONTH, @months, @tempdate)

SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE())

Select @years as Years , @months as Months , @days as Days , @tempdate As [Temp Of Date]



/* Example For ( Cast / Convert ) */
/* EX 1 */
Select ID , Name , CAST(DateOfBirth as nvarchar(20)) as BOD , Name + ' - '+ Cast(ID as nvarchar(20)) as [Name - ID] from tblDOB

/* EX 2 */
Select CAST(DateOfBirth as date) As [Reg - Date] , COUNT(ID) as [Reg - Total] from tblDOB
group by CAST(DateOfBirth as date)


/* Example For Math Function */
-- Ex 1
Declare @Counter Int
Set @Counter = 1
while (@Counter <= 10)
Begin
Print Floor(Rand() * 1000)
Set @Counter = @Counter + 1
End

-- Ex 2

Select FLOOR(RAND() * 100)

-- Ex 3
Select FLOOR(RAND() * 100)


/* End Function */

