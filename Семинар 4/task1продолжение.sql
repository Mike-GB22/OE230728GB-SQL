
DROP DATABASE IF EXISTS seminar3;
CREATE DATABASE seminar3;
USE seminar3;

DROP TABLE IF EXISTS fruits1;
CREATE TABLE fruits1 (
	id SERIAl PRIMARY KEY AUTO_INCREMENT,
    fruit_name VARCHAR(15)
);

DROP TABLE IF EXISTS fruits2;
CREATE TABLE fruits2 (
	id SERIAl PRIMARY KEY AUTO_INCREMENT,
    fruit_name VARCHAR(15)
);

INSERT INTO fruits1 (fruit_name) VALUES
("Яблоко"),
("Ананас"),
("Банан"),
("Груша");

INSERT INTO fruits2 (fruit_name) VALUES
("Тыква"),
("Яблоко"),
("Дыня"),
("Банан");

-- Соединяем таблицы, к 1й добавляем 2йю, 
-- но только те строки (указанные в ON) что есть в 1й таблице и в 2й таблице 
SELECT *
FROM fruits1
INNER JOIN fruits2
ON fruits1.id = fruits2.id;

-- Соединяем таблицы, к 1й добавляем 2йю, но те строки (указанный в ON) что есть в 1й таблице
SELECT *
FROM fruits1
LEFT JOIN fruits2
ON fruits1.fruit_name = fruits2.fruit_name;

-- Соединяем таблицы, к 1й добавляем 2йю, но те строки (указанный в ON) что есть в 1й таблице
SELECT *
FROM fruits1
RIGHT JOIN fruits2
ON fruits1.fruit_name = fruits2.fruit_name;

-- Умножаем таблицы
SELECT *
FROM fruits1
CROSS JOIN fruits2
