-- ---------------------------------------------------------
-- ЗАВДАННЯ 5: ФУНКЦІЯ
-- ---------------------------------------------------------

DROP FUNCTION IF EXISTS YearDifference;

DELIMITER //

CREATE FUNCTION YearDifference(input_year INT) 
RETURNS INT
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result INT;
    -- SET result = input_year;
    SET result = TIMESTAMPDIFF(YEAR, MAKEDATE(input_year, 1), CURDATE());
    RETURN result;
END //

DELIMITER ;

-- ---------------------------------------------------------
-- ВИКОРИСТАННЯ ФУНКЦІЇ У ЗАПИТІ
-- ---------------------------------------------------------

SELECT 
    id,   -- атрибут id
    Year, -- атрибут рік
    YearDifference(Year) AS years_passed_since_stat
FROM 
    infectious_cases_norm
LIMIT 100;