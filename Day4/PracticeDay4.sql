-- Display the first 5 patients from the patients table.
USE hospital;
SELECT *
FROM patients
ORDER BY patient_id ASC
LIMIT 5;

-- Show patients 11-20 using OFFSET.
SELECT
* 
FROM patients
ORDER BY patient_id ASC
LIMIT 10 OFFSET 10;

-- Get the 10 most recent patient admissions based on arrival_date.
SELECT
* 
FROM patients
ORDER BY arrival_date DESC
LIMIT 10;
