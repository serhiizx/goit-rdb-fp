USE pandemic;

-- виносимо сутності в окрему таблицю
CREATE TABLE entities (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(100),
    code   VARCHAR(10)
);

INSERT INTO entities (entity, code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;

-- замість Entity і Code зберігаємо посилання entity_id,
-- решту атрибутів копіюємо з вихідної таблиці
CREATE TABLE infectious_cases_normalized AS
SELECT
    e.id AS entity_id,
    ic.Year,
    ic.Number_yaws,
    ic.polio_cases,
    ic.cases_guinea_worm,
    ic.Number_rabies,
    ic.Number_malaria,
    ic.Number_hiv,
    ic.Number_tuberculosis,
    ic.Number_smallpox,
    ic.Number_cholera_cases
FROM infectious_cases ic
JOIN entities e ON e.entity = ic.Entity AND e.code = ic.Code;

ALTER TABLE infectious_cases_normalized
    ADD FOREIGN KEY (entity_id) REFERENCES entities (id);

SELECT COUNT(*) FROM infectious_cases;

SELECT * FROM entities LIMIT 10;
SELECT * FROM infectious_cases_normalized LIMIT 10;
