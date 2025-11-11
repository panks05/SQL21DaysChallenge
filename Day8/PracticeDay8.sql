-- Convert all patient names to uppercase.
USE hospital;
SELECT
upper(name) AS patients_name_uppercase
FROM patients;

-- Find the length of each staff member's name.
SELECT
UPPER(staff_name) AS staff_name_uppercase
FROM staff;

-- Concatenate staff_id and staff_name with a hyphen separator.
SELECT
concat(staff_id,'-',staff_name) AS concated_staffidname
FROM staff;
