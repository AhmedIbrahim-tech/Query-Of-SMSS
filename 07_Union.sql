/* Start Union */
Select ID , Name from tblperson
Union 
Select ID , Name from tblGender

Select ID , Name from tblperson
Union All
Select ID , Name from tblGender

/* Important Tips : Must Rows In Tabels Are Same One  */

/* End Union */
