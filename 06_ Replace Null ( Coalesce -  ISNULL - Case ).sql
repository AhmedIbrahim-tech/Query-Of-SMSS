/* Replace Null */
select * from tblEmployee

Create table tblEmployee(
ID int Not Null Primary Key Identity (1,1),
FirstName nvarchar(50),
MiddelName nvarchar(50),
LastName nvarchar(50),
)

insert into tblEmployee Values('Ahmed' , Null , Null);
insert into tblEmployee Values(NULL , 'Ibrahim' , NULL);
insert into tblEmployee Values(Null , Null , 'Awad');

select  ID , Coalesce(FirstName , MiddelName , LastName ) As FullName from tblEmployee

Select P.Name as Name , coalesce( GenderID , 'UNKOWN') As Gender from tblperson P
inner Join tblGender G
on P.GenderID = G.ID


Select P.Name as Name , ISNull( GenderID , 'UNKOWN') As Gender from tblperson P
inner Join tblGender G
on P.GenderID = G.ID



/* CASE Examples */
-- Ex 01
SELECT OrderID, Quantity,
CASE 
WHEN Quantity > 30 THEN 'The quantity is greater than 30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

-- Ex 02
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);


/* Replace Null */

