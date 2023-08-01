/*
2023/07/31
Семинар 3.
Задание 2. 

Выведите все записи, отсортированные по полю "age" по возрастанию
Выведите все записи, отсортированные по полю “firstname"
Выведите записи полей "firstname ", “lastname", "age", отсортированные по полю "firstname " в алфавитном порядке по убыванию
Выполните сортировку по полям " firstname " и "age" по убыванию
*/

DROP DATABASE IF EXISTS seminar3;
CREATE DATABASE seminar3;
USE seminar3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_first VARCHAR(50) NOT NULL,
    name_last VARCHAR(50) NOT NULL,
    post_id INT,
    seniority INT,
    salary INT,
    age INT
);

DROP TABLE IF EXISTS staff_post;
CREATE TABLE staff_post(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_post VARCHAR(50) NOT NULL
);

INSERT INTO staff_post VALUES
(1, "Начальник"),
(2, "Инженер"),
(3, "Рабочий"),
(4, "Уборщик");

INSERT INTO staff VALUES
(1, "Вася", "Петров", 1, 40, 100000, 60),
(2, "Петр", "Валсов", 1, 8, 70000, 30),
(3, "Катя", "Катина", 2, 2, 70000, 19),
(4, "Саша", "Сасин", 2, 12, 50000, 35),
(5, "Иван", "Иванов", 3, 40, 30000, 59),
(6, "Петр", "Петров", 3, 20, 25000, 40),
(7, "Сидр", "Сидоров", 3, 10, 20000, 35),
(8, "Антон", "Антонов", 3, 8, 19000, 28),
(9, "Юрий", "Юрков", 3, 5, 15000, 25),
(10, "Максим", "Максимов", 3, 2, 11000, 22),
(11, "Юрий", "Галкин", 3, 3, 12000, 24),
(12, "Людмила", "Маркина", 4, 10, 10000, 49);

-- Слепили 2 талицы в одну LEFT
SELECT * 
FROM staff
LEFT JOIN staff_post
ON staff.post_id = staff_post.id;

-- Слепили 2 талицы в одну RIGHT
SELECT *
FROM staff t1
RIGHT JOIN staff_post t2
ON t1.post_id = t2.id;

-- Отсортировали по возрастунию возраста
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY t1.age;

-- Отсортировали по убыванию возраста
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY t1.age DESC;

-- Отсортировали по фамилии и имени по возрастанию
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY t1.name_last, t1.name_first ASC;

-- Отсортировали по фамилии и имени (по возрастанию фамилии, по убыванию имени)
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY t1.name_last ASC, t1.name_first DESC;
-- тут видно только на Петрове, так как их 2
