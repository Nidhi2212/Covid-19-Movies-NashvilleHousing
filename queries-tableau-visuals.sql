/* Objective: Look at DeathPercentage
Author Name: Nidhi Gupta
Script Date: 23 Jan 2023
Description of the code: This code will calculate the Death Percentage where continent is not blank to exclude duplicate data present in the dataset. */

SELECT 	SUM(New_Cases) AS Total_Cases,
		SUM(New_Deaths) AS Total_Deaths,
		(SUM(New_Deaths) / SUM(New_Cases)) * 100 AS DeathPercentage
FROM CovidDeaths
WHERE Continent != ''
ORDER BY 1, 2;

/* Objective: Look at Death Count
Author Name: Nidhi Gupta
Script Date: 23 Jan 2023
Description of the code: This code will calculate the Death Count per country where continent is blank and
location does not include mentioned values to exclude duplicate data present in the dataset. */

SELECT  Location,
		SUM(New_Deaths) AS TotalDeathCount
FROM CovidDeaths
WHERE Continent = ''
        AND Location NOT IN ('World' , 'European union', 'International')
GROUP BY Location
ORDER BY TotalDeathCount DESC;

/* Objective: Look at highest infection count per country and percentage of population
Author Name: Nidhi Gupta
Script Date: 23 Jan 2023
Description of the code: This code will calculate the Infection Percentage by country. */

SELECT 	Location,
		Population,
        MAX(Total_Cases) AS HighestInfectionCount,
        (MAX(Total_Cases) / Population) * 100 AS PercentPopulationInfected
FROM CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;
 
/* Objective: Look at highest infection count per country and percentage of population with date
Author Name: Nidhi Gupta
Script Date: 23 Jan 2023
Description of the code: This code will calculate the Infection Percentage by country and date. */

SELECT 	Location,
		Population,
        Date,
        MAX(Total_Cases) AS HighestInfectionCount,
        (MAX(Total_Cases) / Population) * 100 AS PercentPopulationInfected
FROM CovidDeaths
GROUP BY Location , Population , Date
ORDER BY PercentPopulationInfected DESC;

