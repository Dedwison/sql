

-- 1. Crear una llave primaria en city (id)

-- ALTER TABLE city
-- ADD PRIMARY KEY (id);

-- 2. Crear un check en population, para que no soporte negativos

-- ALTER TABLE city
-- ADD CHECK(
-- 	population >=0
-- );

-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language

-- ALTER TABLE countrylanguage
-- ADD PRIMARY KEY (countrycode, language);

-- 4. Crear check en percentage, 
-- Para que no permita negativos ni números superiores a 100

-- ALTER TABLE countrylanguage
-- ADD CHECK(
-- 	( percentage >=0 ) AND ( percentage <= 100 )
-- );



-- SELECT
-- 	*
-- FROM
-- 	city
-- WHERE
-- 	name = 'Jinzhou' AND
-- 	countrycode = 'CHN' AND
-- 	district = 'Liaoning';

-- CREATE UNIQUE INDEX "unique_name_countrycode_district" ON city (
-- 	name, countrycode, district
-- );


-- CREATE INDEX "district" ON city (
-- 	district
-- );


-- ALTER TABLE city
-- 	ADD CONSTRAINT fk_country_code
-- 	FOREIGN KEY ( countrycode )
-- 	REFERENCES country( code );


-- INSERT INTO
-- 	country
-- VALUES
-- 	('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');

ALTER TABLE countrylanguage
	ADD CONSTRAINT fk_country_code
	FOREIGN KEY ( countrycode )
	REFERENCES country( code );

ALTER TABLE countrylanguage
DROP CONSTRAINT fk_country_code;

ALTER TABLE countrylanguage
ADD CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country (code) ON DELETE cascade;

DELETE FROM country WHERE code = 'AFG';

SELECT * FROM country WHERE code = 'AFG';

SELECT * FROM city WHERE countrycode = 'AFG';

SELECT * FROM countrylanguage WHERE countrycode = 'AFG';
