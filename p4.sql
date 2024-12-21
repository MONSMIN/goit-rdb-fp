SELECT 
STR_TO_DATE(CONCAT(ic.year, '-01-01'), '%Y-%m-%d') as original_date,
CURDATE() as cur_date,
TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT(ic.year, '-01-01'), '%Y-%m-%d'), CURDATE()) as years_diff
FROM infectious_cases ic;