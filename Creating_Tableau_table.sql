/*
Queries used for Tableau Project
*/



-- View 1. 

Select 
	SUM(new_cases) as Total_Cases, 
	SUM(cast(new_deaths as int)) as Total_Deaths, 
	SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as Death_Percentage
From PortfolioProject..CovidDeaths
where continent is not null 




-- View 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select 
  location, 
  SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where 
  continent is null 
  and 
  location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- View 3.

-- Creating a view with the percentage of population infected 
-- in all the different countries

Select 
  Location, 
  Population, 
  MAX(total_cases) as HighestInfectionCount,  
  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc



-- View 4.

-- Creating a view of affected people with date


Select 
  Location, 
  Population,
  date, 
  MAX(total_cases) as HighestInfectionCount,  
  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc
