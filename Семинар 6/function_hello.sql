CREATE DEFINER=`root`@`localhost` FUNCTION `hello`() RETURNS char(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE current_hour INT;
    DECLARE greeting VARCHAR(50);
    
    -- Получаем текущий час с помощью функции HOUR() и сохраняем его в переменной current_hour.
    SET current_hour = HOUR(NOW());
    
    -- Используем функцию CASE для определения соответствующего приветствия в зависимости от текущего часа.
    SET greeting = 
        CASE
            WHEN current_hour >= 6 AND current_hour < 12 THEN 'Доброе утро'
            WHEN current_hour >= 12 AND current_hour < 18 THEN 'Добрый день'
            WHEN current_hour >= 18 AND current_hour < 24 THEN 'Добрый вечер'
            ELSE 'Доброй ночи'
        END;
    
    -- Возвращаем приветствие.
    RETURN greeting;
END