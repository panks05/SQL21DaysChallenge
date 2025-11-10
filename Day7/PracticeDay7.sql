-- Find services that have admitted more than 500 patients in total.
USE hospital;
SELECT
service,
SUM(patients_admitted) AS patients_admitted_byservice
FROM services_weekly
GROUP BY service
HAVING patients_admitted_byservice > 500;

-- Show services where average patient satisfaction is below 75.
SELECT
service,
ROUND(AVG(patient_satisfaction),2) AS avg_satisfactionscore_byservice
FROM services_weekly
GROUP BY service
HAVING avg_satisfactionscore_byservice < 75;

-- List weeks where total staff presence across all services was less than 50.
SELECT
week,
count(staff_id) AS total_staff_byweek
FROM staff_schedule
GROUP BY week
HAVING total_staff_byweek < 50;
