-- Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted that week, total patients refused, average patient satisfaction, count of staff assigned to service, and count of staff present that week. Order by patients admitted descending.

SELECT
	sw.week,
  sw.service,
	SUM(sw.patients_admitted) as total_patients_admitted,
	SUM(sw.patients_refused) as total_patients_refused,
	ROUND(AVG(patient_satisfaction),2) as avg_patient_satisfaction,
	COUNT(DISTINCT s.staff_id) as total_staff_assigned,
	SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) as total_staff_present
FROM services_weekly as sw
LEFT JOIN staff as s
	ON s.service = sw.service
LEFT JOIN staff_schedule as ss
	ON ss.staff_id = s.staff_id
	AND ss.week = sw.week
WHERE sw.week = 20
GROUP BY sw.service,sw.week
ORDER BY total_patients_admitted DESC;



