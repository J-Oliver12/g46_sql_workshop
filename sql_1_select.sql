Use world;

# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage
#
#
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
SELECT "hello world" as message , 123 as id;

# 2: Get everything from the city table
# (Hint: Many many rows)
Select * from city;

# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
Select * from city
where District = 'Aceh';

# 4: Get only the name of the cities where the countrycode is "bfa"
Select name from city
where CountryCode = 'bfa';

# 5: Get both the name and district of the cities where the countrycode is "tto"
Select name, district From City
where countrycode = 'tto';

# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
Select name as 'nm', district as 'dist' From City
where countrycode = 'arm';

# 7: Get the cities with a name that starts with "bor"
Select Name from City
Where Name Like 'bor%';


# 8: Get the cities with a name that contains the string "orto"
Select name from city
where name like '%orto%';

# 9: Get the cities that has a population below 1000
Select name, population from city
where population <= 1000
order by Population desc;

# 10: Get the unique countrycodes from the cities that has a population below 1000
select Distinct countrycode, name, population from city
where Population <= 1000
order by CountryCode, Population;

# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
Select Name, CountryCode, Population from City
where Countrycode = 'UKR' and Population > 1000000
order by Population desc;

# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
Select Name, Population From City
where population <= 200 or population >= 9500000
order by population desc;

# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
Select Name, CountryCode From City
where CountryCode = 'TJK' or CountryCode = 'MRT' or CountryCode = 'AND' or CountryCode = 'PNG' or CountryCode = 'SJM'; 

# 14: Get the cities with a population between 200 and 700 inclusive
Select name, population From City
where population >= 200 and population <= 700
order by population;

# 15: Get the countries with a population between 8000 and 20000 inclusive
Select name, population from country
where population between 8000 and 20000
order by population;

# 16: Get the name of the countries with a independence year (indepyear) before year 0
Select name, indepYear from country
where IndepYear < 0;

# 17: Get the countries that has no recorded independence year and a population above 1000000
Select name, indepyear, population from country
where IndepYear is null and Population > 1000000
order by Population;

# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
Select name, surfacearea, lifeexpectancy from country
where SurfaceArea < 10 and LifeExpectancy IS NOT NULL;
 
