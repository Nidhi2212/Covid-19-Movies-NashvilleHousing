/* Objective: Create table by the name of 'CovidVaccinations'
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will create the table with mentioned column names and data types.*/

CREATE TABLE CovidVaccinations(
	Iso_Code VARCHAR(255) NOT NULL,
	Continent VARCHAR(255),
	Location VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    New_Tests INT NULL,
    Total_Tests INT NULL,
    Total_Tests_per_thousand DECIMAL(10,6) NULL,
    New_Tests_Per_Thousand DECIMAL(10,6) NULL,
    New_Tests_Smoothed INT NULL,
    New_Tests_Smoothed_Per_Thousand DECIMAL(10,6) NULL,
    Positive_Rate DECIMAL(10,6) NULL,
    Tests_Per_Case DECIMAL(10,6) NULL,
    Tests_Units VARCHAR(255) NULL,
    Total_Vaccinations INT NULL,
    People_Vaccinated INT NULL,
    People_Fully_Vaccinated INT NULL,
    New_Vaccinations INT NULL,
    New_Vaccinations_Smoothed INT NULL,
    Total_Vaccinations_Per_Hundred DECIMAL(10 , 6 ) NULL,
    People_Vaccinated_Per_Hundred DECIMAL(10 , 6 ) NULL,
    People_Fully_Vaccinated_Per_Hundred DECIMAL(10,6) NULL,
    New_Vaccinations_Smoothed_Per_Million INT NULL,
    Stringency_Index DECIMAL(10,6) NULL,
    Population_Density DECIMAL(10,6) NULL,
    Median_Age DECIMAL(10,6) NULL,
    Aged_65_Older DECIMAL(10,6) NULL,
    Aged_70_Older DECIMAL(10,6) NULL,
    GDP_Per_Capita DECIMAL(10,6) NULL,
    Extreme_Poverty DECIMAL(10,6) NULL,
    Cardiovasc_Death_Rate DECIMAL(10,6) NULL,
    Diabetes_Prevalence DECIMAL(10,6) NULL,
    Female_Smokers DECIMAL(10,6) NULL,
    Male_Smokers DECIMAL(10,6) NULL,
    Handwashing_Facilities DECIMAL(10,6) NULL,
    Hospital_Beds_Per_Thousand DECIMAL(10,6) NULL,
    Life_Expectancy DECIMAL(10,6) NULL,
    Human_Development_Index DECIMAL(10,6) NULL
);

/* Objective: Upload data into CovidVaccinations table
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will upload the data from csv file into created table.*/

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidVaccinations.csv'  INTO TABLE CovidVaccinations FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

/* Objective: Verify the table contents
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will produce the table with the data uploaded.*/

SELECT *
FROM CovidVaccinations;

/* Objective: Create table by the name of 'CovidDeaths'
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will create the table with mentioned column names and data types.*/

