/* Start Join */

Select * from tblperson p
Inner Join tblGender
on p.GenderID = tblGender.ID

Select Age , City , GenderID from tblperson
Left outer Join tblGender
on tblperson.GenderID = tblGender.ID

Select Age , City , GenderID from tblperson
Right outer Join tblGender
on tblperson.GenderID = tblGender.ID

Select Age , City , GenderID
from tblperson
Full outer Join tblGender
on tblperson.GenderID = tblGender.ID

Select Age , City , GenderID
from tblperson
Cross Join tblGender


/* Advanced */

Select P.Name as Name , Age , City , GenderID from tblperson P
Inner Join tblGender G
on P.GenderID = G.ID

Select Age , City , GenderID from tblperson P
Left Join tblGender G
on P.GenderID = G.ID
Where P.GenderID is Null

Select Age , City , GenderID from tblperson P
Right Join tblGender G
on P.GenderID = G.ID
Where P.GenderID is Null

Select Age , City , GenderID from tblperson P
Full Join tblGender G
on P.GenderID = G.ID
Where P.GenderID is Null or G.ID is null



/* Self Join */
-- in a same table
SELECT [E.Name] AS [Name], [M.Name] AS Managar
from Customers E
inner join Customers M
on e.EmployeeID = M.ManagerID

/* End Join */

