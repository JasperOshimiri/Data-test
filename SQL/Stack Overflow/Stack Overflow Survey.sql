
/*---THIS IS THE ANALYSIS OF THE YEARLY DEVELOPERS SURVEY FOR 2021 CONDUCTED BY STACK OVERFLOW ---*/

/*TO VIEW THE COLUMNS NAMES AND DATA TYPES OF THE DATA SET*/
SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FINAL_DATA';

/*TO LOAD THE DATA SET*/
SELECT * FROM SOFS

/*VIEW THE EXTENT OF NA VALUES IN THE DATA SET BY VALUE BASED GROUPING*/
SELECT UK_COUNTRY, COUNT(UK_COUNTRY)  
FROM SOFS
GROUP BY UK_COUNTRY

/*VIEW THE EXTENT OF NA VALUES IN THE DATA SET BY VALUE BASED GROUPING*/
SELECT US_STATE, COUNT(US_STATE)  
FROM SOFS
GROUP BY US_STATE

/*DATA CLEANING*/
<----EXCEL WAS USED TO CLEAN THE DATA FROM UNWANTED CHARACTERS LIKE %$<>{}----->
SELECT RESPONSEID, MAINBRANCH, EMPLOYMENT, REPLACE(COUNTRY, 'NA', 'Not Entered') AS COUNTRY_ORIGIN, REPLACE(US_STATE, 'NA', 'Not Entered') AS STATE_OF_US,
REPLACE(UK_COUNTRY, 'NA', 'Not Entered') AS UK_COUNTRY, REPLACE(Edlevel, 'NA', 'Not Entered') AS Edu_Level, REPLACE(Age1stCode, 'NA', 'Not Entered') AS Age_1st_Code, REPLACE(LearnCode, 'NA', 'Not Entered') AS ModeOfLearning_Code, REPLACE(YearsCode, 'NA', 'Not Entered') AS YEARS_OF_CODE,
REPLACE(DEVTYPE, 'NA', 'Not Entered') AS DEVELOPER_TYPE, REPLACE(ORGSIZE, 'NA', 'Not Entered') AS ORGANIZATION_SIZE, REPLACE(CURRENCY, 'NA', 'Not Entered') AS CURRENCY_IN_USE, REPLACE(COMPTOTAL, 'NA', 'Not Entered') AS COMPENSATION, REPLACE(LANGUAGEHAVEWORKEDWITH, 'NA', 'Not Entered') AS LANGUAGE_YOU_HAVEWORKEDWITH, REPLACE(LANGUAGEWANTTOWORKWITH, 'NA', 'Not Entered') AS LANGUAGE_YOU_WANTTOWORKWITH, REPLACE(DATABASEHAVEWORKEDWITH, 'NA', 'Not Entered') AS DATABASE_YOU_HAVEWWORKEDWITH, REPLACE(DATABASEWANTTOWORKWITH, 'NA', 'Not Entered') AS DATABASE_YOU_WANTTOWORKWITH, REPLACE(PLATFORMHAVEWORKEDWITH, 'NA', 'Not Entered') AS PLATFORM_YOU_HAVEWORKEDWITH, REPLACE(PLATFORMWANTTOWORKWITH, 'NA', 'Not Entered') AS PLATFORM_YOU_WANTTOWORKWITH, REPLACE(WEBFRAMEHAVEWORKEDWITH, 'NA', 'Not Entered') AS WEBFRAME_YOU_WANTTOWORKWITH, REPLACE(MISCTECHHAVEWORKEDWITH, 'NA', 'Not Entered') AS MISCTECH_YOU_HAVETOWORKEDWITH, REPLACE(MISCTECHWANTTOWORKWITH, 'NA', 'Not Entered') AS MISCTECH_YOU_WANTOWORKWITH, REPLACE(TOOLSTECHHAVEWORKEDWITH, 'NA', 'Not Entered') AS TOOLSTECH_YOU_HAVEWORKEDWITH, REPLACE(TOOLSTECHWANTTOWORKWITH, 'NA', 'Not Entered') AS TOOLSTECH_YOU_WANTTOWORKWITH, REPLACE(NEWCOLLABTOOLSHAVEWORKEDWITH, 'NA', 'Not Entered') AS NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH,REPLACE(NEWCOLLABTOOLSWANTTOWORKWITH, 'NA', 'Not Entered') AS NEWCOLLABTOOLS_YOU_WANTTOWORKWITH, REPLACE(OPSYS, 'NA', 'Not Entered') AS OPERATING_SYSTEM,
REPLACE(NEWSTUCK, 'NA', 'Not Entered') AS NEW_STOCK, REPLACE(NEWSOSITES, 'NA', 'Not Entered') AS NEWSO_SITES, REPLACE(SOVISITFREQ, 'NA', 'Not Entered') AS SOVISIT_FRQUENCY, REPLACE(SOACCOUNT, 'NA', 'Not Entered') AS SO_ACCOUNT, REPLACE(SOPARTFREQ, 'NA', 'Not Entered') AS SOPART_FREQ, REPLACE(SOCOMM, 'NA', 'Not Entered') AS SO_COMM, REPLACE(NEWOTHERCOMMS, 'NA', 'Not Entered') AS NEW_OTHERCOMMS, REPLACE(AGE, 'NA', 'Not Entered') AS RESPONDENT_AGE, 
REPLACE(GENDER, 'NA', 'Not Entered') AS RESPONDENT_GENDER, REPLACE(TRANS, 'NA', 'Not Entered') AS TRANS_, REPLACE(SEXUALITY, 'NA', 'Not Entered') AS YOUR_SEXUALITY, REPLACE(ETHNICITY, 'NA', 'Not Entered') AS RESP_ETHNICITY, REPLACE(ACCESSIBILITY, 'NA', 'Not Entered') AS RESP_ACCESSIBILITY,
REPLACE(MENTALHEALTH, 'NA', 'Not Entered') AS MENTAL_HEALTH, REPLACE(SURVEYLENGTH, 'NA', 'Not Entered') AS LENGTH_OF_SURVEY, REPLACE(SURVEYEASE, 'NA', 'Not Entered') AS EASE_OF_SURVEY, REPLACE(CONVERTEDCOMPYEARLY, 'NA', 'Not Entered') AS CONVERTED_COMP_YEARLY INTO CLEANED_DATA1 FROM SOFS