CREATE TABLE CovidDeaths (
    Iso_Code VARCHAR(255) NOT NULL,
    Continent VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    Total_Cases INT NULL,
    New_Cases INT NULL,
    New_Cases_Smoothed DECIMAL(10, 4) NULL,
    Total_Deaths INT NULL,
    New_Deaths INT NULL,
    New_Deaths_Smoothed DECIMAL(10, 4) NULL,
    Total_Cases_Per_Million DECIMAL(10, 4) NULL,
    New_Cases_Per_Million DECIMAL(10, 4) NULL,
    New_Cases_Smoothed_Per_Million DECIMAL(10, 4) NULL,
    Total_Deaths_Per_Million DECIMAL(10, 4) NULL,
    New_Deaths_Per_Million DECIMAL(10, 4) NULL,
    New_Deaths_Smoothed_Per_Million DECIMAL(10, 4) NULL,
    Reproduction_Rate DECIMAL(10, 4) NULL,
    ICU_Patients INT NULL,
    ICU_Patients_Per_Million DECIMAL(10, 4) NULL,
    Hosp_Patients INT NULL,
    Hosp_Patients_Per_Million DECIMAL(10, 4) NULL,
    Weekly_ICU_Admissions DECIMAL(10, 4) NULL,
    Weekly_ICU_Admissions_per_million DECIMAL(10, 4) NULL,
    Weekly_Hosp_Admissions DECIMAL(10, 4) NULL,
    Weekly_Hosp_Admissions_Per_Million DECIMAL(10, 4) NULL,
    New_Tests INT NULL,
    Total_Tests INT NULL,
    Total_Tests_Per_Thousand DECIMAL(10, 4) NULL,
    New_Tests_Per_Thousand DECIMAL(10, 4) NULL,
    New_Tests_Smoothed INT NULL,
    New_Tests_Smoothed_Per_Thousand DECIMAL(10, 4) NULL,
    Positive_Rate DECIMAL(10, 4) NULL,
    Tests_Per_Case DECIMAL(10, 4) NULL,
    Tests_Units VARCHAR(255),
    Total_Vaccinations INT NULL,
    People_Vaccinated INT NULL,
    People_Fully_Vaccinated INT NULL,
    New_Vaccinations INT NULL,
    New_Vaccinations_Smoothed INT NULL,
    Total_Vaccinations_Per_Hundred DECIMAL(10, 4) NULL,
    People_Vaccinated_Per_Hundred DECIMAL(10, 4) NULL,
    People_Fully_Vaccinated_Per_Hundred DECIMAL(10, 4) NULL,
    New_Vaccinations_Smoothed_Per_Million INT NULL,
    Stringency_Index DECIMAL(10, 4) NULL,
    Population INT NULL,
    Population_Density DECIMAL(10, 4) NULL,
    Median_Age DECIMAL(10, 4) NULL,
    Aged_65_Older DECIMAL(10, 4) NULL,
    Aged_70_Older DECIMAL(10, 4) NULL,
    GDP_Per_Capita DECIMAL(10, 4) NULL,
    Extreme_Poverty DECIMAL(10, 4) NULL,
    Cardiovasc_Death_Rate DECIMAL(10, 4) NULL,
    Diabetes_Prevalence DECIMAL(10, 4) NULL,
    Female_Smokers DECIMAL(10, 4) NULL,
    Male_Smokers DECIMAL(10, 4) NULL,
    Handwashing_Facilities DECIMAL(10, 4) NULL,
    Hospital_Beds_Per_Thousand DECIMAL(10, 4) NULL,
    Life_Expectancy DECIMAL(10, 4) NULL,
    Human_Development_Index DECIMAL(10, 4) NULL
);

/* Objective: Upload data into CovidDeaths table
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will upload the data from csv file into created table.*/

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidDeaths.csv'  INTO TABLE CovidDeaths  FIELDS TERMINATED BY ',' 
escaped BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

/* Objective: Verify the table contents
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will produce the table with the data uploaded.*/

SELECT *
FROM CovidDeaths;

/* Objective: View selected columns from the table
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will produce the selected columns from the table with the data ordered by location column and then date column.*/

SELECT 	Location,
		Date,
		Total_Tests,
		New_Tests,
		Total_Deaths,
		Population
FROM CovidDeaths
ORDER BY 1 , 2;

/* Objective: Look at total cases vs total deaths
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will show the likelihood of dying if anyone contracts Covid in the United States.*/

SELECT 	Location,
		Date,
		Total_Cases,
		Total_Deaths,
		(Total_Deaths / Total_Cases) * 100 AS DeathPercentage
FROM CovidDeaths
WHERE Location LIKE '%states%'
ORDER BY 1,2;

/* Objective: Look at the % of population infected by Covid
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will show the % of the infected population in India.*/

SELECT 	Location,
		Date,
		Population,
		Total_Cases,
		(Total_Cases / Population) * 100 AS ContractPercentage
FROM CovidDeaths
WHERE Location = 'India'
ORDER BY 1,2;

/* Objective: Look at countries having highest infection rate compared to Population
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will show highest infection rate of the country. */

SELECT 	Location,
		Population,
		MAX(Total_Cases) AS HighestInfectionCount,
		MAX((Total_Cases / Population)) * 100 AS PercentPopulationInfected
FROM CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;

/* Objective: Look at countries with highest death count per population
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will show the highest death count of each country. */

SELECT 	Location,
		MAX(Total_Deaths) AS HighestDeathCount,
		Population,
		MAX((Total_Deaths / Population)) * 100 AS PercentPopulationDied
FROM CovidDeaths
GROUP BY Location
ORDER BY PercentPopulationDied DESC;

/* Objective: Look at countries with highest death count per population where Continent is blank
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will show the highest death count of those countries where Continent is not blank. */

SELECT 	Location,
		MAX(Total_Deaths) AS HighestDeathCount
FROM CovidDeaths
WHERE Continent != ''
GROUP BY Location
ORDER BY HighestDeathCount DESC;

/* Objective: Look at continents with highest death count per population
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will show the highest death count per continent.
Rows having no values in Continent row are filtered out to remove duplicate numbers present in the data. */

