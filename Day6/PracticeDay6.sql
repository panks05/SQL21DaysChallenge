-- Count the number of patients by each service.
USE hospital;
SELECT
service,
count(patient_id) AS total_patients
FROM patients
GROUP BY service;

-- Calculate the average age of patients grouped by service.
SELECT
service,
ROUND(avg(age),2) AS avg_age_patient
FROM patients
GROUP BY service;

-- Find the total number of staff members per role.
SELECT
role,
count(staff_id) AS total_staff
FROM staff
GROUP BY role;
