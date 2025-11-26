-- Create a trend analysis showing for each service and week: week number, patients_admitted, running total of patients admitted (cumulative), 3-week moving average of patient satisfaction (current week and 2 prior weeks), and the difference between current week admissions and the service average. Filter for weeks 10-20 only.
Use hospital;
SELECT
	week,
	service,
	patients_admitted,
	SUM(patients_admitted) over(PARTITION BY service ORDER BY WEEK ROWS UNBOUNDED PRECEDING) AS total_patients_admitted,
	ROUND(AVG(patient_satisfaction) OVER(PARTITION BY service ORDER BY WEEK ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS threeweek_moving_average,
	ROUND(patients_admitted - AVG(patients_admitted) OVER(PARTITION BY service),2) AS difference
FROM services_weekly 
WHERE week BETWEEN 10 AND 20;
