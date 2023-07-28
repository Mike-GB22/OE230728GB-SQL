/*
2023/07/28
SQL. Семинар 2.
Задача 1
Создать таблицу с подборкой фильмов. Связать с произвольной табличкой ключом

Например, в таблице создаются следующие столбцы:
1. уникальный идентификатор фильма,
2. название фильма
3. год выхода
4. длительность фильма в минутах
5. сюжетная линия, небольшое описание фильма
Все поля имеют ограничение NOT NULL. Первичный ключ PRIMARY KEY – поле id.

*/

DROP DATABASE IF EXISTS seminar2;
CREATE DATABASE seminar2;
USE seminar2;

CREATE TABLE movies (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL, 
    title_eng VARCHAR(50) NOT NULL, 
    year_movie YEAR NOT NULL, 
    count_min INT NOT NULL, 
    storyline TEXT NOT NULL
);

SELECT * FROM movies;