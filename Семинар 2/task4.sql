/*
2023/07/28
SQL. Семинар 2.
Задача 4 (в методичке 3)
Выведите id, название фильма 

и категорию фильма, согласно следующего 
перечня: 
Д- Детская, П – Подростковая, 
В – Взрослая, Не указана

*/

USE seminar2;

SELECT * FROM cinema;

ALTER TABLE cinema
ADD COLUMN age_category VARCHAR(30) AFTER genre_id;

UPDATE cinema SET age_category = "Детский" WHERE id = 1;
UPDATE cinema SET age_category = "Подростковый" WHERE id = 2 OR id = 3;
UPDATE cinema SET age_category = "Взрослый" WHERE id = 5 OR id = 7;

SELECT 
	id,
    title,
    CASE age_category
		WHEN age_category LIKE 'Д%' THEN "Детское кино" 
        WHEN age_category LIKE 'П%' THEN "Кино для подростков"
        WHEN age_category LIKE 'В%' THEN "Взрослая похабщина"
        ELSE "Возрастное ограничение не известно"
	END AS 'Категория'
FROM cinema;