/*

2023/08/04
Семинар 6.
SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы

Домашнее задание

Задание 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

Задание 2. Выведите только четные числа от 1 до 10. 
Пример: 2,4,6,8,10 

Данная промежуточная аттестация оценивается по системе "зачет" / "не зачет" "Зачет" ставится, если слушатель успешно выполнил 1 или 2 задачи "Незачет" ставится, если слушатель успешно выполнил 0 задач
Критерии оценивания: 1 - слушатель верно создал функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 2 - слушатель выведили только четные числа от 1 до 10.
*/
-- -----------------------------------------------------
-- Задание 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
-- -----------------------------------------------------

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS task1;

DELIMITER $$
CREATE FUNCTION task1 ( secondes INT ) RETURNS VARCHAR(100)
BEGIN
	DECLARE textOut VARCHAR(100);
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE prompt VARCHAR(100);
    SET prompt = CONCAT(secondes, ' -> \'');
    
    -- SET days := CEILING(secondes/(60*60*24));
    SET days := FLOOR(secondes/(60*60*24));
    SET secondes :=  secondes%(60*60*24);
    SET hours := FLOOR(secondes/(60*60));
	SET secondes :=  secondes%(60*60);
    SET minutes := FLOOR(secondes/(60));
    SET secondes :=  secondes%(60);
    RETURN CONCAT(prompt, days, ' days ', hours, ' hours ', minutes, ' minutes ', secondes, ' seconds \'');
END; $$
DELIMITER ;

SELECT task1(123456)
UNION ALL
SELECT "Пример: 123456 -> '1 days 10 hours 17 minutes 36 seconds '";

-- -----------------------------------------------------
-- Задание 2. Выведите только четные числа от 1 до 10. 
-- Пример: 2,4,6,8,10 
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS task2;
DELIMITER $$
CREATE PROCEDURE task2()
BEGIN
	DECLARE max INT DEFAULT 10;
	DECLARE counter INT DEFAULT 2;
    DECLARE textOut VARCHAR(100) DEFAULT '';
    WHILE counter <= (max - 2) DO
		-- SELECT counter;
        SET textOut = CONCAT(textOut, counter, ', ');
		SET counter = counter + 2;
	END WHILE;	
    SET textOut = CONCAT(textOut, counter);
    SELECT textOut;
END; $$
DELIMITER ;

CALL task2;


    