SELECT 	Continent,
		MAX(Total_Deaths) AS HighestDeathCount,
		Population,
		(MAX(Total_Deaths) / Population) * 100 AS HighestDeathCountPerpopulation
FROM CovidDeaths
WHERE Continent != ''
GROUP BY Continent
ORDER BY HighestDeathCount DESC;

/* Objective: Look at Death percentage per day using CovidDeaths table
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will show the Death Percentage. Rows having no values in Continent row are filtered out to remove duplicate numbers present in the data. */

SELECT 	Date,
		SUM(New_Cases) AS TotalCases,
		SUM(New_Deaths) AS TotalDeaths,
        SUM(New_Deaths) / SUM(New_Cases) * 100 AS DeathPercentage
FROM CovidDeaths
WHERE Continent != ''
GROUP BY Date
ORDER BY DeathPercentage DESC;

/* Objective: Look at Death percentage
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will show the Death Percentage basis other columns in the data sets. */

SELECT 	SUM(New_Cases) AS TotalCases,
		SUM(New_Deaths) AS TotalDeaths,
		SUM(New_Deaths) / SUM(New_Cases) * 100 AS DeathPercentage
FROM CovidDeaths
WHERE Continent != ''
ORDER BY 1,2;

/* Objective: Further explore data and look at Vaccinations and Population
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will join both these tables on Location and Date columns and consider data where continent row is not blank in CovidDeaths table. */

SELECT 	D.Continent,
		D.Location,
        D.Date,
        Population,
        V.New_Vaccinations
FROM CovidDeaths D
JOIN CovidVaccinations V
	ON D.Location = V.Location
    AND D.Date = V.Date
WHERE D.Continent != '';

/* Objective: Look at Total Vaccinations per Country using other columns in data set 
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will perform rolling sum on values in New Vaccination columns per country.
Partition By is create partitions by country and calculates a rolling sum per partition. */

SELECT 	D.Continent,
		D.Location,
        D.Date,
        Population,
        V.New_Vaccinations,
        SUM(V.New_Vaccinations) OVER (PARTITION BY D.Location ORDER BY D.Location, D.Date) AS CumulativeVaccinationsSum
FROM CovidDeaths D
JOIN CovidVaccinations V
	ON D.Location = V.Location
    AND D.Date = V.Date
WHERE D.Continent != '';

/* Objective: Look at Vaccinations Percentage per Population
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will create a CTE which is required for performing calculations on the new colmun, CumulativeVaccinationsSum. */

WITH PopvsVac (Continent,
			Location,
            Date,
            Population,
            New_Vaccinations,
            CumulativeVaccinationsSum) AS (SELECT D.Continent,
												D.Location,
                                                D.Date,
                                                Population,
                                                V.New_Vaccinations,
                                                Sum(V.New_Vaccinations) OVER (PARTITION BY D.Location ORDER BY D.Location, D.Date) as CumulativeVaccinationsSum
FROM CovidDeaths D
JOIN CovidVaccinations V
	ON D.Location = V.Location
    AND D.Date = V.Date
WHERE D.Continent != '')
SELECT *, (CumulativeVaccinationsSum/Population)*100 as VaccinationsPerPopulation
FROM PopvsVac;
 
/* Objective: Look at Vaccinations Percentage per Population using other method
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will create a Temp Table which is required for performing calculations on the new colmun, CumulativeVaccinationsSum. */

DROP TEMPORARY TABLE IF EXISTS PercentPopulationVaccinated;
CREATE TEMPORARY TABLE PercentPopulationVaccinated (
Continent VARCHAR (255), Location VARCHAR (255), Date DATE, Population INT, New_Vaccinations INT, CumulativeVaccinationsSum INT);

INSERT INTO PercentPopulationVaccinated
SELECT 	D.Continent,
		D.Location,
        D.Date,
        Population,
        V.New_Vaccinations,
        SUM(V.New_Vaccinations) OVER (PARTITION BY D.Location ORDER BY D.Location, D.Date) AS CumulativeVaccinationsSum
FROM CovidDeaths D
JOIN CovidVaccinations V
	ON D.Location = V.Location
    AND D.Date = V.Date;

/* Objective: Look at Vaccinations Percentage per Population
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will calculate Vaccination Percentage. */

SELECT 	*,
		(CumulativeVaccinationsSum / Population) * 100 as VaccinationPerPopulation
FROM PercentPopulationVaccinated
WHERE Continent != '';