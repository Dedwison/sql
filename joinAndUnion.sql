-- Union
SELECT code, name
FROM continent
WHERE name like '%America'
UNION
SELECT code, name
FROM continent
WHERE code IN (3,5)
ORDER BY code ASC;

-- Join (Where)
SELECT a.name AS country, b.name AS continent
FROM country a, continent b
WHERE a.continent = b.code
ORDER BY b.name ASC;

-- Join (Inner)
SELECT a.name AS country, b.name AS continent
FROM country a
INNER JOIN continent b ON a.continent = b.code
ORDER BY b.name ASC;

-- Resetear Sequencia
ALTER SEQUENCE continent_id_seq RESTART WITH 9;

-- Join (Full Outer)
SELECT a.name AS country, a.continent AS continentCode, b.name AS continentName
FROM country a
FULL OUTER JOIN continent b ON a.continent = b.code
ORDER BY a.name DESC;

-- Join (Right Exclude)
SELECT a.name AS country, a.continent AS continentCode, b.name AS continentName
FROM country a
RIGHT JOIN continent b ON a.continent = b.code
WHERE a.continent IS NULL
ORDER BY a.name DESC;

-- Join (Agregaions + joins)
SELECT COUNT(*), b.name
FROM country a
INNER JOIN continent b ON a.continent = b.code
GROUP BY b.name
ORDER BY COUNT(*) ASC;

-- Cuantos Paises hay por continentes
(SELECT COUNT(*) AS count, b.name
FROM country a
INNER JOIN continent b ON a.continent = b.code
GROUP BY b.name
)
UNION
(SELECT 0 AS count, b.name
FROM country a
RIGHT JOIN continent b ON a.continent = b.code
WHERE a.continent IS NULL
GROUP BY b.name
)
ORDER BY count ASC;
--***********************+
SELECT COUNT(a.*) AS total, b.name
FROM country a
RIGHT JOIN continent b ON a.continent = b.code
GROUP BY b.name
ORDER BY total ASC;

-- Count Union
(SELECT COUNT(*) AS Total, b.name
FROM country a
INNER JOIN continent b ON a.continent = b.code
WHERE b.name NOT LIKE '%America'
GROUP BY b.name
)
UNION
(SELECT COUNT(*) AS Total, 'America'
FROM country a
INNER JOIN continent b ON a.continent = b.code
WHERE b."name" LIKE '%America')
ORDER BY Total ASC;


-- Demostrar el país con más ciudades
-- Campos: total ciudades y nombre del país
-- Usar INNER JOIN

SELECT count(*) AS total, b.name AS country FROM city a
INNER JOIN country b ON a.countrycode = b.code
GROUP BY b.name
ORDER BY count(*) DESC
LIMIT 1;

-- Traer los idiomas oficiales que se hablan por continentes
SELECT * FROM countrylanguage WHERE isofficial = true

SELECT * FROM country

SELECT * FROM continent

SELECT a."language", c.name AS continent FROM countrylanguage a
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
WHERE a.isofficial = true


SELECT d."name", c.name AS continent FROM countrylanguage a
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
INNER JOIN "language" d ON a.languagecode = d.code
WHERE a.isofficial = true