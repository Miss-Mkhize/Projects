# U.S HOUSEHOLD INCOME Data Cleaning

SELECT *
FROM us_household_income; 

SELECT *
FROM us_household_income_statistics;


SELECT COUNT(id)
FROM us_household_income; 

SELECT COUNT(id)
FROM us_household_income_statistics;

SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1
; 

DELETE FROM us_household_income
WHERE row_id IN (
		SELECT row_id
		FROM (
			SELECT row_id,
			id,
			ROW_NUMBER() OVER(PARTITION BY id ORDER BY id)row_num
			FROM us_household_income ) duplicates
		WHERE row_num > 1 );

SELECT DISTINCT State_Name
FROM us_household_income
GROUP BY State_Name
ORDER BY 1;

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

SELECT *
FROM us_household_income
WHERE Place = ''
ORDER BY 1;

SELECT *
FROM us_household_income
WHERE Zip_Code = '35179'
ORDER BY 1;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE Place = '';

SELECT type, COUNT(type)
FROM us_household_income
GROUP BY type
#HAVING COUNT(type) > 1
;

UPDATE us_household_income
SET `type` = 'Borough'
WHERE `type` = 'Boroughs';

SELECT ALand, AWater
FROM us_household_income
WHERE (AWater = 0 OR AWater = '' OR AWater IS NULL)
AND (ALand = 0 OR ALand = '' OR ALand IS NULL);















































