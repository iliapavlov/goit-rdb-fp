-- 1. Створення схеми pandemic
CREATE SCHEMA IF NOT EXISTS pandemic;

-- 2. Вибір схеми за замовчуванням
USE pandemic;

-- 3. Перевірка завантажених даних
SELECT COUNT(*) as total_rows FROM infectious_cases;

-- Перегляд перших рядків
SELECT * FROM infectious_cases LIMIT 10;