/*REPLACING 'NOT ENETERED' ON NUMERIC VARIABLES FOR EASE OF CASTING*/
SELECT RESPONSEID, MAINBRANCH, EMPLOYMENT, COUNTRY_ORIGIN, STATE_OF_US, UK_COUNTRY, Edu_Level, Age_1st_Code, ModeOfLearning_Code, REPLACE(YEARS_OF_CODE, 'Not Entered',0) AS YERAS_OF_CODING, DEVELOPER_TYPE, ORGANIZATION_SIZE, CURRENCY_IN_USE, REPLACE(COMPENSATION, 'Not Entered', 0) AS COMPENSATION_RECD, LANGUAGE_YOU_HAVEWORKEDWITH, LANGUAGE_YOU_WANTTOWORKWITH, DATABASE_YOU_HAVEWWORKEDWITH,
DATABASE_YOU_WANTTOWORKWITH, PLATFORM_YOU_HAVEWORKEDWITH, PLATFORM_YOU_WANTTOWORKWITH, MISCTECH_YOU_HAVETOWORKEDWITH, MISCTECH_YOU_WANTOWORKWITH,
TOOLSTECH_YOU_HAVEWORKEDWITH, TOOLSTECH_YOU_WANTTOWORKWITH, NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH, NEWCOLLABTOOLS_YOU_WANTTOWORKWITH, OPERATING_SYSTEM,
NEW_STOCK, NEWSO_SITES, SOVISIT_FRQUENCY, SO_ACCOUNT, SOPART_FREQ, SO_COMM, NEW_OTHERCOMMS, RESPONDENT_AGE,RESPONDENT_GENDER, TRANS_, YOUR_SEXUALITY,
RESP_ACCESSIBILITY, MENTAL_HEALTH, LENGTH_OF_SURVEY, EASE_OF_SURVEY, REPLACE(CONVERTED_COMP_YEARLY, 'Not Entered', 0) AS CONVERTED_COMPENSATION_YEAR
INTO CLEANED_DATA2 FROM CLEANED_DATA1

/*UPDATE THE VALUES IN THE BELOW STATED COLUMNS*/
UPDATE CLEANED_DATA2 SET YERAS_OF_CODING = 'Below 1 Year' WHERE YERAS_OF_CODING = 'Less than 1 Year';
UPDATE CLEANED_DATA2 SET YERAS_OF_CODING = 'Over 50 Years' WHERE YERAS_OF_CODING = 'More than 50 years';

/*CAST NECESSARY COLUMNS AND LOAD INTO A NEW TABLE*/
SELECT RESPONSEID, MAINBRANCH, EMPLOYMENT, COUNTRY_ORIGIN, STATE_OF_US, UK_COUNTRY, Edu_Level, Age_1st_Code, ModeOfLearning_Code, YERAS_OF_CODING, DEVELOPER_TYPE, ORGANIZATION_SIZE, CURRENCY_IN_USE, CAST(COMPENSATION_RECD AS float) AS COMPENSATION_RECEIVED, LANGUAGE_YOU_HAVEWORKEDWITH, LANGUAGE_YOU_WANTTOWORKWITH, DATABASE_YOU_HAVEWWORKEDWITH,
DATABASE_YOU_WANTTOWORKWITH, PLATFORM_YOU_HAVEWORKEDWITH, PLATFORM_YOU_WANTTOWORKWITH, MISCTECH_YOU_HAVETOWORKEDWITH, MISCTECH_YOU_WANTOWORKWITH,
TOOLSTECH_YOU_HAVEWORKEDWITH, TOOLSTECH_YOU_WANTTOWORKWITH, NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH, NEWCOLLABTOOLS_YOU_WANTTOWORKWITH, OPERATING_SYSTEM,
NEW_STOCK, NEWSO_SITES, SOVISIT_FRQUENCY, SO_ACCOUNT, SOPART_FREQ, SO_COMM, NEW_OTHERCOMMS, RESPONDENT_AGE,RESPONDENT_GENDER, TRANS_, YOUR_SEXUALITY,
RESP_ACCESSIBILITY, MENTAL_HEALTH, LENGTH_OF_SURVEY, EASE_OF_SURVEY, CAST(CONVERTED_COMPENSATION_YEAR AS float) AS CONVERTED_COMPENSATION_YEARLY
INTO FINAL_DATA FROM CLEANED_DATA2

