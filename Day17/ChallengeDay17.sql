-- Create a report showing each service with: service name, total patients admitted, the difference between their total admissions and the average admissions across all services, and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.
USE hospital;
SELECT
    service,
    SUM(patients_admitted) AS total_patients_admitted,
    ROUND(SUM(patients_admitted) - AVG(SUM(patients_admitted)) OVER (),2) AS admission_difference,
        CASE
        WHEN SUM(patients_admitted) > AVG(SUM(patients_admitted)) OVER () THEN 'Above Average'
        WHEN SUM(patients_admitted) < AVG(SUM(patients_admitted)) OVER () THEN 'Below Average'
        ELSE 'Average'
    END AS rank_indicator
FROM services_weekly
GROUP BY service
ORDER BY total_patients_admitted DESC;
