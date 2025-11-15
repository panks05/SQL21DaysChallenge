-- 1. Find all weeks in services_weekly where no special event occurred.
Use hospital;
SELECT 
week
FROM services_weekly
WHERE event = 'none';
-- 2. Count how many records have null or empty event values.
SELECT
count(*) AS null_events
FROM services_weekly
WHERE event IS NULL OR event = '';

-- 3. List all services that had at least one week with a special event.
SELECT DISTINCT
service
FROM services_weekly
WHERE event != 'none';
