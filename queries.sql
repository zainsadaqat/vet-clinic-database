/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
SELECT * FROM ANIMALS WHERE NAME LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT NAME FROM ANIMALS WHERE DATE_OF_BIRTH >= '2016-01-01' AND DATE_OF_BIRTH <= '2019-01-01';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT NAME FROM ANIMALS WHERE NEUTERED = TRUE AND ESCAPE_ATTEMPTS < 3;

-- List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT DATE_OF_BIRTH FROM ANIMALS WHERE NAME IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT NAME, ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT_KG > 10.5;

-- Find all animals that are neutered.
SELECT * FROM ANIMALS WHERE NEUTERED = TRUE;

-- Find all animals not named Gabumon.
SELECT * FROM ANIMALS WHERE NAME NOT IN ('Gabumon');

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM ANIMALS WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;



-- Write queries (using JOIN) to answer the following questions:

-- What animals belong to Melody Pond?
SELECT NAME FROM ANIMALS JOIN OWNERS ON OWNER_ID = OWNERS.ID WHERE FULL_NAME = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT ANIMALS.NAME FROM ANIMALS JOIN SPECIES ON ANIMALS.SPECIES_ID = SPECIES.ID WHERE SPECIES.NAME = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT FULL_NAME, NAME FROM OWNERS LEFT JOIN ANIMALS ON OWNERS.ID = ANIMALS.OWNER_ID;

-- How many animals are there per species?
SELECT COUNT(*) FROM ANIMALS JOIN SPECIES ON ANIMALS.SPECIES_ID = SPECIES.ID GROUP BY SPECIES_ID;

-- List all Digimon owned by Jennifer Orwell.
SELECT NAME FROM ANIMALS JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID WHERE FULL_NAME = 'Jennifer Orwell' AND ANIMALS.SPECIES_ID = (SELECT ID FROM SPECIES WHERE NAME = 'Digimon');

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT NAME FROM ANIMALS JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID WHERE FULL_NAME = 'Dean Winchester' AND ANIMALS.ESCAPE_ATTEMPTS = 0;

-- Who owns the most animals?

SELECT OWNERS.FULL_NAME, COUNT(ANIMALS.OWNER_ID) FROM OWNERS INNER JOIN ANIMALS ON OWNERS.ID = ANIMALS.OWNER_ID GROUP BY OWNERS.FULL_NAME ORDER BY (COUNT) DESC LIMIT 1;