/* Start Stored Procedures */

Create Proc SPtblpersonOrderbyAge
with encryption
As
Begin
Select * From tblperson order by Age
End

/*********************************************************************/

Create Proc SPInnerJointblpersonWithtblGender
As
Begin
Select * from tblperson P
Inner Join tblGender G
On P.GenderID = G.ID
End

/*********************************************************************/

Create Proc SPInnerJointblpersonWithtblGender2
With encryption
As
Begin
Select * from tblperson P
Inner Join tblGender G
On P.GenderID = G.ID
End

/*********************************************************************/

Create Proc SPtblpersonOrderbyParam
@Age int , 
@City nvarchar(50)
As
Begin
Select * From tblperson Where @Age = Age and @City = City
End

/*The Solve*/

SPtblpersonOrderbyParam 22 , 'Egypt';

Exec SPtblpersonOrderbyParam 22 , 'Egypt'

Execute SPtblpersonOrderbyParam 22 , 'Egypt'

/*********************************************************************
				 Stored Procedures With Output 
*********************************************************************/

Create Proc SpGetParamOutBySumAgeandCity
@City nvarchar(20) ,
@Age int output
as
Begin
Select * From tblperson Where City = @City or Age = @Age
End

declare @totalEmpl
exec SpGetParamOutBySumEmployeeandGender 'male' , @totalempl out
print @totalempl

Create Proc SpGetParamOutBySumEmployeeandGender
@Gender nvarchar(20) ,
@EmployeeCount int output
as
Begin
Select @EmployeeCount = Count(ID) From tblperson Where Gender = @Gender
End


/*The Solve */
Declare @TotalCount int
Execute SpGetParamOutBySumAgeandCity 'Egypt' , @TotalCount out

if(@TotalCount Is Null)
print 'The Total Equal Null'
else
print 'The Total Not Equal Null'

print @TotalCount



/*********************************************************************
					Alter Stored Procedures  
*********************************************************************/

Alter Proc SpGetParamOutBySumAgeandCity2
@ID int ,
@Name nvarchar(20) output
as
Begin
Select @Name = Name From tblperson Where @ID = ID
End


/*The Solve */

Declare @TotalCount nvarchar(20)
Execute SpGetParamOutBySumAgeandCity2 2 , @TotalCount out
print @TotalCount

if(@TotalCount Is Null)
print 'The Total Equal Null'
else
print 'The Total Not Equal Null'

/*********************************************************************/

Create Proc SpGetParamOutBySumAge
as
Begin
return( Select Count(ID) From tblperson)
End

/*The Solve */
Declare @TotalCount int
Execute @TotalCount = SpGetParamOutBySumAge
print @TotalCount

/* Tip :
		" return " Is Return Only Datatype " Int "
*/
/*********************************************************************/

sp_help tblperson
sp_help SpGetParamOutBySumAgeandCity
sp_helptext SpGetParamOutBySumAgeandCity
sp_depends SpGetParamOutBySumAgeandCity

/*********************************************************************/


/*********************************************************************
					Drop Stored Procedures  
*********************************************************************/

drop proc dbo.SpGetParamOutBySumAge

/* End Stored Procedures */
