SELECT *
FROM PortfolioProject..CovidDeaths$
where continent is not null
ORDER BY 3,4

--SELECT *
--FROM PortfolioProject..COVIDVACCINES$
--ORDER BY 3,4

--SELECT DATA THAT WE ARE GOING TO USING

select location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths$
order by 1,2;


-- Looking at total cases vs total deaths
-- Shows the likelihood of dying if you contract Covid in your country

select location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 as deathpercentage
FROM PortfolioProject..CovidDeaths$
where location like '%states%'
order by 1,2;


--Looking at the total cases vs population
--Shows what percentage of population got Covid

select location, date, population, total_cases, (total_cases/population)*100 as percentpopulationinfected
FROM PortfolioProject..CovidDeaths$
--where location like '%states%'
order by 1,2;


--What countries have the highest infection rates compared to population
select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as percentpopulationinfected
FROM PortfolioProject..CovidDeaths$
group by location, population
order by HighestInfectionCount desc;


select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as percentpopulationinfected
FROM PortfolioProject..CovidDeaths$
group by location, population
order by percentpopulationinfected desc;


--Showing the countries with the highest death count per population
select location, population, max(total_deaths) as totaldeathcount, max((total_deaths/population))*100 as percentagedeathrates
FROM PortfolioProject..CovidDeaths$
group by location, population
order by percentagedeathrates desc;

select location, max(cast(total_deaths as int)) as totaldeathcount
FROM PortfolioProject..CovidDeaths$
where continent is not null
group by location
order by totaldeathcount desc;

--LET'S BREAK THINGS DOWN BY CONTINENT

select location, max(cast(total_deaths as int)) as totaldeathcount
FROM PortfolioProject..CovidDeaths$
where continent is null
group by location
order by totaldeathcount desc;

select continent, max(cast(total_deaths as int)) as totaldeathcount
FROM PortfolioProject..CovidDeaths$
where continent is not null
group by continent
order by totaldeathcount desc;


--This is showing the contintents with the hightest death counts
select continent, max(cast(total_deaths as int)) as totaldeathcount
FROM PortfolioProject..CovidDeaths$
where continent is not null
group by continent
order by totaldeathcount desc;

--Global Numbers
select sum (new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, Sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths$
where continent is not null
--group by date
order by 1,2

--Looking at Total Population vs Vaccinations

select *
from PortfolioProject..coviddeaths$ dea
join PortfolioProject..COVIDVACCINES$ vac
	on dea.location = vac.location
	and dea.date = vac.date

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from PortfolioProject..coviddeaths$ dea
join PortfolioProject..COVIDVACCINES$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..coviddeaths$ dea
join PortfolioProject..COVIDVACCINES$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
 --(RollingPeopleVaccinated/population)*100
from PortfolioProject..coviddeaths$ dea
join PortfolioProject..COVIDVACCINES$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

--USE CTE

With PopvsVAC (Continent, location, date, population, New_vaccinations, RollingPeopleVaccinated)
as
(select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
dea.date) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
from PortfolioProject..coviddeaths$ dea
join PortfolioProject..COVIDVACCINES$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
)
Select *, (RollingPeopleVaccinated/population)*100
from PopvsVAC

--TEMP TABLE
Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar (255),
Location nvarchar (255),
date datetime,
population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)


insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
dea.date) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
from PortfolioProject..coviddeaths$ dea
join PortfolioProject..COVIDVACCINES$ vac
	on dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null

Select *, (RollingPeopleVaccinated/population)*100
from #PercentPopulationVaccinated


--Creating View to store data for later visualizations

Create view PercentPopulationVaccinated as 
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
dea.date) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
from PortfolioProject..coviddeaths$ dea
join PortfolioProject..COVIDVACCINES$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order 2,3

select *
from PercentPopulationVaccinated