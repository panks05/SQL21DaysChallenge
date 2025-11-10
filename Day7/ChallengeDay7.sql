-- Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80. 
-- Show service name, total refused, and average satisfaction.
USE hospital;
SELECT
service,
SUM(patients_refused) AS patients_refused_byservice,
ROUND(AVG(patient_satisfaction),2) AS patient_satisfaction_byservice
FROM services_weekly
GROUP BY service
HAVING patients_refused_byservice > 100 AND patient_satisfaction_byservice < 80;
