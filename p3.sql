SELECT e.entity, 
cc.code, 
AVG(ic.Number_rabies) as avg_rabies, 
MAX(ic.Number_rabies) as max_rabies, 
MIN(ic.Number_rabies) as min_rabies,
SUM(ic.Number_rabies) as sum_rabies
FROM infectious_cases ic
JOIN entities e ON e.id = ic.entity_id
JOIN country_codes cc ON cc.id = ic.code_id
WHERE ic.Number_rabies != ''
GROUP by e.entity, cc.code
ORDER by avg_rabies DESC
LIMIT 10;