/*A VALUE COUNT OF ALL THE VARIABLES*/
SELECT  MAINBRANCH, COUNT( MAINBRANCH) AS MAIN_BRANCH FROM FINAL_DATA GROUP BY  MAINBRANCH ORDER BY 2 DESC
SELECT  EMPLOYMENT, COUNT( EMPLOYMENT) AS EMPLOYMENT_ FROM FINAL_DATA GROUP BY  EMPLOYMENT ORDER BY 2 DESC
SELECT  COUNTRY_ORIGIN, COUNT( COUNTRY_ORIGIN) AS COUNTRY_ORIGIN_ FROM FINAL_DATA GROUP BY  COUNTRY_ORIGIN ORDER BY 2 DESC
SELECT  STATE_OF_US, COUNT( STATE_OF_US) AS STATE_OF_US_ FROM FINAL_DATA GROUP BY  STATE_OF_US ORDER BY 2 DESC
SELECT  UK_COUNTRY, COUNT( UK_COUNTRY) AS UK_COUNTRY_ FROM FINAL_DATA GROUP BY  UK_COUNTRY ORDER BY 2 DESC
SELECT  Edu_Level, COUNT( Edu_Level) AS Edu_Level_ FROM FINAL_DATA GROUP BY  Edu_Level ORDER BY 2 DESC
SELECT  Age_1st_Code, COUNT( Age_1st_Code) AS Age_1st_Code_ FROM FINAL_DATA GROUP BY  Age_1st_Code ORDER BY 2 DESC
SELECT  ModeOfLearning_Code, COUNT( ModeOfLearning_Code) AS ModeOfLearning_Code_ FROM FINAL_DATA GROUP BY  ModeOfLearning_Code ORDER BY 2 DESC
SELECT  YERAS_OF_CODING, COUNT( YERAS_OF_CODING) AS YERAS_OF_CODING_ FROM FINAL_DATA GROUP BY  YERAS_OF_CODING ORDER BY 2 DESC
SELECT  DEVELOPER_TYPE, COUNT( DEVELOPER_TYPE) AS DEVELOPER_TYPE_ FROM FINAL_DATA GROUP BY  DEVELOPER_TYPE ORDER BY 2 DESC
SELECT  ORGANIZATION_SIZE, COUNT( ORGANIZATION_SIZE) AS ORGANIZATION_SIZE_ FROM FINAL_DATA GROUP BY  ORGANIZATION_SIZE ORDER BY 2 DESC
SELECT  CURRENCY_IN_USE, COUNT( CURRENCY_IN_USE) AS CURRENCY_IN_USE_ FROM FINAL_DATA GROUP BY  CURRENCY_IN_USE ORDER BY 2 DESC
SELECT  COMPENSATION_RECEIVED, COUNT( COMPENSATION_RECEIVED) AS COMPENSATION_RECEIVED_ FROM FINAL_DATA GROUP BY  COMPENSATION_RECEIVED ORDER BY 2 DESC
SELECT  LANGUAGE_YOU_HAVEWORKEDWITH, COUNT( LANGUAGE_YOU_HAVEWORKEDWITH) AS LANGUAGE_YOU_HAVEWORKEDWITH_ FROM FINAL_DATA GROUP BY  LANGUAGE_YOU_HAVEWORKEDWITH ORDER BY 2 DESC
SELECT  LANGUAGE_YOU_WANTTOWORKWITH, COUNT( LANGUAGE_YOU_WANTTOWORKWITH) AS LANGUAGE_YOU_WANTTOWORKWITH_ FROM FINAL_DATA GROUP BY  LANGUAGE_YOU_WANTTOWORKWITH ORDER BY 2 DESC
SELECT  DATABASE_YOU_HAVEWWORKEDWITH, COUNT( DATABASE_YOU_HAVEWWORKEDWITH) AS DATABASE_YOU_HAVEWWORKEDWITH_ FROM FINAL_DATA GROUP BY  DATABASE_YOU_HAVEWWORKEDWITH ORDER BY 2 DESC
SELECT  DATABASE_YOU_WANTTOWORKWITH, COUNT( DATABASE_YOU_WANTTOWORKWITH) AS DATABASE_YOU_WANTTOWORKWITH_ FROM FINAL_DATA GROUP BY  DATABASE_YOU_WANTTOWORKWITH ORDER BY 2 DESC
SELECT  PLATFORM_YOU_HAVEWORKEDWITH, COUNT( PLATFORM_YOU_HAVEWORKEDWITH) AS PLATFORM_YOU_HAVEWORKEDWITH_ FROM FINAL_DATA GROUP BY  PLATFORM_YOU_HAVEWORKEDWITH ORDER BY 2 DESC
SELECT  PLATFORM_YOU_WANTTOWORKWITH, COUNT( PLATFORM_YOU_WANTTOWORKWITH) AS PLATFORM_YOU_WANTTOWORKWITH_ FROM FINAL_DATA GROUP BY  PLATFORM_YOU_WANTTOWORKWITH ORDER BY 2 DESC
SELECT  MISCTECH_YOU_HAVETOWORKEDWITH, COUNT( MISCTECH_YOU_HAVETOWORKEDWITH) AS MISCTECH_YOU_HAVETOWORKEDWITH_ FROM FINAL_DATA GROUP BY  MISCTECH_YOU_HAVETOWORKEDWITH ORDER BY 2 DESC
SELECT  MISCTECH_YOU_WANTOWORKWITH, COUNT( MISCTECH_YOU_WANTOWORKWITH) AS MISCTECH_YOU_WANTOWORKWITH_ FROM FINAL_DATA GROUP BY  MISCTECH_YOU_WANTOWORKWITH ORDER BY 2 DESC
SELECT  TOOLSTECH_YOU_HAVEWORKEDWITH, COUNT( TOOLSTECH_YOU_HAVEWORKEDWITH) AS TOOLSTECH_YOU_HAVEWORKEDWITH_ FROM FINAL_DATA GROUP BY  TOOLSTECH_YOU_HAVEWORKEDWITH ORDER BY 2 DESC
SELECT  TOOLSTECH_YOU_WANTTOWORKWITH, COUNT( TOOLSTECH_YOU_WANTTOWORKWITH) AS TOOLSTECH_YOU_WANTTOWORKWITH_ FROM FINAL_DATA GROUP BY  TOOLSTECH_YOU_WANTTOWORKWITH ORDER BY 2 DESC
SELECT  NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH, COUNT( NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH) AS NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH_ FROM FINAL_DATA GROUP BY  NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH ORDER BY 2 DESC
SELECT  NEWCOLLABTOOLS_YOU_WANTTOWORKWITH, COUNT( NEWCOLLABTOOLS_YOU_WANTTOWORKWITH) AS NEWCOLLABTOOLS_YOU_WANTTOWORKWITH_ FROM FINAL_DATA GROUP BY  NEWCOLLABTOOLS_YOU_WANTTOWORKWITH ORDER BY 2 DESC
SELECT  OPERATING_SYSTEM, COUNT(OPERATING_SYSTEM) AS OPERATING_SYSTEM_ FROM FINAL_DATA GROUP BY  OPERATING_SYSTEM ORDER BY 2 DESC
SELECT  NEWSO_SITES, COUNT( NEWSO_SITES) AS NEWSO_SITES FROM FINAL_DATA GROUP BY  NEWSO_SITES ORDER BY 2 DESC
SELECT  NEW_STOCK, COUNT( NEW_STOCK) AS NEW_STOCK FROM FINAL_DATA GROUP BY  NEW_STOCK ORDER BY 2 DESC
SELECT  SOVISIT_FRQUENCY, COUNT( SOVISIT_FRQUENCY) AS SOVISIT_FRQUENCY FROM FINAL_DATA GROUP BY  SOVISIT_FRQUENCY ORDER BY 2 DESC
SELECT  SOPART_FREQ, COUNT( SOPART_FREQ) AS SOPART_FREQ FROM FINAL_DATA GROUP BY  SOPART_FREQ ORDER BY 2 DESC
SELECT  SO_COMM, COUNT( SO_COMM) AS SO_COMM FROM FINAL_DATA GROUP BY  SO_COMM ORDER BY 2 DESC
SELECT  NEW_OTHERCOMMS, COUNT( NEW_OTHERCOMMS) AS NEW_OTHERCOMMS FROM FINAL_DATA GROUP BY  NEW_OTHERCOMMS ORDER BY 2 DESC
SELECT  RESPONDENT_GENDER, COUNT( RESPONDENT_GENDER) AS RESPONDENT_GENDER FROM FINAL_DATA GROUP BY  RESPONDENT_GENDER ORDER BY 2 DESC
SELECT  YOUR_SEXUALITY, COUNT( YOUR_SEXUALITY) AS YOUR_SEXUALITY FROM FINAL_DATA GROUP BY  YOUR_SEXUALITY ORDER BY 2 DESC
SELECT  RESP_ACCESSIBILITY, COUNT( RESP_ACCESSIBILITY) AS RESP_ACCESSIBILITY FROM FINAL_DATA GROUP BY  RESP_ACCESSIBILITY ORDER BY 2 DESC
SELECT  TRANS_, COUNT( TRANS_) AS TRANS_ FROM FINAL_DATA GROUP BY  TRANS_ ORDER BY 2 DESC
SELECT MENTAL_HEALTH, COUNT( MENTAL_HEALTH) AS MENTAL_HEALTH FROM FINAL_DATA GROUP BY  MENTAL_HEALTH ORDER BY 2 DESC
SELECT  LENGTH_OF_SURVEY, COUNT( LENGTH_OF_SURVEY) AS LENGTH_OF_SURVEY FROM FINAL_DATA GROUP BY  LENGTH_OF_SURVEY ORDER BY 2 DESC
SELECT  EASE_OF_SURVEY, COUNT( EASE_OF_SURVEY) AS EASE_OF_SURVEY FROM FINAL_DATA GROUP BY  EASE_OF_SURVEY ORDER BY 2 DESC
SELECT  RESPONDENT_AGE, COUNT( RESPONDENT_AGE) AS RESPONDENT_AGE FROM FINAL_DATA GROUP BY  RESPONDENT_AGE ORDER BY 2 DESC

