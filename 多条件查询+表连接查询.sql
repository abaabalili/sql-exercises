
CREATE TABLE order111 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT NOT NULL,
    amount INTEGER,
    ticket_date  DATE
);

INSERT INTO order111(id, ticket_date,type,amount) VALUES
(1, '2025-03-15',22,1000),
(2, '2025-03-16',33,1500);

INSERT INTO order111(id,ticket_date,type,amount)VALUES 
(3, '2025-03-17',22,1000),
(4, '2025-03-18',33,1500);

SELECT type,SUM(amount) 
FROM order111 
WHERE ticket_date 
BETWEEN'2025-03-10'AND '2025-03-20'
GROUP BY type
HAVING SUM(amount)>1000;


ALTER TABLE order111 ADD status VARCHAR(20);

UPDATE order111
SET status = CASE id
    WHEN 1 THEN 'paid'
    WHEN 2 THEN 'paid'
    WHEN 3 THEN 'refunded'
    WHEN 4 THEN 'refunded'
    ELSE 'na'
END
WHERE id IN (1,2,3,4);


CREATE TABLE tax (
    tid INTEGER PRIMARY KEY AUTOINCREMENT,
    price INTEGER
);

INSERT INTO tax(tid,price) VALUES (1,100);
INSERT INTO tax(tid,price) VALUES (2,100);
INSERT INTO tax(tid,price) VALUES (3,100);
INSERT INTO tax(tid,price) VALUES (4,100);

SELEcT * FROM tax;

SELECT o.id, t.price, o.status
 FROM order111 o 
 LEFT JOIN tax t ON o.id=t.tid 
 WHERE o.status='refunded' 
 LIMIT 5;

