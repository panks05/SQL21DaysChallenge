-- Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. Only show patients whose name length is greater than 10 characters.
USE hospital;
SELECT
patient_id,
upper(name) AS patient_fullname,
lower(service) AS service,
	CASE
	WHEN age >= 65 THEN 'Senior' 
    WHEN age >=18 THEN 'Adult'
	ELSE 'Minor'
	END AS age_category,
length(name) AS length_patientname
FROM patients
WHERE length(name) > 10;
