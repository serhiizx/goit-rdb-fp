USE pandemic;

SELECT
    Year,
    MAKEDATE(Year, 1)                                 AS year_start_date,    -- 1 січня відповідного року (1996 -> 1996-01-01)
    CURDATE()                                         AS current_date_value, -- поточна дата
    TIMESTAMPDIFF(YEAR, MAKEDATE(Year, 1), CURDATE()) AS year_difference     -- різниця в повних роках між ними
FROM infectious_cases_normalized
LIMIT 10;
