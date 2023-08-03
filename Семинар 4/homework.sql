/*
2023/08/03
Семинар 4.
Домашнее задание

Условие:
	Табличка: https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing
	1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
	2. Вывести на экран марку авто и количество AUTO не этой марки

	3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
		Даны 2 таблицы, созданные следующим образом:
		create table test_a (id number, data varchar2(1));
		create table test_b (id number);
		insert into test_a(id, data) values
			(10, 'A'),
			(20, 'A'),
			(30, 'F'),
			(40, 'D'),
			(50, 'C');
		insert into test_b(id) values
			(10),
			(30),
			(50);
		

*/

SELECT * FROM AUTO;

-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
-- -- Первый шаг, выводим количество машин, каждого цвета, всех марок
SELECT COUNT(regnum), color 
FROM AUTO
GROUP BY color;

-- -- Второй шаг, выводим количество машин, каждого цвета, но только BMW и LADA, но в сумме
SELECT COUNT(regnum), color
FROM AUTO
WHERE mark IN ('BMW', 'LADA')
GROUP BY color;

-- -- Возможно условие говорит, выводить каждый цвет по каждой марке (но только BMW и LADA) отдельно
SELECT COUNT(regnum), color, mark
FROM AUTO
WHERE mark IN ('BMW', 'LADA')
GROUP BY color, mark;

-- 	2. Вывести на экран марку авто и количество AUTO не этой марки
-- -- Первый шаг, выводим количество машин, этой марки
SELECT mark, COUNT(regnum)
FROM AUTO
GROUP BY mark;

-- -- Второй шаг, добавляем, тут мы уже находим сколько машин не этой марки вычитая из общего кол-ва
SELECT 	mark, COUNT(regnum) AS "Машин этой марки",
		((SELECT COUNT(regnum) FROM AUTO) - COUNT(regnum)) AS "Машин в сумме остальных"
FROM AUTO
GROUP BY mark;


-- 3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
-- Даны 2 таблицы, созданные следующим образом:
create table test_a (id INT, dat VARCHAR(1));
create table test_b (id INT);
insert into test_a(id, dat) values
	(10, 'A'),
	(20, 'A'),
	(30, 'F'),
	(40, 'D'),
	(50, 'C');
insert into test_b(id) values
	(10),
	(30),
	(50);
		
-- -- Первый шаг, выводим те id который есть во второй таблице
SELECT * 
FROM test_a
WHERE id IN (SELECT * FROM test_b);

-- -- Второйй шаг, выводим те id которых НЕТ во второй таблице, но используем NOT
SELECT * 
FROM test_a
WHERE id NOT IN (SELECT * FROM test_b);

-- -- Третий шаг, выводим те id которых нет во второй таблице, но НЕ используем NOT
SELECT id, dat
FROM (  
	SELECT t1.id AS id, dat, t2.id AS id2 
	FROM test_a t1
	LEFT JOIN test_b t2
	ON t1.id = t2.id) AS temptable
WHERE id2 is NULL;
    
    SELECT *
FROM (SELECT * FROM test_a);