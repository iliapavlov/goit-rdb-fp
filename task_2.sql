-- ---------------------------------------------------------
-- ЗАВДАННЯ 2: НОРМАЛІЗАЦІЯ ДАНИХ
-- ---------------------------------------------------------

-- 1. Створення таблиці довідника країн (Entities)
CREATE TABLE IF NOT EXISTS countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Entity VARCHAR(255),
    Code VARCHAR(10)
);

-- 2. Наповнення таблиці країн унікальними даними з початкової таблиці
INSERT INTO countries (Entity, Code)
SELECT DISTINCT Entity, Code 
FROM infectious_cases;

-- 3. Створення нормалізованої таблиці фактів (захворювань)
-- Використовуємо country_id як зовнішній ключ (Foreign Key)
CREATE TABLE IF NOT EXISTS infectious_cases_norm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT,
    Year INT,
    Number_yaws DOUBLE,
    polio_cases DOUBLE,
    cases_guinea_worm DOUBLE,
    Number_rabies DOUBLE,
    Number_malaria DOUBLE,
    Number_hiv DOUBLE,
    Number_tuberculosis DOUBLE,
    Number_smallpox DOUBLE,
    Number_cholera_cases DOUBLE,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

-- 4. Наповнення нормалізованої таблиці
-- Беремо дані з початкової таблиці та підтягуємо id країни з нової таблиці countries
INSERT INTO infectious_cases_norm (
    country_id, Year, Number_yaws, polio_cases, cases_guinea_worm, 
    Number_rabies, Number_malaria, Number_hiv, Number_tuberculosis, 
    Number_smallpox, Number_cholera_cases
)
SELECT 
    c.id, 
    t.Year, 
    -- Використовуємо NULLIF, щоб перетворити порожні TEXT на NULL
    NULLIF(t.Number_yaws, ''), 
    NULLIF(t.polio_cases, ''), 
    NULLIF(t.cases_guinea_worm, ''), 
    NULLIF(t.Number_rabies, ''), 
    NULLIF(t.Number_malaria, ''), 
    NULLIF(t.Number_hiv, ''), 
    NULLIF(t.Number_tuberculosis, ''), 
    NULLIF(t.Number_smallpox, ''), 
    NULLIF(t.Number_cholera_cases, '')
FROM infectious_cases t
JOIN countries c ON t.Entity = c.Entity AND t.Code = c.Code;

-- Перевірка результату нормалізації
SELECT * FROM infectious_cases_norm LIMIT 10;