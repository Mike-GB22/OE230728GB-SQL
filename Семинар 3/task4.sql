/*
2023/08/01
Семинар 3.
Задание 4. 

1. Выведите общее количество напечатанных страниц каждым сотрудником
2. Посчитайте количество страниц за каждый день
3. Найдите среднее арифметическое по количеству страниц, напечатанных сотрудниками за каждый день
*/
USE seminar3;

DROP TABLE IF EXISTS activity_staff;
CREATE TABLE activity_staff(
	id 			SERIAL NOT NULL PRIMARY KEY,
    staff_id	INT NOT NULL,
	date_activity DATE NOT NULL,
    count_page	INT
);

INSERT INTO activity_staff VALUES
(1, 1, "2022-01-01", 250),
(2, 2, "2022-01-01", 220),
(3, 3, "2022-01-01", 170),
(4, 1, "2022-01-02", 100),
(5, 2, "2022-01-02", 220),
(6, 3, "2022-01-02", 300),
(7, 7, "2022-01-02", 350),
(8, 1, "2022-01-03", 168),
(9, 2, "2022-01-03", 62),
(10, 3, "2022-01-03", 84);

SELECT * FROM activity_staff;

-- 1. Выведите общее количество напечатанных страниц каждым сотрудником
SELECT SUM(count_page) AS "количество напечатанных страниц", staff_id AS "id сотрудника", staff.name_first, staff.name_last
FROM activity_staff
LEFT JOIN staff
ON activity_staff.staff_id = staff.id
GROUP BY staff_id;

-- 2. Посчитайте количество страниц за каждый день
SELECT SUM(count_page) AS "количество напечатанных страниц", date_activity AS "дата"
FROM activity_staff
GROUP BY date_activity;

-- 3. Найдите среднее арифметическое по количеству страниц, напечатанных сотрудниками за каждый день
SELECT AVG(count_page) AS "количество напечатанных страниц", staff_id AS "id сотрудника", staff.name_first, staff.name_last
FROM activity_staff
LEFT JOIN staff
ON activity_staff.staff_id = staff.id
GROUP BY staff_id;