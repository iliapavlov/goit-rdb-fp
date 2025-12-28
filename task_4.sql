-- ---------------------------------------------------------
-- ЗАВДАННЯ 4: РІЗНИЦЯ В ЧАСІ
-- ---------------------------------------------------------

SELECT 
	id,   -- атрибут id
    Year, -- атрибут рік
    
    -- Дата першого дня року
    MAKEDATE(Year, 1) AS date_january_1st,
    
    -- Поточна дата
    CURDATE() AS current_date_val,
    
    -- Різниця між двома датами в заданих одиницях
    TIMESTAMPDIFF(YEAR, MAKEDATE(Year, 1), CURDATE()) AS year_difference
FROM 
	infectious_cases_norm
LIMIT 100;