-- #PersonDetails is a local temporary table, with Id and Name columns.

/*
the temporary table is different from the Param table.
The Param table Created in DB Until You Delete Them
But 
temporary table get Created in The TempDB and is auto-delete when you is no longer used
*/

Create Table #PersonDetails(Id int, Name nvarchar(20))

-- Insert Data into the temporary table:
Insert into #PersonDetails Values(1, 'Mike')
Insert into #PersonDetails Values(2, 'John')
Insert into #PersonDetails Values(3, 'Todd')

-- Select the data from the temporary table:
Select * from #PersonDetails

/*How to check if the local temporary table is created
Temporary tables are created in the TEMPDB. Query the sysobjects system table in TEMPDB. The name of the table, is suffixed with lot of underscores and a random number.
For this reason you have to use the LIKE operator in the query.
*/
Select name from tempdb..sysobjects 
where name like '#PersonDetails%'

-- Delete Data From the temporary table:
DROP TABLE #PersonDetails


Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert into #PersonDetails Values(1, 'Mike')
Insert into #PersonDetails Values(2, 'John')
Insert into #PersonDetails Values(3, 'Todd')

Select * from #PersonDetails
End




/* How to Create a Global Temporary Table:
To create a Global Temporary Table, prefix the name of the table with 2 pound (##) symbols. EmployeeDetails Table is the global temporary table, as we have prefixed it with 2 ## symbols.
*/

Create Table ##EmployeeDetails(Id int, Name nvarchar(20))


/*
Difference Between Local and Global Temporary Tables:
1. Local Temp tables are prefixed with single pound (#) symbol, where as gloabl temp tables are prefixed with 2 pound (##) symbols.

2. SQL Server appends some random numbers at the end of the local temp table name, where this is not done for global temp table names.

3. Local temporary tables are only visible to that session of the SQL Server which has created it, where as Global temporary tables are visible to all the SQL server sessions

4. Local temporary tables are automatically dropped, when the session that created the temporary tables is closed, where as Global temporary tables are destroyed when the last connection 
that is referencing the global temp table is closed.
*/