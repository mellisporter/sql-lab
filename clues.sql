-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.
 
SELECT MIN(population) AS SmallestPop FROM country WHERE region= 'Southern Europe';
-- // looked up conditionals on w3 schools
-- when entering this informstion, we find the smallest population country in S.E. is 1000;
-- we still need to know the country name

SELECT * FROM country c WHERE c.population = 1000;
-- This reveals the whole row to us, and our answer is The Vatican City


-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT language FROM countryLanguage WHERE countrycode = 'VAT';
-- since we have the VAT countrycode based on the previous problem, we can look for the language based on this
-- we will need to search the countryLanguage
-- at first, I tried to find by country name, but it didn't work since the countrylanguage table does not include country name
-- finding by the country code was successful, the official language is ITALIAN!

-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
-- nearby country speaks nothing but that language.

SELECT countrycode FROM countryLanguage WHERE language = 'Italian' AND isofficial= 't' AND percentage= 100;
-- did this in multiple steps and eventually learned to combine in one line. We want to find a country where
-- italian is the official language, hence isofficial= "t" AND it is the only language spoken, hence percentage= 100
-- we end up with the country code of SMR

SELECT * FROM country WHERE code= 'SMR';
-- Lets plug this code back into our Country table so we can see the same of the country
-- The country is San Marino


-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
-- There are only two cities she could be flying to in the country. One is named the same as the country – that
-- would be too obvious. We're following our gut on this one; find out what other city in that country she might
-- be flying to.

SELECT * FROM city WHERE countrycode= 'SMR';
-- when we run this, we get two options: San Marino and Serravalle.
-- the city is Serravalle, since the directions rule out San Marino.

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

SELECT * FROM city WHERE name LIKE 'Serra%';
-- searching this to find names like the Serravalle. The clue said it ended different, so I just typed the first syllable
-- this reveals the answer to be 'Serra"


-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
-- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
-- follow right behind you!

SELECT capital FROM country WHERE name= 'San Marino';
-- confused as to why the capital is a number, but the answer here is "3171"

-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
-- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
-- landing dock. Lucky for us, she's getting cocky. She left us a note (below), and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.


--               Our playdate of late has been unusually fun –
--               As an agent, I'll say, you've been a joy to outrun.
--               And while the food here is great, and the people – so nice!
--               I need a little more sunshine with my slice of life.
--               So I'm off to add one to the population I find
--               In a city of ninety-one thousand and now, eighty five.

SELECT * FROM city WHERE population= 91084;
-- used one less number since the population is not 91,085 until Carmen is there
-- this returns Santa Monica.

-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.

--SANTA MONICA