/*USING WINDOW FUNCTION TO FIND THE COMPENSATION RECEIVED BASED ON STATES IN US, DATABASE AND LANGUAUGE USED ALONGSIDE THE AVERAGE*/
WITH AVG_DEVELOPER_TYPE AS (
SELECT DEVELOPER_TYPE, ROUND(AVG(COMPENSATION_RECEIVED),2) AS AVG_COMPENSATION_RECD
FROM FINAL_DATA
GROUP BY DEVELOPER_TYPE),
AVG_US_STATE AS (
SELECT STATE_OF_US, ROUND(AVG(COMPENSATION_RECEIVED),2) AS AVG_COMPENSATION_RECD
FROM FINAL_DATA
GROUP BY STATE_OF_US)
SELECT RESPONSEID, FD.COUNTRY_ORIGIN,US.STATE_OF_US, FD.DATABASE_YOU_HAVEWWORKEDWITH, FD.LANGUAGE_YOU_HAVEWORKEDWITH,COMPENSATION_RECEIVED, AD.AVG_COMPENSATION_RECD
FROM FINAL_DATA AS FD
JOIN AVG_DEVELOPER_TYPE AS AD
ON FD.DEVELOPER_TYPE = AD.DEVELOPER_TYPE
JOIN AVG_US_STATE AS US
ON FD.STATE_OF_US = US.STATE_OF_US
SELECT * FROM FINAL_DATA

