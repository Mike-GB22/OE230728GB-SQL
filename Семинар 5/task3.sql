SELECT
name, quartal, subject, grade, 
AVG(grade) OVER w AS avg_grade,
MIN(grade) OVER w AS min_grade,
MAX(grade) OVER w AS max_grade,
SUM(grade) OVER w AS sum_grade,
COUNT(grade) OVER w AS count_grade
FROM academic_record
WINDOW w AS (PARTITION BY name);

Временная таблица (TEMPORARY TABLE)
CREATE TEMPORARY TABLE new_tbl
SELECT * FROM orig_tbl LIMIT 0;
Общее табличное выражение (WITH)
WITH
cte1 AS (SELECT a, b FROM table1),
cte2 AS (SELECT c, d FROM table2)
SELECT b, d FROM cte1 JOIN cte2
WHERE cte1.a = cte2.c;
Представление (VIEW)
CREATE OR REPLACE VIEW v_tbl
SELECT * FROM orig_tbl LIMIT 0;