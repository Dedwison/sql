-- CREATE TABLE users3 (name VARCHAR(10) UNIQUE);

-- INSERT INTO users3
-- 	(name)
-- VALUES
-- 	('javier'),
-- 	('jose');

-- UPDATE
-- 	users3
-- SET
-- 	name = 'José'
-- WHERE
-- 	name = 'jose';

-- SELECT
-- 	* 
-- FROM
-- 	users3
-- LIMIT
-- 	2
-- OFFSET
-- 	1;

-- SELECT
-- 	*
-- FROM
-- 	users3
-- WHERE
-- 	name = 'Javier';

-- SELECT
-- 	*
-- FROM
-- 	users3
-- WHERE
-- 	name LIKE '%i%';

-- DELETE
-- FROM
-- 	users3
-- WHERE name = 'Sh%';

-- eliminar
-- DROP
-- TABLE
-- 	users3

-- vaciar
-- TRUNCATE
-- TABLE
-- 	users3



-- concatenar
-- SELECT
-- 	id,
-- 	UPPER(name) AS upper_name,
-- 	LOWER(name) AS lower_name,
-- 	LENGTH(name) AS length_name,
-- 	(20 * 2) AS constante,
-- 	'*'||id||'-'||name||'*' AS barcode,
-- 	CONCAT('*',id,'-',name,'*'),
-- 	name
-- FROM
-- 	users

-- separar valor
SELECT
	name,
	SUBSTRING( name, 0, POSITION( ' ' in name) ) AS first_name,
	SPLIT_PART(name, ' ', 2) AS second_name
-- 	SUBSTRING( name, POSITION( ' ' in name) + 1 ) AS last_name
FROM
	users;

-- rellenar valores de columnas con datos de otra columna
UPDATE
	users
SET
	first_name = SUBSTRING( name, 0, POSITION( ' ' in name) ),
	last_name = SPLIT_PART(name, ' ', 2)
	
SELECT
	*
FROM
	users