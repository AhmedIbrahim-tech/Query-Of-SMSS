/*Start Group by */

Select Name, Sum(ID) as [Total Age] from tblperson 
group by Name
having Name = 'Aya'

Select Name, Sum(ID) as [Total Age] from tblperson 
where Name = 'Egypt'
group by Name

Select Name, Sum(ID) as [Total Age] from tblperson 
group by Name
having Name = 'Damas'

Select Name, Sum(ID) as [Total Age] from tblperson 
group by Name
having Sum(GenderID) > 50

/*
	** We Use Having To Fliter 
	** We Have Use Having After Group By 
		I Can't Use Having Before Group By 
*/

/*
	***	 Different Between Where And Having ? ***
	*01* Where We Can Use With Select , Insert And Update But Having We Can Use Only Select 
	*02* We Have Use Having After Group By I Can't Use Having Before Group By but Where We Have Use Before Group By
	*03* We Can't Use Where With Math Operation Like (Sum , Avg , Max) But We Use Having
*/

/*End Group by */
