-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX

-- SELECT
-- 	first_name, last_name, last_connection
-- FROM
-- 	users
-- WHERE
-- 	last_connection LIKE '221%';

-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas

-- SELECT
-- 	first_name, last_name, followers
-- FROM
-- 	users
-- WHERE
-- 	followers > 4600;


-- Rangos
-- SELECT
-- 	first_name, last_name, followers
-- FROM
-- 	users
-- WHERE
-- -- 	followers >= 4600 AND followers <= 4700
-- 	followers BETWEEN 4600 AND 4700
-- ORDER BY
-- 	followers asc;

-- Promedios
-- SELECT
-- 	COUNT(*) AS total_users,
-- 	MIN( followers ) AS min_followers,
-- 	MAX( followers ) AS max_followers,
-- 	ROUND( AVG( followers ) ) AS avg_followers,
-- 	SUM( followers ) / COUNT(*) AS avg_manual,
-- 	cast( sum(followers) as decimal )/count(*) AS descimal_manual
-- FROM
-- 	users;

-- *************************
-- SELECT
-- 	first_name, last_name, followers
-- FROM
-- 	users
-- WHERE
-- 	followers = 4 OR followers = 4999;


-- SELECT
-- 	COUNT(*)
-- FROM
-- 	users
-- WHERE
-- 	followers = 4;

-- SELECT
-- 	COUNT(*)
-- FROM
-- 	users
-- WHERE
-- 	followers = 499;


-- SELECT
-- 	COUNT(*)
-- FROM
-- 	users
-- WHERE
-- 	followers = 4 OR followers = 4999;


-- SELECT
-- 	COUNT(*), followers
-- FROM
-- 	users
-- WHERE
--/ followers = 4 OR followers = 4999
-- 	followers = ( SELECT MIN ( followers ) FROM users ) OR followers = ( SELECT MAX ( followers ) FROM users )
-- GROUP BY
-- 	followers;


-- SELECT
-- 	COUNT(*), followers
-- FROM
-- 	users
-- WHERE
-- 	followers BETWEEN 4600 AND 4700
-- GROUP BY
-- 	followers
-- ORDER BY
-- 	followers DESC;
-- *******************************

-- Having
-- SELECT
-- 	COUNT(*),
-- 	country
-- FROM
-- 	users
-- GROUP BY
-- 	country
-- HAVING
-- 	COUNT(*) > 5
-- ORDER BY
-- 	country ASC;


-- GroupBy + Functions
SELECT
	COUNT(*), SUBSTRING( email, POSITION( '@' in email ) + 1 ) AS domain
FROM
	users
GROUP BY
	SUBSTRING( email, POSITION( '@' in email ) + 1 )
HAVING
	COUNT(*) > 1;