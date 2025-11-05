-- List all patients sorted by age in descending order.
USE hospital;
SELECT
*
FROM patients
ORDER BY age DESC;

-- Show all services_weekly data sorted by week number ascending and patients_request descending.
SELECT
*
FROM services_weekly
ORDER BY week ASC,patients_request DESC;

-- Display staff members sorted alphabetically by their names.
SELECT
*
FROM staff
ORDER BY staff_name ASC;
