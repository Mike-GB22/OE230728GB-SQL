
-- Устанавливаем разделитель на $$ для создания процедуры
DELIMITER $$

-- Создаем хранимую процедуру с именем SimpleLoop
CREATE PROCEDURE SimpleLoop()
BEGIN
  -- Объявляем переменную counter и устанавливаем начальное значение равное 1
  DECLARE counter INT DEFAULT 1;
  
  -- Цикл WHILE будет выполняться, пока значение counter меньше или равно 5
  WHILE counter <= 5 DO
    -- Выводим значение переменной counter
    SELECT counter;
    
    -- Увеличиваем значение counter на 1 для следующей итерации цикла
    SET counter = counter + 1;
  END WHILE; -- Конец цикла WHILE
END$$

-- Восстанавливаем стандартный разделитель
DELIMITER ;

CALL SimpleLoop();