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