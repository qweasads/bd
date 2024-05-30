# Скриншот 
![itog](https://github.com/qweasads/bd/assets/126321177/66cf708b-dd89-4b51-babf-4b9b091ee255)

# Типовые запросы
1.Отобразить общую сумму продаж за последний месяц
```sql
SELECT SUM(goods.price * order_details.amount) AS total_sales
FROM goods
JOIN order_details ON goods.id = order_details.good_id
JOIN orders ON order_details.order_id = orders.id
WHERE orders.date_time >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
```
2.Запрос на вывод списка клиентов, у которых не было заказов
```sql
SELECT c.id as customer_id, c.name as customer_name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
```
3.Отобразить общую сумму и количество заказов каждого клиента
```sql
SELECT
customers.id,
customers.name,
COUNT(orders_with_total_price.id) AS orders_count,
IFNULL(SUM(orders_with_total_price.total_price), 0) as total_price
FROM 
customers
LEFT JOIN
orders_with_total_price ON orders_with_total_price.customer_id = customers.id
GROUP BY
customers.id;
```
4.Запрос на подсчет суммарной выручки от продаж в каждом городе
```sql
SELECT a.city, SUM(g.price * od.amount) as total_revenue
FROM addresses a
JOIN customers c ON a.customer_id = c.id
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
JOIN goods g ON od.good_id = g.id
GROUP BY a.city;
```
5.Вывести среднюю сумму заказа
```sql
SELECT
AVG(orders_with_total_price.total_price)
FROM
orders_with_total_price;
```
# Представление
Получение заказов клиентов и их сумма
```sql
SELECT * FROM orders_with_total_price;
```
# Хранимая процедура
Посмотреть доход за последний месяц
```sql
CALL get_last_month_revenue;
```
Добавление нового клиента
```sql
CALL add_customer('ФИО', 'Номер', 'Почта');
```

# Функция
Получение суммы заказа по id
```sql
SELECT calculate_order_total(8); 
```

# Создание ролей и прав
1. Роль "Пользователь"
```sql
-- создание роли
CREATE ROLE IF NOT EXISTS basic_user_role; 

-- присвоение прав
GRANT SELECT ON mydb.addresses TO basic_user_role;
GRANT SELECT ON mydb.customers TO basic_user_role;
GRANT SELECT ON mydb.goods TO basic_user_role;
GRANT SELECT ON mydb.order_details TO basic_user_role;
GRANT SELECT ON mydb.orders TO basic_user_role;

-- создание пользователя, если он еще не существует
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY '123';

-- назначение роли пользователю
GRANT basic_user_role TO 'user'@'localhost';
-- активация роли для пользователя
SET DEFAULT ROLE basic_user_role TO 'user'@'localhost';
-- применение изменений прав
FLUSH PRIVILEGES;
```
2. Роль "Администратор"
```sql
-- создание роли
CREATE ROLE IF NOT EXISTS admin_role; 

-- Предоставление полных прав администратору на схему mydb
GRANT ALL PRIVILEGES ON mydb.* TO admin_role;

-- создание пользователя, если он еще не существует
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY '123';

-- назначение роли пользователю
GRANT admin_role TO 'admin'@'localhost';

-- активация роли для пользователя
SET DEFAULT ROLE admin_role TO 'admin'@'localhost';

-- применение изменений прав
FLUSH PRIVILEGES;
```

