/*
2023/08/12
Семинар 5.
SQL – оконные функции

Домашнее задание

Задание 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000;

Задание 2. Изменить в существующем представлении порог для стоимости:
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW CheapCars AS SELECT Name FROM CarsWHERE Cost<30000;

Задание 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
*/

/*
USE seminar4homework;
SELECT * FROM auto;

CREATE VIEW CheapCars AS SELECT REGNUM, MARK FROM auto WHERE REGNUM<111117;
SELECT * FROM CheapCars;
*/


# Задание 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000;

# Задание 2. Изменить в существующем представлении порог для стоимости:
# пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<30000;

# Задание 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
ALTER VIEW SckodaCars AS SELECT Name FROM Cars WHERE Model LIKE "Schkoda%";
ALTER VIEW AudiCars AS SELECT Name FROM Cars WHERE Model LIKE "Audi%";
