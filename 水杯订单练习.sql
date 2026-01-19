CREATE TABLE cup_orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  cup_type VARCHAR(20),
  amount INTEGER,
  order_date DATE
);

INSERT INTO cup_orders VALUES
(1,'500ml', 1000, '20240501'),
(2,'300ml',  800, '20240502'),
(3,'500ml', 1200, '20240503'),
(4,'500ml',  900, '20240504'),
(5,'300ml',  700, '20240505');

UPDATE cup_orders
SET order_date = substr(order_date, 1, 4) || '-' ||
               cast(substr(order_date, 5, 2) AS INT) || '-' ||
               cast(substr(order_date, 7, 2) AS INT);

SELECT * FROM cup_orders

SELECT cup_type, SUM(amount) total_sales
FROM cup_orders
GROUP BY cup_type;

SELECT * FROM cup_orders
WHERE cup_type='500ml' AND amount>900;

SELECT * FROM cup_orders
