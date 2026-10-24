USE pandemic;

SELECT
    e.entity,
    e.code,
    AVG(CAST(n.Number_rabies AS DECIMAL(20, 6))) AS avg_rabies,
    MIN(CAST(n.Number_rabies AS DECIMAL(20, 6))) AS min_rabies,
    MAX(CAST(n.Number_rabies AS DECIMAL(20, 6))) AS max_rabies,
    SUM(CAST(n.Number_rabies AS DECIMAL(20, 6))) AS sum_rabies
FROM infectious_cases_normalized n
JOIN entities e ON e.id = n.entity_id
WHERE n.Number_rabies <> '' 
GROUP BY e.entity, e.code   
ORDER BY avg_rabies DESC    
LIMIT 10;                   
