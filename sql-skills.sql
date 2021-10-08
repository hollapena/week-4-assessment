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

-- EXTRA CREDIT

-- ARTIST TABLE

SELECT *
FROM artist
ORDER BY name DESC
LIMIT 10;

SELECT *
FROM artist
WHERE name LIKE 'Black%';

SELECT *
FROM artist
WHERE name LIKE '%Black%';

--EMPLOYEES TABLE

SELECT birth_date
FROM employee
ORDER BY birth_date DESC
LIMIT 1;

SELECT birth_date
FROM employee
ORDER BY birth_date ASC
LIMIT 1;

--INVOICE TABLE

SELECT COUNT(*)
FROM invoice
WHERE billing_state IN ('TX', 'CA', 'AZ');

SELECT AVG(total)
FROM invoice;

--MORE JOIN QUERIES

SELECT track_id
FROM playlist_track
WHERE track_id IN(
    SELECT track_id
    FROM playlist_track
    WHERE playlist_id IN (
        SELECT playlist_id
        FROM playlist
        WHERE name = 'Music'
    )
);

SELECT name
FROM track 
WHERE track_id IN(
    SELECT track_id
    FROM playlist_track 
    WHERE playlist_id = 5
);

SELECT t.name, p.name
FROM track t 
JOIN playlist_track pt
ON t.track_id = pt.track_id
JOIN playlist p 
ON p.playlist_id = pt.playlist_id;

SELECT t.name, a.title
FROM track t 
JOIN album a 
ON t.album_id = a.album_id
JOIN genre g 
ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk';