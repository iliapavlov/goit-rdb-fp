-- ---------------------------------------------------------
-- ЗАВДАННЯ 3: АНАЛІЗ ДАНИХ (Number_rabies)
-- ---------------------------------------------------------

SELECT 
    c.Entity,              -- Назва країни
    c.Code,                -- Код країни
    AVG(n.Number_rabies) AS average_rabies,  -- Середнє значення
    MIN(n.Number_rabies) AS min_rabies,      -- Мінімальне значення
    MAX(n.Number_rabies) AS max_rabies,      -- Максимальне значення
    SUM(n.Number_rabies) AS sum_rabies       -- Сума
FROM 
    infectious_cases_norm n
JOIN 
    countries c ON n.country_id = c.id
WHERE 
    n.Number_rabies IS NOT NULL 
GROUP BY 
    c.Entity, c.Code
ORDER BY 
    average_rabies DESC        -- Сортування за середнім у спаданні
LIMIT 10;           