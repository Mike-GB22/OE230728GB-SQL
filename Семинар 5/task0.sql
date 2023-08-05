/*
2023/08/01
Семинар 5.

Примеры. 
1. Вывести список всех сотрудников и указать место в рейтинге по зарплатам
SELECT DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_salary, 
CONCAT(firstname, ' ', lastname), post, salary FROM staff
ORDER BY rank_salary;

2. Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но 
по каждой должности
SELECT
DENSE_RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS rank_salary, 
CONCAT(firstname, ' ', lastname), post, salary
FROM staff ORDER BY post, rank_salary;

3. Найти самых высокооплачиваемых сотрудников по каждой должности
SELECT rank_salary, staff, post, salary FROM
(SELECT
DENSE_RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS rank_salary, 
CONCAT(firstname, ' ', lastname) AS staff, post, salary FROM staff) AS list
WHERE rank_salary=1
ORDER BY salary DESC;

4. Вывести список всех сотрудников, отсортировав по зарплатам в порядке 
убывания и указать на сколько процентов ЗП меньше, чем у сотрудника со 
следующей (по значению) зарплатой
SELECT
id, CONCAT(firstname, ' ', lastname) AS staff, post, salary,
LEAD(salary, 1, 0) OVER(ORDER BY salary DESC) AS last_sarary, 
ROUND((salary-LEAD(salary, 1, 0) OVER(ORDER BY salary DESC))*100/salary) 
AS diff_percent
FROM staff;

5. Вывести всех сотрудников, сгруппировав по должностям и рассчитать:
-- общую сумму зарплат для каждой должности
-- процентное соотношение каждой зарплаты от общей суммы по должности
-- среднюю зарплату по каждой должности 
-- процентное соотношение каждой зарплаты к средней зарплате по должности 
Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но по 
каждой должности
SELECT
id, CONCAT(firstname, ' ', lastname) AS staff, post, salary,
SUM(salary) OVER w AS sum_salary,
ROUND(salary*100/SUM(salary) OVER w) AS percent_sum, 
AVG(salary) OVER w AS avg_salary,
ROUND(salary*100/AVG(salary) OVER w) AS percent_avg
FROM staff
WINDOW w AS (PARTITION BY post);
*/

-- Создаем БД и таблицу для работы
DROP DATABASE IF EXISTS seminar5;
CREATE DATABASE seminar5;
USE seminar5;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    post VARCHAR(50) NOT NULL,
    seniority INT,
    salary INT,
    age INT
);

-- Загружаем в таблицу данные из прзентации
INSERT INTO staff VALUES
(1, "Вася", "Петров", "Начальник", 40, 100000, 60),
(2, "Петр", "Валсов", "Начальник", 8, 70000, 30),
(3, "Катя", "Катина", "Инженер", 2, 70000, 19),
(4, "Саша", "Сасин", "Инженер", 12, 50000, 35),
(5, "Иван", "Иванов", "Рабочий", 40, 30000, 59),
(6, "Петр", "Петров", "Рабочий", 20, 25000, 40),
(7, "Сидр", "Сидоров", "Рабочий", 10, 20000, 35),
(8, "Антон", "Антонов", "Рабочий", 8, 19000, 28),
(9, "Юрий", "Юрков", "Рабочий", 5, 15000, 25),
(10, "Максим", "Максимов", "Рабочий", 2, 11000, 22),
(11, "Юрий", "Галкин", "Рабочий", 3, 12000, 24),
(12, "Людмила", "Маркина", "Уборщик", 10, 10000, 49);

-- Проверка что у нас в таблице
SELECT * FROM staff;

-- 1. Вывести список всех сотрудников и указать место в рейтинге по зарплатам
SELECT DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_salary, 
CONCAT(firstname, ' ', lastname), post, salary FROM staff
ORDER BY rank_salary;

-- 2. Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но по каждой должности
SELECT
DENSE_RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS rank_salary, 
CONCAT(firstname, ' ', lastname), post, salary
FROM staff ORDER BY post, rank_salary;

-- 3. Найти самых высокооплачиваемых сотрудников по каждой должности
SELECT rank_salary, staff, post, salary FROM
(SELECT
DENSE_RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS rank_salary, 
CONCAT(firstname, ' ', lastname) AS staff, post, salary FROM staff) AS list
WHERE rank_salary=1
ORDER BY salary DESC;

-- 4. Вывести список всех сотрудников, отсортировав по зарплатам в порядке 
-- убывания и указать на сколько процентов ЗП меньше, чем у сотрудника со 
-- следующей (по значению) зарплатой
SELECT
id, CONCAT(firstname, ' ', lastname) AS staff, post, salary,
LEAD(salary, 1, 0) OVER(ORDER BY salary DESC) AS last_sarary, 
ROUND((salary-LEAD(salary, 1, 0) OVER(ORDER BY salary DESC))*100/salary) 
AS diff_percent
FROM staff;

-- 5. Вывести всех сотрудников, сгруппировав по должностям и рассчитать:
-- -- общую сумму зарплат для каждой должности
-- -- процентное соотношение каждой зарплаты от общей суммы по должности
-- -- среднюю зарплату по каждой должности 
-- -- процентное соотношение каждой зарплаты к средней зарплате по должности 
-- Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но по 
-- каждой должности
SELECT
id, CONCAT(firstname, ' ', lastname) AS staff, post, salary,
SUM(salary) OVER w AS sum_salary,
ROUND(salary*100/SUM(salary) OVER w) AS percent_sum, 
AVG(salary) OVER w AS avg_salary,
ROUND(salary*100/AVG(salary) OVER w) AS percent_avg
FROM staff
WINDOW w AS (PARTITION BY post);

