-- Indexes
/*
هو ترتيب للكيويري حيث يساعد علي ايجاد البيانات المطلوبة بشكل سريع --

-- Type Of Index 

01- Clustered Index         == In general is Primary Key == In The Table Can Have Only One Clustered Index. However The index can Contain Multiple Columns and calls it (Composite Index) 
							   but at First Delete To Index for Primary Key .

02- Non-Clustered Index		 == In general All Index is Non-Clustered Index

03 - Unique Index			== is used to Make Value non-duplicate , I Can't Create Index in Table Contains Value duplicate , And There is no difference between a unique index and a unique constraint

4. Filtered
5. XML
6. Full Text
7. Spatial
8. Columnstore
9. Index with included columns
10. Index on computed columns
*/

select * from tblperson

-- Ex 1
Create Index IX_tblperson_age
on tblperson (age ASC)

-- Ex 2
Create Clustered Index IX_tblperson_age_City
on tblperson (age ASC , City Desc)

-- Ex 3
Create NonClustered Index IX_tblEmployee_Name
ON tblperson(Name)

--Ex 4
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblperson(FirstName, LastName)

-- There is no difference between a unique index and a unique constraint

ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)


Select * From tblperson
Where Age > 20 and age < 40


-- To You Know Index In Table
Execute sp_helpindex tblperson