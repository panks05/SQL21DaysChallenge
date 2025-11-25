-- For each service, rank the weeks by patient satisfaction score (highest first). Show service, week, patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service.
Use hospital;
SELECT 
	service,
	week,
	patient_satisfaction,
	patients_admitted
FROM
	(SELECT 
	service,
	week,
	patient_satisfaction,
	patients_admitted,
	rank() over(PARTITION BY service ORDER BY patient_satisfaction DESC) AS ranked
	FROM services_weekly) AS ranking
    WHERE ranked <=3;
