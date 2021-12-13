/*Queries that provide answers to the questions from all projects.*/

-------------------------------- DAY 01 --------------------------------


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


-------------------------------- DAY 02 --------------------------------

-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that species columns went back to the state before tranasction.
BEGIN;
UPDATE ANIMALS SET SPECIES = 'UNSPECIFIED';
ROLLBACK;

-- Inside a transaction:
BEGIN;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE ANIMALS SET SPECIES = 'Digimon' WHERE NAME LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE ANIMALS SET SPECIES = 'Pokemon' WHERE NAME NOT LIKE '%mon';

-- Commit the transaction.
COMMIT;

-- Verify that change was made and persists after commit.
SELECT * FROM ANIMALS;

-- Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM ANIMALS;
ROLLBACK;

-- After the roll back verify if all records in the animals table still exist. After that you can start breath as usual ;)
SELECT * FROM ANIMALS;

-- Inside a transaction:
BEGIN;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM ANIMALS WHERE DATE_OF_BIRTH > '2022-01-01';

-- Create a savepoint for the transaction.
SAVEPOINT SP1;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE ANIMALS SET WEIGHT_KG = WEIGHT_KG * -1;

-- Rollback to the savepoint
ROLLBACK TO SP1;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE ANIMALS SET WEIGHT_KG = WEIGHT_KG * -1 WHERE WEIGHT_KG < 0;

-- Commit transaction
COMMIT;

-- Write queries to answer the following questions:

-- How many animals are there? //9
SELECT COUNT(*) FROM ANIMALS;

-- How many animals have never tried to escape? //2
SELECT COUNT(*) FROM ANIMALS WHERE ESCAPE_ATTEMPTS = 0;

-- What is the average weight of animals? //16.6444444444444444
SELECT AVG(WEIGHT_KG) FROM ANIMALS;

-- Who escapes the most, 
SELECT ESCAPE_ATTEMPTS FROM ANIMALS ORDER BY ESCAPE_ATTEMPTS DESC LIMIT 1;

-- neutered 
SELECT NAME FROM ANIMALS WHERE NEUTERED = TRUE;

-- not neutered animals?
SELECT NAME FROM ANIMALS WHERE NEUTERED = FALSE;

-- What is the minimum and maximum weight of each type of animal?
SELECT SPECIES, MIN(WEIGHT_KG), MAX(WEIGHT_KG) FROM ANIMALS GROUP BY SPECIES;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT SPECIES, AVG(ESCAPE_ATTEMPTS) FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY SPECIES;
