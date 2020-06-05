/*  1
Show the total population of the world.


world(name, continent, area, population, gdp)
*/

SELECT SUM(population)
FROM world;





/*  2
List all the continents - just once each.
*/

SELECT continent 
FROM world x 
WHERE population >= ALL(
  SELECT population 
  FROM world y 
  WHERE x.continent=y.continent
) 
ORDER BY continent;





/*  3
Give the total GDP of Africa
*/

SELECT SUM(gdp) 
FROM world 
WHERE world.continent = 'Africa';





/*  4
How many countries have an area of at least 1000000
*/

SELECT COUNT(*) 
FROM world x 
WHERE area > 1000000 ;





/*  5
What is the total population of ('Estonia', 'Latvia', 'Lithuania')
*/

SELECT SUM(population) 
FROM world 
WHERE name IN('Estonia', 'Latvia', 'Lithuania');





/*  6
For each continent show the continent and number of countries.
*/

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;





/*  7
For each continent show the continent and number of countries with populations of at least 10 million.
*/

SELECT continent, COUNT(name) 
FROM world 
WHERe population > 10000000
GROUP BY continent;







/*  8
List the continents that have a total population of at least 100 million.
*/

SELECT continent 
FROM world 
GROUP BY continent
HAVING SUM(population) > 100000000;







