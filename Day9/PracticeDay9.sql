-- Extract the year from all patient arrival dates.
Use hospital;
SELECT
patient_id,
name AS patients_name,
arrival_date,
YEAR(arrival_date) AS year_arrivaldate
FROM patients;

-- Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT
patient_id,
name AS patient_name,
arrival_date AS patient_arrival_date,
departure_date AS patient_departure_date,
DATEDIFF(departure_date,arrival_date) AS stay_length_indays
FROM patients;

-- Find all patients who arrived in a specific month.
SELECT *
FROM patients
WHERE MONTH(arrival_date) = 6;
