/*
2023/07/28
SQL. Seminar 1.
*/

-- создаем БД
DROP DATABASE IF EXISTS seminar1;
CREATE DATABASE seminar1;
USE seminar1;

-- создаем таблицу СТУДЕНТЫ
CREATE TABLE students(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_student VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone_number BIGINT UNSIGNED
);

CREATE TABLE teachers(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_teacher VARCHAR(45) NOT NULL,
    post VARCHAR(100)
);

CREATE TABLE courses(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_course VARCHAR(55),
    name_teacher VARCHAR(45),
    name_student VARCHAR(45)
);

ALTER TABLE courses
ADD COLUMN name_course VARCHAR(55) NOT NULL AFTER id;

INSERT INTO students (name_student, email, phone_number)
VALUES
("Миша","mishka@mail.ru",7928),
("Маша","mashka@mail.ru",7928),
("Гриша","griska@mail.ru",7928),
("Глаша","glashka@mail.ru",7928),
("Паша","pashka@mail.ru",7928);

INSERT INTO teachers (name_teacher, post) VALUES
("Иванов И.И.","Профессор"),
("Петров П.П.","Директор"),
("Сидоров С.С.","Доцент");

INSERT INTO courses (name_course, name_teacher, name_student) VALUES
("Ботаника","Иванов И.И.","Миша"),
("Математика","Петрво П.П.","Маша"),
("Физика","Сидоров С.С.","Гриша");

SELECT * FROM students;
SELECT name_student, id FROM students;

SELECT id, name_student, email, phone_number 
FROM students
WHERE name_student = "Миша";

SELECT id, name_student, email, phone_number 
FROM students
WHERE name_student LIKE "М%";

SELECT id, name_student, email, phone_number 
FROM students
WHERE name_student LIKE "%ша";

SELECT id, name_student, email, phone_number 
FROM students
WHERE name_student LIKE "Ми%";

SELECT id, name_student, email, phone_number 
FROM students
WHERE name_student LIKE "%и%";

SELECT id, name_student, email, phone_number 
FROM students
WHERE name_student LIKE "_и%";