-- Count the total number of patients in the hospital.
USE hospital;
SELECT
count(patient_id)
FROM patients;

-- Calculate the average satisfaction score of all patients.
SELECT
ROUND(AVG(satisfaction),2) AS avg_satisfactionscore
FROM patients;

-- Find the minimum and maximum age of patients.
SELECT
MAX(age) AS maximum_patient_age,
MIN(age) AS minimum_patient_age
FROM patients;


