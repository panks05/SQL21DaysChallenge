WITH ServiceLevelMetrics AS (
    -- 1. Calculate aggregated metrics per service from the weekly reports
    SELECT 
        service,
        SUM(patients_request) AS total_requests,
        SUM(patients_admitted) AS total_admissions,
        SUM(patients_refused) AS total_refusals,
        AVG(patient_satisfaction) AS avg_service_satisfaction
    FROM 
        services_weekly
    GROUP BY 
        service
),

StaffMetrics AS (
    -- 2. Calculate staff counts and attendance from the schedule
    SELECT 
        service,
        COUNT(DISTINCT staff_id) AS total_staff_count,
        -- Calculate average weeks worked per staff member
        -- SUM(present) gets total man-weeks, divided by count of unique staff
        ROUND(CAST(SUM(present) AS FLOAT) / COUNT(DISTINCT staff_id), 1) AS avg_weeks_present
    FROM 
        staff_schedule
    GROUP BY 
        service
),

PatientDemographics AS (
    -- 3. Calculate demographics from the individual patient records
    SELECT 
        service,
        COUNT(patient_id) AS total_patient_records,
        ROUND(AVG(age), 1) AS avg_patient_age
    FROM 
        patients
    GROUP BY 
        service
)

-- 4. Final Dashboard: Combine all metrics and calculate Performance Score
SELECT 
    slm.service,
    
    -- Service Metrics
    slm.total_admissions,
    slm.total_refusals,
    ROUND(slm.avg_service_satisfaction, 2) AS avg_satisfaction_score,
    
    -- Staff Metrics
    sm.total_staff_count,
    sm.avg_weeks_present,
    
    -- Patient Demographics
    pd.avg_patient_age,
    pd.total_patient_records,
    
    -- Overall Performance Score Calculation
    -- Formula: 50% weight on Admission Rate + 50% weight on Satisfaction (scaled to 100)
    ROUND(
        (
            -- Component 1: Admission Rate (Admitted / Requested) * 50
            (CAST(slm.total_admissions AS FLOAT) / NULLIF(slm.total_requests, 0)) * 50
        ) + 
        (
            -- Component 2: Satisfaction (Assuming 0-10 scale) * 5
            slm.avg_service_satisfaction * 5
        )
    , 2) AS performance_score

FROM 
    ServiceLevelMetrics slm
LEFT JOIN 
    StaffMetrics sm ON slm.service = sm.service
LEFT JOIN 
    PatientDemographics pd ON slm.service = pd.service

ORDER BY 
    performance_score DESC;
