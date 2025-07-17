SELECT DISTINCT continent FROM country ORDER BY continent ASC;

INSERT INTO continent (name)
	SELECT DISTINCT continent 
	FROM country 
	ORDER BY continent ASC;

-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);


INSERT INTO country_bk
	SELECT *
	FROM country

SELECT * INTO country_bk FROM country

SELECT *
	FROM country


ALTER TABLE country DROP CONSTRAINT country_continent_check;

SELECT
	name, continent
FROM country;


SELECT
	a.name, a.continent,
	( SELECT "code" FROM continent b WHERE b."name" = a.continent )
FROM country a;

UPDATE country a
SET continent = ( SELECT "code" FROM continent b WHERE b."name" = a.continent );

ALTER TABLE country
ALTER COLUMN continent TYPE int4
USING continent::integer

-- +
ALTER TABLE 
	"public"."continent"
ADD 
	PRIMARY KEY ("code");


ALTER TABLE
	"public"."country"
ADD
	FOREIGN KEY ("continent") REFERENCES
	"public"."continent" ("code");