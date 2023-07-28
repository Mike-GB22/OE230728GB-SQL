/*
2023/07/28
SQL. Seminar 1.
*/

USE seminar1;

-- создаем таблицу СТУДЕНТЫ
CREATE TABLE workers(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_worker VARCHAR(45) NOT NULL,
    dept VARCHAR(45) NOT NULL,
    salary INT UNSIGNED
);

INSERT INTO workers (id, name_worker, dept, salary) VALUES
(100, "Морж", "Sales", 5000),
(200, "Макс", "IT", 5500),
(300, "Шмакс", "Marketing", 7000),
(400, "Мип", "IT", 9500),
(500, "Зип", "IT", 6000),
(501, "Машка", "Accounting", NULL);

-- все у кого ЗП выше 6000
SELECT name_worker, salary FROM workers WHERE salary > 6000;

-- все кто в ИТ
SELECT name_worker, dept FROM workers WHERE dept = "IT";

-- все кто не в ИТ
SELECT name_worker, dept FROM workers WHERE dept != "IT";

-- все у кого имя начинается на М
SELECT * FROM workers WHERE name_worker LIKE "М%";
