-- List all unique services in the patients table.
USE hospital;
SELECT DISTINCT
service
FROM patients;

-- Find all unique staff roles in the hospital.
SELECT DISTINCT
role
FROM staff;

-- Get distinct months from the services_weekly table.
SELECT DISTINCT
month
FROM services_weekly;
