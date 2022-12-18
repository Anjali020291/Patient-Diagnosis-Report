create database patients;
use patients;

/* Query to create a patients table*/
create table patient(
	date char(15),
    patient_id varchar(10),
    patient_name varchar(25),
    age int,
    weight int,
    gender char(10),
    location varchar(20),
    phone_no int,
    disease varchar(20),
    doctor_name varchar(20),
    doctor_id varchar(10));
    
/*Write a query to display the total number of patients in the table.*/    
select count(patient_id) as total_patients from patients.patient; 

/*display the patient id, patient name, gender, and disease of the patient whose age is maximum*/
select patient_id, patient_name, gender, disease from patients.patient
where age=( select max(age) from patients.patient); 
    
/*display patient id and patient name with the current date*/
select patient_id, patient_name,(select now()) from patients.patient;

/*display the old patient’s name and new patient's name in uppercase*/
select upper(patient_name) from patients.patient;

/*display the patient’s name along with the length of their name*/
select patient_name, length(patient_name) from patients.patient;

/*display the patient’s name, and the gender of the patient must be mentioned as M or F.*/
select patient_name, (select mid(gender,1,1)) from patients.patient;

/*OR*/
select patient_name, Case when Gender = 'Male' then 'M' when Gender = 'Female' then 'F' else 'Other' end
from patients.patient;

/*combine the names of the patient and the doctor in a new column.*/
select concat(patient_name,' + ', doctor_name) as Patient_Doctor from patients.patient;

/*display the patients’ age along with the logarithmic value (base 10) of their age*/
select age, log10(age) from patients.patient;

/*extract the year from the given date in a separate column*/
select extract(year from date) from patients.patient;

/*return NULL if the patient’s name and doctor’s name are similar else return the patient’s name*/

select case when patient_name = doctor_name then 'NULL' when patient_name!= doctor_name then patient_name end
from patients.patient;

/*return Yes if the patient’s age is greater than 40 else return No*/
select case when age>40 then 'Yes' else 'No' end
from patients.patient;

/*display the doctor’s duplicate name from the table*/
select doctor_name,
count(*) from patients.patient group by doctor_name having count(*) =2; 


