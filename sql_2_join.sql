# SQL Join exercise
#
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
Select name, population from city
where name like 'ping%'
order by population;

# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
Select name, population from City
where name like 'ran%'
order by population desc;

# 3: Count all cities
Select count(Name) from city;

# 4: Get the average population of all cities
Select avg(population) as AveragePopulation from city;

# 5: Get the biggest population found in any of the cities
Select max(Population) as MaxPop from city;

# 6: Get the smallest population found in any of the cities
Select min(population) as MinPop, Name from city;

# 7: Sum the population of all cities with a population below 10000
Select sum(population) from city
where Population < 1000; 

# 8: Count the cities with the countrycodes MOZ and VNM
Select count(countrycode) from city
where countrycode like 'MOZ' or countrycode like 'VNM';

# 9: Get individual count of cities for the countrycodes MOZ and VNM
Select COUNT(countrycode) as Countrycodes from city
where countrycode like 'MOZ' or countrycode like 'VNM'
Group by countrycode;

# 10: Get average population of cities in MOZ and VNM
Select avg(population) from city
where countrycode = 'MOZ' or countrycode = 'VNM'
group by countrycode;

# 11: Get the countrycodes with more than 200 cities
Select count(countrycode) AS 'CountryCodes' from city
group by countrycode
having count(countrycode) > 200;

# 12: Get the countrycodes with more than 200 cities ordered by city count
Select count(countrycode) AS 'CountryCode' From city
group by CountryCode 
having count(countrycode) > 200
order by Countrycode;

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
Select Distinct countrylanguage.Language, city.name, city.CountryCode, city.Population 
from city
join countrylanguage 
where population >= 400 and population <= 500
order by Language asc;

/*Select count(Distinct countrylanguage.Language) as 'Languages' from city
join countrylanguage 
where population >= 400 and population <= 500;*/

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
Select distinct Name, Population, Language from city
join countrylanguage
where population between 400 and 500
order by language asc;

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
select name, population, CountryCode from city
where CountryCode = (select countrycode from city where population = 122199)
order by Population desc;

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
select name, population, CountryCode from city
where CountryCode = (select countrycode from city where population = 122199) and Population != 122199
order by Population desc;

# 17: What are the city names in the country where Luanda is capital?
select name, CountryCode from city
where CountryCode = (select countrycode from city where name = 'Luanda')
order by name asc;

# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
Select city.name AS Capital, country.region AS Region from country
INNER JOIN city
ON country.capital = city.Id
where country.region = (select region from country where Code = (select countryCode from city where name ='Yaren'));

# 19: What unique languages are spoken in the countries in the same region as the city named Riga
select distinct countrylanguage.language, country.region from countrylanguage
join country on country.code = countrylanguage.countrycode
join city on city.countrycode = country.code
where country.region = (select region from country where code = (select countrycode from city where name ='Riga'))
order by language; 

# 20: Get the name of the most populous city
 select name, population from city
 where population = (select max(population) from city); 