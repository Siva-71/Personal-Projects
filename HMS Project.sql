#1. Write a query in SQL to obtain the name of the physician in alphabetical order.

select name as physician_name from physician
order by name asc;

#2. Write a query in SQL to obtain the fullname of the patients whose gender is male.
select concat(name,' ',surname) as patient_name from patient
where Gender='male';

#3. Write a query in SQL to find the name of the nurse who are the head of their department and are registered.
select name as nurse_name from nurse
where position="Head Nurse" and registered = "Yes";

#7. Write a query to update the name of the patient to Robert Fernandez having patientid as 5.
update patient 
set name= "Robert", surname ="Fernandez" where patient_id=5;

#8. Write a query to drop phone column from patient table.
alter table patient
drop phone;

select * from patient;

#9. Second maximum cost of medical procedure
select cost from
(select cost,dense_rank() over (order by cost desc) as rn
from procedures) as a
where rn=2;

#11. Write a query in SQL to obtain the name of the patients whose third letter is M.
select concat(name,' ',surname) as patient_name
from patient
where concat(name,' ',surname) like "__M%";

#12. Write a query in SQL to obtain the name of the patients whose name start with letter J and ends with Z.
select concat(name,' ',surname) as patient_name
from patient
where concat(name,' ',surname) like "J%Z";

#14.  Write a query in SQL to obtain the name of the physicians who are the head of each department
select name as physician_name, position from physician
where position like "Head%";

select p.name as Doctor_name,d.dept_name
from physician p
inner join department d
on p.employeeid = d.head;

#15. Write a query in SQL to obtain the name of the patients with their physicians by whom they got their preliminary treatement
select concat(p.name,' ',p.surname) as patient_name, ph.name as physician_name 
from patient p left join physician ph
on p.primary_check=ph.employeeid;  

#16. Write a query in SQL to obtain the name of the physician with the department who are done with affiliation.
select distinct ph.name, d.dept_name 
from physician ph join affiliated_with af
on ph.employeeid=af.physicianid
join department d
on af.departmentid=d.department_id
where af.primaryaffiliation='t';

#17. Write a query to obtain physician name,position and department they are affiliated with.
select distinct ph.name, ph.position, d.dept_name 
from physician ph join affiliated_with aw
on ph.employeeid=aw.physicianid
join department d
on aw.departmentid=d.department_id; 
 
 #18. Write a query in SQL to obtain the patient name from which physician they get primary_checkup and also mention the patient diagnosis with prescription.
SELECT 
    CONCAT(p.name, ' ', p.surname) AS patient_name,
    ph.name AS physician_name,
    pd.diagnosis AS patient_diagnosis,
    pd.prescription AS patient_prescription
FROM
    patient p
        LEFT JOIN
    physician ph ON p.primary_check = ph.employeeid
        LEFT JOIN
    patient_diagnosis pd ON p.patient_id = pd.Patient_ID;
    
#19. Write a query in SQL to obtain the maximum cost of the medical procedure.
select max(cost) from procedures;    
 
#20. Write a query in SQL to obtain the details of patient who has diagnosed with chronic pain.
select * from patient
where patient_id in(select Patient_ID from patient_diagnosis where Diagnosis = "Chronic Pain");

#21. Write a query in SQL to obtain the procedure name and cost whose cost is greater than the avg cost of all the procedure.
select name from procedures where cost>(select avg(cost) from procedures);
 
 #24.  Write a query in SQL to obtain the employeeid, physician name and position whose primary affiliation has not been done. 
 select * from physician where employeeid in (select physicianid from affiliated_with where primaryaffiliation='t');