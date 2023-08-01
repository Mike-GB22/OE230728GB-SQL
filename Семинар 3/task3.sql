/*
2023/07/31
Семинар 3.
Задание 3. На основе таблиц Задания 1

1. Найдите количество сотрудников с должностью «Рабочий» 
2. Посчитайте ежемесячную зарплату начальников
3. Выведите средний возраст сотрудников, у которых заработная плата больше 30000
4. Выведите максимальную и минимальную заработные платы

*/
USE seminar3;

-- Просто ознакомительный вывод, сортируем по именам
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY name_first;

-- 1A. Найдите сотрудников с должностью «Рабочий» 
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
WHERE t2.name_post = 'Рабочий'
ORDER BY name_first;

-- 1. Найдите *количество* сотрудников с должностью «Рабочий» 
SELECT COUNT(*) as "количество сотрудников с должностью «Рабочий»"
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
WHERE t2.name_post = 'Рабочий';

-- 2. Посчитайте ежемесячную зарплату начальников
SELECT SUM(salary) as "В сумме ежемесячная зарплату всех начальников", t2.name_post 
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
WHERE t2.name_post = 'Начальник';

-- 3. Выведите средний возраст сотрудников, у которых заработная плата больше 30000
SELECT AVG(age) as "Средний возраст сотрудников, у которых заработная плата больше 30000"
FROM staff
WHERE salary > 30000;

-- 4. Выведите максимальную и минимальную заработные платы
SELECT MAX(salary) as "максимальная заработная плата",
MIN(salary) as "минимальная заработная плата"
FROM staff;

