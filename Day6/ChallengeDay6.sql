-- For each hospital service, calculate the total number of patients admitted, total patients refused, and the admission rate (percentage of requests that were admitted). Order by admission rate descending.
USE hospital;
SELECT
service,
SUM(patients_admitted) AS total_patients_admitted,
SUM(patients_refused) AS total_patients_refused,
ROUND((SUM(patients_admitted) / SUM(patients_request)) * 100,2)AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;