/*COMPENSATION BY EMPLOYMENT AND COUNTRY OF ORIGIN*/
SELECT COUNTRY_ORIGIN, EMPLOYMENT, COMPENSATION_RECEIVED, SUM(COMPENSATION_RECEIVED)
OVER (PARTITION BY EMPLOYMENT ORDER BY EMPLOYMENT) AS COMPENSATION_LEVELS_BY_EMPLOYMENT
FROM FINAL_DATA

/*COMPENSATION BY EDUCATION LEVEL*/
SELECT COUNTRY_ORIGIN, Edu_Level, COMPENSATION_RECEIVED, SUM(COMPENSATION_RECEIVED)
OVER (PARTITION BY EMPLOYMENT ORDER BY EDU_LEVEL) AS COMPENSATION_LEVELS_BY_Edu_Level
FROM FINAL_DATA

/*ALTERING AND MODIFYING TABLE AND COLUMN TO APPLY PARTITIONING ON YEARS OF CODING AND COMPENSATION LEVELS*/
ALTER TABLE FINAL_DATA
ALTER COLUMN YERAS_OF_CODING varchar(255)
SELECT COUNTRY_ORIGIN, YERAS_OF_CODING, SUM(COMPENSATION_RECEIVED)
OVER (PARTITION BY YERAS_OF_CODING ORDER BY YERAS_OF_CODING) AS TOTAL_YERAS_OF_CODING
FROM FINAL_DATA

/*ALTERING AND MODIFYING TABLE AND COLUMN TO APPLY PARTITIONING ON EMPLOYMENT, PLATFORM_YOU_HAVEWORKEDWITH AND COMPENSATION LEVELS*/
ALTER TABLE FINAL_DATA
ALTER COLUMN PLATFORM_YOU_HAVEWORKEDWITH varchar(255)
SELECT  COUNTRY_ORIGIN, PLATFORM_YOU_HAVEWORKEDWITH, COMPENSATION_RECEIVED, SUM(COMPENSATION_RECEIVED)
OVER (PARTITION BY EMPLOYMENT ORDER BY PLATFORM_YOU_HAVEWORKEDWITH) AS COMPENSATION_LEVELS_BY_PLATFORM_YOU_HAVEWORKEDWITH
FROM FINAL_DATA

/*COMPENSATION LEVELS BY OPERATING SYSTEM USED BY RESPONDENTS*/
SELECT OPERATING_SYSTEM, COMPENSATION_RECEIVED, SUM(COMPENSATION_RECEIVED) AS COMPENSATION_LEVELS_BY_OPERATING_SYSTEM
FROM FINAL_DATA
GROUP BY OPERATING_SYSTEM, COMPENSATION_RECEIVED
ORDER BY 3 DESC

