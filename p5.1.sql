DROP FUNCTION IF EXISTS CaclucalateYearsDiff;

DELIMITER //

CREATE FUNCTION CaclucalateYearsDiff(year INT)
RETURNS INT
DETERMINISTIC 
NO SQL
BEGIN
	DECLARE original_date DATE;
	IF year = 0 OR year IS NULL THEN
		RETURN NULL;
	ELSE
		SET original_date = STR_TO_DATE(CONCAT(year, '-01-01'), '%Y-%m-%d');
		RETURN TIMESTAMPDIFF(YEAR, original_date, CURDATE());
	END IF;
END //

DELIMITER ;

SELECT 
STR_TO_DATE(CONCAT(ic.year, '-01-01'), '%Y-%m-%d') as original_date,
CURDATE() as cur_date,
CaclucalateYearsDiff(ic.year) as years_diff
FROM infectious_cases ic;