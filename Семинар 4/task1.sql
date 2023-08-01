
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


SELECT *
FROM fruits1
INNER JOIN fruits2
ON fruits1.id = fruits2.id 

SELECT *
FROM fruits1
INNER JOIN fruits2
ON fruits1.fruit_name = fruits2.fruit_name 