/*COMPENSATION LEVELS BY RESPONDENT_AGE OF RESPONDENTS*/
SELECT RESPONDENT_AGE, COMPENSATION_RECEIVED, SUM(COMPENSATION_RECEIVED) AS COMPENSATION_LEVELS_BY_RESPONDENT_AGE
FROM FINAL_DATA
GROUP BY RESPONDENT_AGE, COMPENSATION_RECEIVED
ORDER BY 3 DESC

/*COMPENSATION LEVELS BY RESPONDENT_GENDER*/
SELECT RESPONDENT_GENDER, COMPENSATION_RECEIVED, SUM(COMPENSATION_RECEIVED) AS COMPENSATION_LEVELS_BY_RESPONDENT_GENDER
FROM FINAL_DATA
GROUP BY RESPONDENT_GENDER, COMPENSATION_RECEIVED
ORDER BY 3 DESC

/*ALTERING AND MODIFYING TABLE AND COLUMN TO APPLY PARTITIONING ON RESPONDENT GENDER AND COMPENSATION LEVELS*/
ALTER TABLE FINAL_DATA
ALTER COLUMN RESPONDENT_GENDER varchar(255)
SELECT RESPONDENT_GENDER, SUM(COMPENSATION_RECEIVED)
OVER (PARTITION BY RESPONDENT_GENDER ORDER BY RESPONDENT_GENDER) AS COMPENSATION_LEVELS_BY_RESPONDENT_GENDER
FROM FINAL_DATA

/*COUNT OF DISTINCT GENDER GROUP AND COMPENSATION*/
SELECT RESPONDENT_GENDER, COUNT(RESPONDENT_GENDER) AS COUNT_OF_RESPONDENT_GENDER_GROUP,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_RESPONDENT_GENDER
FROM FINAL_DATA
GROUP BY RESPONDENT_GENDER
ORDER BY 3 DESC

/*COUNT OF DISTINCT OPERATING SYSTEM AND COMPENSATION*/
SELECT OPERATING_SYSTEM, COUNT(OPERATING_SYSTEM) AS COUNT_OF_OPERATING_SYSTEM_GROUP,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_OPERATING_SYSTEM_GROUP
FROM FINAL_DATA
GROUP BY OPERATING_SYSTEM
ORDER BY 3 DESC

/*COUNT OF DISTINCT DATABASES RESPONDENTS HAVE WORKED WITH AND COMPENSATION*/
SELECT DATABASE_YOU_HAVEWWORKEDWITH, COUNT(DATABASE_YOU_HAVEWWORKEDWITH) AS COUNT_OF_DATABASE_YOU_HAVEWWORKEDWITH,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_DATABASE_YOU_HAVEWWORKEDWITH
FROM FINAL_DATA
GROUP BY DATABASE_YOU_HAVEWWORKEDWITH
ORDER BY 3 DESC

/*COUNT OF DISTINCT LANGUAGES RESPONDENTS HAVE WORKED WITH AND COMPENSATION*/
SELECT LANGUAGE_YOU_HAVEWORKEDWITH, COUNT(LANGUAGE_YOU_HAVEWORKEDWITH) AS COUNT_OF_LANGUAGE_YOU_HAVEWORKEDWITH,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_LANGUAGE_YOU_HAVEWORKEDWITH
FROM FINAL_DATA
GROUP BY LANGUAGE_YOU_HAVEWORKEDWITH
ORDER BY 3 DESC

/*COUNT OF DEVELOPER TYPE AND COMPENSATION LEVELS*/
SELECT DEVELOPER_TYPE, COUNT(DEVELOPER_TYPE) AS COUNT_OF_DEVELOPER_TYPE,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_DEVELOPER_TYPE
FROM FINAL_DATA
GROUP BY DEVELOPER_TYPE
ORDER BY 3 DESC

/*COUNT OF EMPLOYMENT GROUPING AND COMPENSATION LEVELS*/
SELECT EMPLOYMENT, COUNT(EMPLOYMENT) AS COUNT_OF_EMPLOYMENT_GROUPS,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_EMPLOYMENT_GROUPS
FROM FINAL_DATA
GROUP BY EMPLOYMENT
ORDER BY 3 DESC

/*COUNT OF EDUCATIONAL LEVELS AND COMPENSATION*/
SELECT Edu_Level, COUNT(Edu_Level) AS COUNT_OF_EDU_LEVEL,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_EDU_LEVEL
FROM FINAL_DATA
GROUP BY Edu_Level
ORDER BY 3 DESC

/*COUNT OF DEVELOPER TYPE AND COMPENSATION DIFFERENCES*/
SELECT DISTINCT (DEVELOPER_TYPE), COUNT(DEVELOPER_TYPE) AS DEVELOPER_TYPE
FROM FINAL_DATA
GROUP BY DEVELOPER_TYPE
ORDER BY 2 DESC

