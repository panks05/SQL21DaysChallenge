-- 1. Show all staff members and their schedule information (including those with no schedule entries).
USE hospital;
SELECT
s.staff_id,
s.staff_name,
s.role,
s.service,
ss.week,
ss.present
FROM staff as s
LEFT JOIN staff_schedule as ss
ON s.staff_id = ss.staff_id;

-- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT
sw.service,
st.staff_id,
st.staff_name,
st.role
FROM services_weekly as sw
LEFT JOIN staff as st
ON sw.service = st.service;

-- 3. Display all patients and their service's weekly statistics (if available).
SELECT
p.patient_id,
p.name as patient_name,
p.age,
p.arrival_date,
p.departure_date,
p.service,
p.satisfaction,
sw.week,
sw.month,
sw.available_beds,
sw.patients_request,
sw.patients_admitted,
sw.patients_refused,
sw.patient_satisfaction,
sw.staff_morale,
sw.event
FROM patients as p
LEFT JOIN services_weekly as sw
ON p.service = sw.service;



