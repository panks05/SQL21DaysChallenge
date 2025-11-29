-- 1.Identify where and when the crime happened	WHERE, filtering
SELECT 
    room,
    found_time AS crime_time,
    description
FROM evidence
WHERE description IS NOT NULL   
ORDER BY found_time;

-- 2 Analyze who accessed critical areas at the time
SELECT 
    e.employee_id,
    e.name, 
    e.role, 
    k.room,
    k.entry_time, 
    k.exit_time
FROM employees e
JOIN keycard_logs k ON e.employee_id = k.employee_id
WHERE 
    k.room = 'CEO Office' 
   AND k.entry_time BETWEEN '2025-10-15 20:00:00' AND '2025-10-15 21:30:00';

-- 3 Cross-check alibis with actual logs
SELECT e.name, e.role
FROM employees e
JOIN alibis a ON e.employee_id = a.employee_id
WHERE e.employee_id IN (
    SELECT k.employee_id
    FROM keycard_logs k
    JOIN alibis a2 ON k.employee_id = a2.employee_id
    WHERE 
        a2.claim_time BETWEEN k.entry_time AND k.exit_time
        AND a2.claimed_location != k.room
);

-- 4 Investigate suspicious calls made around the time
SELECT 
    c.call_id,
    caller.name AS Caller_Name,
    receiver.name AS Receiver_Name,
    c.call_time,
    c.duration_sec
FROM calls c
JOIN employees caller ON c.caller_id = caller.employee_id
JOIN employees receiver ON c.receiver_id = receiver.employee_id
WHERE 
    c.call_time BETWEEN '2025-10-15 20:40:00' AND '2025-10-15 21:00:00'
ORDER BY c.duration_sec DESC;

-- 5.Cross-check alibis with actual logs
SELECT 
    e.name, 
    a.claimed_location, 
    a.claim_time,
    k.room AS actual_location
FROM employees e
JOIN alibis a ON e.employee_id = a.employee_id
JOIN keycard_logs k ON e.employee_id = k.employee_id
WHERE 
    e.name = 'David Kumar'  -- Focus directly on our suspect
    AND a.claim_time BETWEEN k.entry_time AND k.exit_time;
    
-- 6.Combine all findings to identify the killer
-- Was in CEO Office around 20:50 - 21:15
SELECT e.name AS killer
FROM employees e
JOIN keycard_logs k ON e.employee_id = k.employee_id
WHERE k.room = 'CEO Office' 
  AND k.entry_time <= '2025-10-15 21:15:00' 
  AND k.exit_time >= '2025-10-15 20:50:00'

INTERSECT

-- Alibi mismatch
SELECT e.name AS killer
FROM employees e
JOIN alibis a ON e.employee_id = a.employee_id
JOIN keycard_logs k ON e.employee_id = k.employee_id
WHERE a.claim_time BETWEEN k.entry_time AND k.exit_time
  AND a.claimed_location != k.room

INTERSECT

-- Made a call between 20:40 - 21:00)
SELECT e.name AS killer
FROM employees e
JOIN calls c ON e.employee_id = c.caller_id
WHERE c.call_time BETWEEN '2025-10-15 20:40:00' AND '2025-10-15 21:00:00';
