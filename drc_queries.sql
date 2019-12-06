/*QUERIES*/

/*Provide a list of all DRC students for this quarter. */
select STUDENT_ID, FIRST_NAME, LAST_NAME 
from STUDENT; 

/*Provide a list of all Professors that teach at Cal Poly. */
select PROFESSOR_ID, FIRST_NAME, LAST_NAME 
from PROFESSOR; 
	
/*Provide a list of all of the exams taken at the DRC this quarter. */
Select EXAM_ID, CLASS_ID, STUDENT_ID, DATE_ADMINISTERED,  MATERIALS_ALLOWED from EXAM E
Join EXAM_STUDENT_MAP ESM on ESM.EXAM_ID = E.EXAM_ID
		
/*Provide a list of all the disabilities and the accompanying accommodations. */ 	
select D.DISABILITY_ID, NAME, ACCOMMODATION_ID
from DISABILITY D
Join DISABILITY_ACCOMMODATION_MAP DAM on DAM.DISABILITY_ID = D.DISABILITY_ID
Group by D.DISABILITY_ID, NAME, ACCOMMODATION_ID;

/*What are the accommodations that DRC students can utilize? */
Select ACCOMMODATION_ID, NAME, DESCRIPTION
from ACCOMMODATION

/*What is the most common disability?*/
select distinct(DISABILITY_ID), count(STUDENT_ID) from STUDENT_DISABILITY_MAP
group by DISABILITY_ID
order by count(STUDENT_ID) desc; 

/*What accommodation is the most common accommodation? */
select count(DISABILITY_ID), (A.ACCOMMODATION_ID) from ACCOMMODATION A
join DISABILITY_ACCOMMODATION_MAP DAM on A.ACCOMMODATION_ID = DAM.ACCOMMODATION_ID
group by A.ACCOMMODATION_ID
order by count(DISABILITY_ID) desc;

/*What accommodation is the least common accommodation? */
select count(DISABILITY_ID), (A.ACCOMMODATION_ID) from ACCOMMODATION A
join DISABILITY_ACCOMMODATION_MAP DAM on A.ACCOMMODATION_ID = DAM.ACCOMMODATION_ID
group by A.ACCOMMODATION_ID
order by count(DISABILITY_ID) asc;

/*Which student had to take the most tests this quarter? */
select distinct(STUDENT_ID), count(EXAM_ID) from EXAM_STUDENT_MAP
group by STUDENT_ID
order by count(EXAM_ID) desc;
 
/*How many sections does Professor Erickson teach? */	
Select count(CLASS_ID), FIRST_NAME, LAST_NAME from CLASSES C
Join PROFESSOR P on P.PROFESSOR_ID = C.PROFESSOR_ID
Where LAST_NAME = 'Erickson' and FIRST_NAME = 'Gregg'
GROUP BY FIRST_NAME, LAST_NAME

