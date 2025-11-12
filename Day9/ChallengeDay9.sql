-- Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days. Also show the count of patients and order by average stay descending.
USE hospital;
SELECT
count(patient_id) AS total_patient,
service,
ROUND(AVG(DATEDIFF(departure_date,arrival_date)),2) AS avg_stay_indays
FROM patients
GROUP BY service
HAVING avg_stay_indays > 7
ORDER BY avg_stay_indays DESC;
