-- User Defined Functions 


/* A - Scalar Valued Functions 
	It's Return Datatype Like Int , Nvarchar , etc;
*/

CREATE FUNCTION CalcAge(@DOB Date)
RETURNS INT  
AS  
BEGIN  
 DECLARE @Age INT  
 SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END  
 RETURN @Age  
END

------------------------------------------------
--The Answer

Select Sample01.dbo.CalcAge('09/05/1998')
------------------------------------------------





/* B - Inline Table Valued functions
	It's Return Table
	Whitout 'Begin And End
 */

Select * From tblperson

Create Function FN_PersonbyCity(@City NvarChar(30))
returns Table
As
return (Select ID , Name , Email , Age , City , GenderID from tblperson Where City = @City)

------------------------------------------------
--The Answer

Select * from dbo.FN_PersonbyCity('Egypt')
------------------------------------------------



/* C - Multi-Statement Table Valued functions
	It's Return Table With Param
	
*/

Create Function FN_MultSta_PersonbyCity(@City nvarchar(50))
returns @table Table (ID int , Name nvarchar(50), Email nvarchar(50), Age int , City nvarchar(50))
As
Begin
Insert Into @table
Select ID , Name , Email , Age , City  from tblperson Where City = @City
return
End

------------------------------------------------
--The Answer

Select * from dbo.FN_MultSta_PersonbyCity('Egypt')
------------------------------------------------


/*
-- To Update 
Use Alter Function [function_Name]

-- To Delete 
Use Drop Function [function_Name]

*/