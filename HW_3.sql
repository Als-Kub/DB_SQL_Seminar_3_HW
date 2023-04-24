USE hw_3;

CREATE TABLE salespeople (
snum INT NOT NULL,
sname VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
comm VARCHAR(30) NOT NULL);

INSERT salespeople(snum, sname, city, comm)
VALUES (1001, "Peel", "London", ".12"),
(1002, "Serres", "San Jose", ".13"),
(1004, "Motika", "London", ".11"),
(1007, "Rifkin", "Barcelona", ".15"),
(1003, "Axelrod", "New York", ".10");


CREATE TABLE customers (
cnum INT NOT NULL,
cname VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
rating INT NOT NULL,
snum INT NOT NULL);

INSERT customers (cnum, cname, city, rating, snum)
VALUES (2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanny", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

CREATE TABLE orders (
onum INT NOT NULL,
amt FLOAT NOT NULL,
odate VARCHAR(30) NOT NULL,
cnum INT NOT NULL,
snum INT NOT NULL);

INSERT orders (onum, amt, odate, cnum, snum)
VALUES (3001, 18.69, "10/03/1990", 2008, 1007),
(3003, 767.19, "10/03/1990", 2001, 1001),
(3002, 1900.10, "10/03/1990", 2007, 1004),
(3005, 5160.45, "10/03/1990", 2003, 1002),
(3006, 1098.16, "10/03/1990", 2008, 1007),
(3009, 1713.23, "10/04/1990", 2002, 1003),
(3007, 75.75, "10/04/1990", 2003, 1002),
(3008, 4723.00, "10/05/1990", 2006, 1001),
(3010, 1309.95, "10/06/1990", 2004, 1002),
(3011, 9891.88, "10/06/1990", 2006, 1001);

/* 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, 
comm. (к первой или второй таблице, используя SELECT) */
SELECT  city, sname, snum, comm FROM salespeople;

/* 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого
заказчика в городе San Jose. (“заказчики”) */
SELECT rating, cname FROM customers WHERE city = "SanJose";

/* 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких
бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)
 */
 SELECT DISTINCT snum FROM orders;
 
 /* 4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется 
оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
 */

SELECT cname FROM customers WHERE cname LIKE "G%";

/* 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
(“Заказы”, “amt” - сумма)
 */
SELECT * FROM orders WHERE amt > 1000;

/* 6. Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
 */
SELECT MIN(amt) FROM orders;

/* 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых
рейтинг больше 100 и они находятся не в Риме
 */
SELECT * FROM customers WHERE rating > 100 HAVING city != "Rome";


CREATE TABLE table_4(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
surname VARCHAR(30) NOT NULL,
specialty VARCHAR(30) NOT NULL,
seniority VARCHAR(30) NOT NULL,
salary INT NOT NULL,
age INT NOT NULL);

INSERT table_4(name, surname, specialty, seniority, salary, age)
values("Вася", "Васькин", "начальник", 40, 100000, 60),
("Петя", "Петькин", "начальник", 8, 70000, 30),
("Катя", "Каткина", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Иван", "Иванов", "рабочий", 40, 30000, 59),
("Петр", "Петров", "рабочий", 20, 25000, 40),
("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
("Антон", "Антонов", "рабочий", 8, 19000, 28),
("Юра", "Юркин", "рабочий", 5, 15000, 25),
("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24),
("Люся", "Люськина", "уборщик", 10, 10000, 49);

/* 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания */
SELECT salary FROM table_4 ORDER BY salary;
SELECT salary FROM table_4 ORDER BY salary DESC;

/* 2. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с 
наибольшей заработной платой (возможен подзапрос) */

SELECT salary FROM table_4 ORDER BY salary LIMIT 7, 5;

/* 3. Выполните группировку всех сотрудников по специальности , 
суммарная зарплата которых превышает 100000 */

SELECT specialty FROM table_4 GROUP BY specialty HAVING sum(salary) > 100000;
