/*
2023/07/28
SQL. Семинар 2.
Задача 3
Операции с таблицами. Задания

1. Переименовать сущность movies в cinema.
2. Добавить сущности cinema новый атрибут status_active
(тип BIT) и атрибут genre_id после атрибута title_eng.
3. Удалить атрибут status_active сущности cinema. 
4. Удалить сущность actors из базы данных
5. Добавить внешний ключ на атрибут genre_id сущности 
cinema и направить его на атрибут id сущности genres.
6. Очистить сущность genres от данных и обнулить 
автоинкрементное поле.

*/

USE seminar2;
RENAME TABLE movies TO cinema;

ALTER TABLE cinema
ADD COLUMN status_active BIT DEFAULT b'1',
ADD genre_id BIGINT UNSIGNED AFTER title_eng;

SELECT * FROM cinema;

ALTER TABLE cinema
DROP COLUMN status_active;

SELECT * FROM cinema;

DROP TABLE IF EXISTS actors;
CREATE TABLE actors (
	id SERIAL AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    year_actors YEAR NOT NULL
);
INSERT INTO actors (first_name, last_name, year_actors) VALUES
("Ума", "Турман", 1999),
("Билл", "Гейтс", 1950),
("Гомер", "Симпсон", 1998),
("Натали", "Пормен", 1994),
("Иллон", "Маск", 2003);

SELECT * FROM actors;

DROP TABLE IF EXISTS genres;
CREATE TABLE genres(
	id_genre SERIAL NOT NULL PRIMARY KEY,
    name_genre VARCHAR(50) NOT NULL
);

INSERT INTO genres (name_genre) VALUES
('Комедия'),
('Аниме'),
('Боевик'),
('Страшилка');

SELECT * FROM genres;
TRUNCATE TABLE genres;

ALTER TABLE cinema
ADD FOREIGN KEY(genre_id) REFERENCES genres(id_genre);

ALTER TABLE cinema
DROP FOREIGN KEY id_ggenresid_genreenre;

SELECT * FROM genres;
SELECT * FROM cinema;