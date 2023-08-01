/*
2023/08/01
Семинар 3.
Задание 6. 

1. Выведите id сотрудников, которые напечатали более 500 страниц за все дни
2. Выведите  дни, когда работало более 3 сотрудников Также укажите кол-во сотрудников, которые работали в выбранные дни.
3. Выведите должности, у которых средняя заработная плата составляет более 30000 


*/
USE seminar3;

-- 1. Выведите id сотрудников, которые напечатали более 500 страниц за все дни
SELECT SUM(count_page) AS "Сумма страниц", staff_id, staff.name_first, staff.name_last
FROM activity_staff
LEFT JOIN staff
ON staff_id = staff.id
GROUP BY staff_id
HAVING SUM(count_page) > 500;

-- 2.  Выведите  дни, когда работало более 2 сотрудников
-- Также укажите кол-во сотрудников, которые работали в выбранные дни.
SELECT COUNT(staff_id) AS "Количество сотрудников работавший в эту дату", date_activity AS "Дата"
FROM activity_staff
GROUP BY date_activity
HAVING COUNT(staff_id) > 2;

-- Хотел сам поэкмперементировать, но не сраслось:
-- Укажите сотрудников, которые работали в выбранные дни.
SELECT staff_id
FROM activity_staff
WHERE date_activity = 
	(SELECT date_activity
	FROM activity_staff
	GROUP BY date_activity
	HAVING COUNT(staff_id) > 2);
    
    
-- 3. Выведите должности, у которых средняя заработная плата составляет более 30000 
SELECT staff_post.name_post AS "Должность", AVG(salary) AS "Средний заработок"
FROM staff
LEFT JOIN staff_post
ON post_id = staff_post.id
GROUP BY post_id;