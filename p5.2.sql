DROP FUNCTION IF EXISTS CasesForPeriod;

DELIMITER //

CREATE FUNCTION CasesForPeriod(cases TEXT, period INT)
RETURNS FLOAT
DETERMINISTIC 
NO SQL
BEGIN
	DECLARE cases_numeric FLOAT;
	IF period = 0 OR cases = '' THEN
		RETURN NULL;
	ELSE
		SET cases_numeric = CAST(cases AS DECIMAL(10, 2));
        IF cases_numeric IS NULL THEN
            RETURN NULL;
        END IF;
		RETURN cases_numeric / period;
	END IF;
END //

DELIMITER ;

SELECT
CAST(Number_rabies AS DECIMAL(10, 2)) as rabies_yearly,
CasesForPeriod(ic.Number_rabies, 2) as rabies_semiannually,
CasesForPeriod(ic.Number_rabies, 4) as rabies_quarterely,
CasesForPeriod(ic.Number_rabies, 12) as rabies_monthly
FROM infectious_cases ic
ORDER by rabies_monthly DESC;