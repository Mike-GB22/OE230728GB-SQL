/*
2023/08/01
Семинар 5.
Задание 1. 

Задача 1. Получить с помощью оконных функции:
• средний балл ученика 
• наименьшую оценку ученика
• наибольшую оценку ученика
• сумму всех оценок ученика
• количество всех оценок ученика
*/
USE seminar5;

SELECT
CONCAT(firstname, ' ',lastname) AS name1, 
AVG(salary) OVER w AS avg_grade,
MIN(salary) OVER w AS min_grade,
MAX(salary) OVER w AS max_grade,
SUM(salary) OVER w AS sum_grade,
COUNT(salary) OVER w AS count_grade
FROM staff
WINDOW w AS (PARTITION BY id);
