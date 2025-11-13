-- 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
USE hospital;
SELECT
patient_id,
satisfaction,
CASE WHEN satisfaction > 90 THEN 'High'
	WHEN satisfaction > 70 THEN 'Medium'
    ELSE 'Low'
END AS patient_category
FROM patients;
-- 2. Label staff roles as 'Medical' or 'Support' based on role type.
SELECT
*,
CASE WHEN role = 'doctor' THEN 'Medical'
	 WHEN role = 'nurse' THEN 'Medical'
	 WHEN role = 'nursing_assistant' THEN 'Support'
END as staff_category
FROM staff;
-- 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT
*,
CASE WHEN age between 0 AND 18 THEN 'Child'
	WHEN age between 19 AND 40 THEN 'Adult'
    WHEN age between 41 AND 65 THEN 'Older Adult'
    ELSE 'Sernior Citizen'
END AS age_category
FROM patients;