/*FETCHING DATA FOR RESPONDENTS WHO HAVE DATA REALTED SKILLS*/
SELECT DEVELOPER_TYPE, COUNTRY_ORIGIN, COUNT(COUNTRY_ORIGIN) AS DEVELOPER_TYPEBY_COUNTRY
FROM FINAL_DATA
WHERE DEVELOPER_TYPE LIKE '%DATA%'
GROUP BY COUNTRY_ORIGIN, DEVELOPER_TYPE
ORDER BY 3 DESC

/*FETCHING DATA FOR RESPONDENTS WHO HAVE DATA REALTED SKILLS AND THREIR COMPENSATIONS*/
SELECT DEVELOPER_TYPE, COUNTRY_ORIGIN, COUNT(COUNTRY_ORIGIN) AS DEVELOPER_TYPEBY_COUNTRY, 
SUM(COMPENSATION_RECEIVED) DATA_PROFESSION_COMPENSATION
FROM FINAL_DATA
WHERE DEVELOPER_TYPE LIKE '%DATA%'
GROUP BY COUNTRY_ORIGIN, DEVELOPER_TYPE
ORDER BY 4 DESC

/*FETCHING DATA FOR RESPONDENTS WHO HAVE DATA REALTED SKILLS EDUCATION LEVEL AND THREIR COMPENSATIONS*/
SELECT Edu_Level, COUNT(Edu_Level) AS COUNT_OF_EDU_LEVEL,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_EDU_LEVEL
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA' AND DEVELOPER_TYPE LIKE '%Data%'
GROUP BY Edu_Level
ORDER BY 3 DESC

/*RESPONDENTS WITH THEIR EDUCATION LEVELS AND COMPENSATION WHO ARE NIGERIANS*/
SELECT Edu_Level, COUNT(Edu_Level) AS COUNT_OF_EDU_LEVEL,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_EDU_LEVEL
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA' 
GROUP BY Edu_Level
ORDER BY 3 DESC

/*RESPONDENTS WITH THEIR EDUCATION LEVELS, DEVELOPER TYPE AND COMPENSATION WHO ARE NIGERIANS*/
SELECT Edu_Level, DEVELOPER_TYPE, COUNT(DEVELOPER_TYPE) AS COUNT_OF_DEVELOPER_TYPE,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_EDU_LEVEL
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA' 
GROUP BY Edu_Level, DEVELOPER_TYPE
ORDER BY 4 DESC

/*RESPONDENTS WITH THEIR MODE OF LEARNING TO CODE, YEARS OF CODING AND COMPENSATION WHO ARE NIGERIANS*/
SELECT ModeOfLearning_Code, YERAS_OF_CODING, COUNT(YERAS_OF_CODING) AS COUNT_OF_YERAS_OF_CODING,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_ERAS_OF_CODING
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA' 
GROUP BY ModeOfLearning_Code, YERAS_OF_CODING
ORDER BY 4 DESC

/*LANGUAGES AND DATABASES NIGERIANS HAVE USED*/
SELECT LANGUAGE_YOU_HAVEWORKEDWITH, DATABASE_YOU_HAVEWWORKEDWITH, COUNT(DATABASE_YOU_HAVEWWORKEDWITH) AS COUNT_OF_DATABASE_YOU_HAVEWWORKEDWITH,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_EDU_LEVEL
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA' 
GROUP BY LANGUAGE_YOU_HAVEWORKEDWITH, DATABASE_YOU_HAVEWWORKEDWITH
ORDER BY 4 DESC

/*LANGUAGES NIGERIANS HAVE USED*/
SELECT DISTINCT LANGUAGE_YOU_HAVEWORKEDWITH, COUNT(LANGUAGE_YOU_HAVEWORKEDWITH) COUNT_OF_LANGUAGE_USED_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY LANGUAGE_YOU_HAVEWORKEDWITH
ORDER BY 2 DESC

/*PLATFORMS NIGERIANS HAVE USED*/
SELECT DISTINCT PLATFORM_YOU_HAVEWORKEDWITH, COUNT(PLATFORM_YOU_HAVEWORKEDWITH) AS COUNT_OF_PLATFORM_YOU_HAVEWORKEDWITH_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY PLATFORM_YOU_HAVEWORKEDWITH
ORDER BY 2 DESC

/*DATABASES NIGERIANS HAVE USED*/
SELECT DISTINCT DATABASE_YOU_HAVEWWORKEDWITH, COUNT(DATABASE_YOU_HAVEWWORKEDWITH) AS COUNT_OF_DATABASE_YOU_HAVEWWORKEDWITH_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY DATABASE_YOU_HAVEWWORKEDWITH
ORDER BY 2 DESC

/*DATABASES NIGERIANS WANT TO USE*/
SELECT DISTINCT DATABASE_YOU_WANTTOWORKWITH, COUNT(DATABASE_YOU_WANTTOWORKWITH) AS COUNT_OF_DATABASE_YOU_WANTTOWORKWITH_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY DATABASE_YOU_WANTTOWORKWITH
ORDER BY 2 DESC

