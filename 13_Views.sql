-- Views --

/*
Views It's Not More Difference About Store Proc
*/

-- SQL Script to create tblEmployee table:
CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

-- SQL Script to create tblDepartment table: 
CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

-- Insert data into tblDepartment table
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

-- Insert data into tblEmployee table
Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)


-- To Create Views Ex 1
Create View vWEmployeesByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId


-- Ex 2

Create View vWEmployeesCountByDepartment
as
Select DeptName, COUNT(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
Group By DeptName


-- Ex 3
Create View vWITDepartment_Employees
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
where tblDepartment.DeptName = 'IT'


-- To Show View
SELECT * from vWEmployeesByDepartment

-- To modify a view
ALTER VIEW vWEmployeesByDepartment

--To look at view definition - 
sp_helptext vWEmployeesByDepartment

--To Drop a view - 
DROP VIEW vWEmployeesByDepartment


/********************************************************************************************************************************************************/
-- Updateable Views

Create view vWEmployeesDataExceptSalary
as
Select Id, Name, Gender, DepartmentId
from tblEmployee

/*********************/
Select * from vWEmployeesDataExceptSalary

/*********************/

Update vWEmployeesDataExceptSalary 
Set Name = 'Mikey' Where Id = 2

/*********************/

Delete from vWEmployeesDataExceptSalary where Id = 2

/*********************/

Insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2)

/*********************/

Update vwEmployeeDetailsByDepartment 
set DeptName='IT' where Name = 'John'

/*
If a view is based on multiple tables, and if you update the view, it may not update the underlying base tables correctly.
To correctly update a view, that is based on multiple table,[ INSTEAD OF triggers ] are used.
*/



/********************************************************************************************************************************************************/

-- Indexed Views

Create Table tblProduct
(
 ProductId int primary key,
 Name nvarchar(20),
 UnitPrice int
)

Create Table tblProductSales
(
 ProductId int,
 QuantitySold int
)

Insert into tblProduct Values(1, 'Books', 20)
Insert into tblProduct Values(2, 'Pens', 14)
Insert into tblProduct Values(3, 'Pencils', 11)
Insert into tblProduct Values(4, 'Clips', 10)


Insert into tblProductSales values(1, 10)
Insert into tblProductSales values(3, 23)
Insert into tblProductSales values(4, 21)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 13)
Insert into tblProductSales values(3, 12)
Insert into tblProductSales values(4, 13)
Insert into tblProductSales values(1, 11)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 14)




Create view vWTotalSalesByProduct
with SchemaBinding
as
Select Name, 
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales, 
COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name



select * from tblProduct
select * from tblProductSales
select * from vWTotalSalesByProduct


Create Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)


/********************************************************************************************************************************************************/

--Limitations of views

/*
1. You cannot pass parameters to a view. Table Valued functions are an excellent replacement for parameterized views.

-- Error : Cannot pass Parameters to Views
Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender

Table Valued functions can be used as a replacement for parameterized views.
Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)


2. Rules and Defaults cannot be associated with views.


3. The ORDER BY clause is invalid in views unless TOP or FOR XML is also specified.

Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id

4. Views cannot be based on temporary tables.

Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

*/