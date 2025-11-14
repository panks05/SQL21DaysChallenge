-- Find all unique combinations of service and event type from the services_weekly table where events are not null or none, along with the count of occurrences for each combination. Order by count descending.

SELECT DISTINCT
service, 
event,
COUNT(*) AS combination_occurance
FROM services_weekly
WHERE event != 'none' AND event IS NOT NULL
GROUP BY service, event
ORDER BY combination_occurance DESC;
