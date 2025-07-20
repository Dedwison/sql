SELECT
	now()

SELECT * FROM pg_timezone_names

SET TIMEZONE to 'America/Santiago';

SELECT * FROM employees
WHERE hire_date > '1998-02-05'
ORDER BY hire_date DESC;

SELECT 
	MAX(hire_date) AS ultimaContratación,
	MIN(hire_date) AS primeraContratación
FROM employees;

SELECT * FROM employees
WHERE hire_date BETWEEN '1999-01-01' AND '2000-01-04'
ORDER BY hire_date DESC;

SELECT
	MAX(hire_date),
-- 	MAX(hire_date) + INTERVAL '1 days' AS incrementDays,
-- 	MAX(hire_date) + INTERVAL '1 month' AS incrementMonts,
-- 	MAX(hire_date) + INTERVAL '1 year' AS incrementYears,
	MAX(hire_date) + INTERVAL '1.1 year' + INTERVAL '1 day' AS incrementYearMontDay,
	DATE_PART('year', now()),
	MAKE_INTERVAL( YEARS:= DATE_PART('year', now()):: INTEGER ),
	MAX(hire_date) + MAKE_INTERVAL( YEARS:= 23 )
FROM employees;

SELECT
	hire_date,
	MAKE_INTERVAL( YEARS := 2025 - EXTRACT( YEARS FROM hire_date )::INTEGER ) AS manual,
	
	MAKE_INTERVAL( YEARS := date_part( 'years', CURRENT_DATE)::INTEGER - EXTRACT( YEARS FROM hire_date )::INTEGER ) AS computed
FROM employees
ORDER BY hire_date DESC;

-- UPDATE employees
-- SET hire_date = hire_date + INTERVAL '25 years';

SELECT
	first_name,
	last_name,
	hire_date,
	CASE
		WHEN hire_date > now() - INTERVAL '1 year' THEN '1 año o menos'
		WHEN hire_date > now() - INTERVAL '3 year' THEN '1 o 3 años'
		WHEN hire_date > now() - INTERVAL '6 year' THEN '3 o 6 años'
		ELSE '+ de 6 años'
	END AS rango_antiguedad
FROM employees
ORDER BY hire_date DESC