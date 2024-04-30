/*
- Table
. patients
patient_id
patient_name
conditions

- Question
. Write a solution to find the patient_id, patient_name, and conditions of the
patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

- Output
. patient_id
. patient_name
. conditions
*/
select
    p.patient_id
  , p.patient_name
  , p.conditions
from
  patients as p
where
  position("DIAB1" in p.conditions) = 1
  or position(" DIAB1" in p.conditions) > 0;