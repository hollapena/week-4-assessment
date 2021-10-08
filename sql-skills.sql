-- ARTIST TABLE

INSERT INTO artist
(name)
VALUES
('Weezer'),('The Maccabees'),('The Decemberists');

SELECT * FROM artist
ORDER BY name ASC
LIMIT 5;

-- EMPLOYEE TABLE

SELECT first_name, last_name
FROM employee 
WHERE city = 'Calgary';

SELECT *
FROM employee 
WHERE reports_to IN(
    SELECT employee_id
    FROM employee
    WHERE first_name='Nancy' AND last_name='Edwards'
);
-- I FOUND THIS WAY ^^^ TO DO THIS BUT CAN ALSO DO IT THE WAY
-- REQUESTED (IN TWO SEPARATE STEPS) SHOWN BELOW

SELECT employee_id
FROM employee
WHERE first_name='Nancy' AND last_name='Edwards';

SELECT *
FROM employee
WHERE reports_to=2;

SELECT COUNT(*)
FROM employee
WHERE city = 'Lethbridge';

-- INVOICE TABLE

SELECT COUNT(*)
FROM invoice
WHERE billing_country = 'USA';

SELECT total
FROM invoice
ORDER BY total DESC 
LIMIT 1;

SELECT total
FROM invoice
ORDER BY total ASC
LIMIT 1;

SELECT *
FROM invoice
WHERE total > 5;

SELECT COUNT(*)
FROM invoice
WHERE total < 5;

SELECT SUM(total)
FROM invoice;

-- JOIN QUERIES

SELECT *
FROM invoice
WHERE invoice_id IN(
    SELECT invoice_id
    FROM invoice_line
    WHERE unit_price > 0.99
);

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i 
JOIN customer c 
ON i.customer_id = c.customer_id;

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c 
JOIN employee e 
ON c.support_rep_id = e.employee_id;

SELECT a.title, ar.name
FROM album a 
JOIN artist ar 
ON a.artist_id = ar.artist_id;

