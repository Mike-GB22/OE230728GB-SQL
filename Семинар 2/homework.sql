/*
2023/07/28
SQL. Семинар 2.
Домашнее защание
*/

/*
Домашнее защание. Часть 1.
1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными.
Справа располагается рисунок к первому 
заданию.

id order_date count_product
1 2022-01-01 156
2 2022-01-02 180
3 2022-01-03 21
4 2022-01-04 124
5 2022-01-05 341
*/

USE seminar2;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id SERIAL NOT NULL PRIMARY KEY,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales (order_date, count_product) VALUES
("2022-01-01", 156);
("2022-01-02", 180),
("2022-01-03", 21),
("2022-01-04", 124),
("2022-01-05", 341);

SELECT * FROM sales;

/*
Домашнее защание. Часть 2.
2. Для данных таблицы “sales” укажите тип 
заказа в зависимости от кол-ва : 
меньше 100  - Маленький заказ
от 100 до 300 - Средний заказ
больше 300  - Большой заказ

id заказа Тип заказа
1 Средний заказ
2 Средний заказ
3 Маленький заказ
4 Средний заказ
*/

SELECT 
	id AS "id заказа",
    IF (count_product < 100, 'Маленький заказ',
		IF (count_product BETWEEN 100 AND 300, 'Средний заказ',
			IF (count_product > 300, 'Болшой заказ','')
		)
	) AS "Тип заказа"
FROM sales;



/*
Домашнее защание. Часть 4.
4.  Чем 0 отличается от NULL?
Напишите ответ в комментарии к домашнему заданию на платформе

id employee_id amount order_status
1 e03 15.00 OPEN
2 e01 25.50 OPEN
3 e05 100.70 CLOSED
4 e02 22.18 OPEN
5 e04 9.50 CANCELLED
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED  - «Order is closed»; CANCELLED  - «Order is cancelled»
*/

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL NOT NULL PRIMARY KEY,
    employee_id VARCHAR(3) NOT NULL,
    amount FLOAT NOT NULL,
    order_status VARCHAR(10)
);

INSERT INTO orders (employee_id, amount, order_status) VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED");

SELECT * FROM orders;

SELECT 
	id AS "id заказа",
    employee_id AS "id сотрудника",
    amount AS "количество",
    CASE order_status
		WHEN "OPEN" THEN "Order is in open state"
        WHEN "CLOSED" THEN "Order is closed"
        WHEN "CANCELLED" THEN "Order is cancelled"
        ELSE "UNKNOWN"
	END AS "full_order_status"
FROM orders;   
 
/*
Домашнее защание. Часть 3.
4.  Чем 0 отличается от NULL?

Ответ: NULL это отсутсвие любого значения, 
0 же является сам по себе значением.
*/