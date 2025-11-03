-- verifying data load
USE hospital;
SELECT * FROM patients LIMIT 5;

-- retrieving patient_name and age
SELECT name AS patient_name, age AS patient_age FROM patients;

-- Retrieve all columns from the patients table (prefer mentioning the columns)
SELECT 
	patient_id,
    name AS patient_name,
    age AS patient_age,
    arrival_date AS admit_date,
    departure_date AS discharge_date,
    service,
    satisfaction AS satisfaction_score
FROM patients;

-- Select only the patient_id, name, and age columns from the patients table.
SELECT 
	patient_id,
    name AS patient_name,
    age AS patient_age
FROM patients;

-- display the first 10 records from the services_weekly table.
SELECT
* 
FROM services_weekly LIMIT 10;