SELECT DISTINCT(PLATFORM_YOU_HAVEWORKEDWITH), MISCTECH_YOU_HAVETOWORKEDWITH, COUNT(MISCTECH_YOU_HAVETOWORKEDWITH) AS COUNT_OF_DEVELOPER_TYPE,
COUNT(PLATFORM_YOU_HAVEWORKEDWITH) AS COUNT_OF_PLATFORM_YOU_HAVEWORKEDWITH
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA' 
GROUP BY PLATFORM_YOU_HAVEWORKEDWITH, MISCTECH_YOU_HAVETOWORKEDWITH
ORDER BY 4 DESC
SELECT * FROM FINAL_DATA

/*PLAFORMS NIGEERIANS HAVE WORKED WITH*/
SELECT DISTINCT PLATFORM_YOU_HAVEWORKEDWITH, COUNT(PLATFORM_YOU_HAVEWORKEDWITH) AS COUNT_OF_PLATFORM_YOU_HAVEWORKEDWITH_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY PLATFORM_YOU_HAVEWORKEDWITH
ORDER BY 2 DESC

/*FETCHINGVTHE EMPLOYMENT MODE OF NIGERIANS*/
SELECT DISTINCT EMPLOYMENT, COUNT(EMPLOYMENT) AS COUNT_OF_EMPLOYMENT_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY EMPLOYMENT
ORDER BY 2 DESC

/*CODE EDITORS USED BY NIGERIANS*/
SELECT DISTINCT NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH, COUNT(NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH) AS COUNT_OF_NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY NEWCOLLABTOOLS_YOU_HAVEWORKEDWITH
ORDER BY 2 DESC

/*OPERATING SYSTEMS USED BY NIGERIANS*/
SELECT DISTINCT OPERATING_SYSTEM, COUNT(OPERATING_SYSTEM) AS COUNT_OF_OPERATING_SYSTEM_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY OPERATING_SYSTEM
ORDER BY 2 DESC

/*HOW FREQUENTLY NIGERIANS VISIT STACK OVERFLOW*/
SELECT DISTINCT SOVISIT_FRQUENCY, COUNT(SOVISIT_FRQUENCY) AS COUNT_OF_SOVISIT_FRQUENCY_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY SOVISIT_FRQUENCY
ORDER BY 2 DESC

/*OPERATING SYSTEMS USED BY USAs*/
SELECT DISTINCT OPERATING_SYSTEM, COUNT(OPERATING_SYSTEM) AS COUNT_OF_OPERATING_SYSTEM_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'United States of America'
GROUP BY OPERATING_SYSTEM
ORDER BY 2 DESC

/*PROPORTION OF NIGERIANS WHO HAVE STACK OVERFLOW ACCOUNT*/
SELECT DISTINCT SO_ACCOUNT, COUNT(SO_ACCOUNT) AS COUNT_OF_SO_ACCOUNT_BY_NIGERIANS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY SO_ACCOUNT
ORDER BY 2 DESC

/*EDUCATION LEVELS OF NIGERIANS WHO HAVE DATA REALTED SKILLS*/
SELECT Edu_Level, COUNT(Edu_Level) AS COUNT_OF_EDU_LEVEL,
SUM(COMPENSATION_RECEIVED) AS COMPENSATION_BY_EDU_LEVEL
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA' AND DEVELOPER_TYPE LIKE '%Data%'
GROUP BY Edu_Level
ORDER BY 3 DESC

/*COUNT OF DIFFERENT PROFESSIONALS WHO ARE NIGERIANS*/
SELECT COUNTRY_ORIGIN, DEVELOPER_TYPE, COUNT(DEVELOPER_TYPE) AS NIGERIAN_PROFESSIONALS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'NIGERIA'
GROUP BY COUNTRY_ORIGIN, DEVELOPER_TYPE
ORDER BY 3 DESC

/*TO FETCH THE COUNTRIES WITH THE HIGHEST GROUP OF PEOPLE WHO BEGAN TO CODE  BETWEEN AGE 11 - 17*/
SELECT COUNTRY_ORIGIN, COUNT(Age_1st_Code) AS ELEVELN_TO_17_BY_COUNTRY
FROM FINAL_DATA
WHERE Age_1st_Code = '11 - 17 YEARS'
GROUP BY COUNTRY_ORIGIN, Age_1st_Code
ORDER BY 2 DESC;

SELECT DEVELOPER_TYPE, COUNT(DEVELOPER_TYPE) AS NIGERIAN_DATA_PROFESSIONALS
FROM FINAL_DATA
WHERE COUNTRY_ORIGIN = 'Nigeria' AND DEVELOPER_TYPE LIKE '%Data%'
GROUP BY DEVELOPER_TYPE
ORDER BY 2 DESC;

SELECT DISTINCT DEVELOPER_TYPE, SUM(COMPENSATION_RECEIVED) SSS
FROM FINAL_DATA
GROUP BY DEVELOPER_TYPE
ORDER BY 2 DESC