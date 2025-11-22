SELECT 
    p.patient_id,
    p.name,
    p.service,
    p.satisfaction AS personal_satisfaction
FROM patients p
WHERE p.service IN (
    
    -- Services that meet BOTH conditions
    SELECT sw.service
    FROM services_weekly sw
    GROUP BY sw.service
    HAVING 
        -- Condition 1: at least one week with refusals
        MAX(sw.patients_refused) > 0
        
        AND
        
        -- Condition 2: service avg satisfaction below hospital avg
        AVG(sw.patient_satisfaction) < (
            SELECT AVG(patient_satisfaction)
            FROM services_weekly
        )
)
ORDER BY p.service, p.patient_id;
