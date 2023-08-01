/*
2023/07/31
Семинар 3.
Задание 2. На основе таблиц Задания 1

1. Выведите уникальные (неповторяющиеся) значения полей "firstname"
2. Отсортируйте записи по возрастанию значений поля "id". Выведите первые   две записи данной выборки
3. Отсортируйте записи по возрастанию значений поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3
4. Отсортируйте записи по убыванию поля "id". Пропустите две строки данной выборки и извлеките следующие за ними 3 строки
*/
USE seminar3;

-- Просто ознакомительный вывод, сортируем по именам
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY name_first;

-- 1. Выведите уникальные (неповторяющиеся) значения полей "firstname"
SELECT DISTINCT t1.name_first
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY name_first;

-- 2. Отсортируйте записи по возрастанию значений поля "id". Выведите первые   две записи данной выборки
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY t1.id
LIMIT 2;

-- 3. Отсортируйте записи по возрастанию значений поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY t1.id
LIMIT 3 OFFSET 4;

-- 3A. Отсортируйте записи по возрастанию значений поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY t1.id
LIMIT 4, 3;

-- 4. Отсортируйте записи по убыванию поля "id". Пропустите две строки данной выборки и извлеките следующие за ними 3 строки
SELECT t1.id, t1.name_first, t1.name_last, t2.name_post, t1.seniority, t1.age
FROM staff t1
LEFT JOIN staff_post t2
ON t1.post_id = t2.id
ORDER BY t1.id DESC
LIMIT 3 OFFSET 2;

