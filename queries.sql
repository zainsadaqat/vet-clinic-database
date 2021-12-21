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
UPDATE ANIMALS SET SPECIES = 'Pokemon' WHERE NAME IS NULL;

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


-------------------------------- DAY 03 --------------------------------



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


-------------------------------- DAY 04 --------------------------------

-- Write queries to answer the following:

-- Who was the last animal seen by William Tatcher?
select animals.name, visits.date_of_visit from animals join visits on animals.id = visits.animals_id join vets on vets.id = visits.vets_id where vets.name ='Vet William Tatcher' order by visits.date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
select count(animals.name) from animals join visits on animals.id = visits.animals_id join vets on vets.id = visits.vets_id where vets.name = 'Vet Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
select vets.name, species.name from vets left join specializations on vets.id = specializations.vet_id left join species on species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select animals.name, visits.date_of_visit from animals join visits on animals.id = visits.animals_id join vets on vets.id = visits.vets_id where vets.name = 'Vet Stephanie Mendez' and date_of_visit between '2020-04-01' and '2020-08-30';

-- What animal has the most visits to vets?
select animals.name, COUNT(*) from animals join visits on animals.id = visits.animals_id GROUP by animals.name order by count(*) desc LIMIT 1;

-- Who was Maisy Smith's first visit?
select visits.date_of_visit, animals.name from vets join visits on vets.id = visits.vets_id join animals on animals.id = visits.animals_id where vets.name = 'Vet Maisy Smith' ORDER by visits.date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
select visits.date_of_visit, animals.name, vets.name from animals join visits on animals.id = visits.animals_id join vets on vets.id = visits.vets_id order by visits.date_of_visit desc limit 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT(animals_id)  FROM specializations
RIGHT JOIN vets ON vets.id = specializations.vet_id
RIGHT JOIN visits ON visits.vets_id = vets.id
WHERE vets.id NOT IN (SELECT vet_id FROM specializations)
GROUP BY vets.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name,  COUNT(species.name) FROM vets
JOIN visits ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id=animals.id
JOIN species ON animals.species_id=species.id
WHERE vets.name='Vet Maisy Smith'
GROUP BY species.name
ORDER BY COUNT DESC
LIMIT 1;

-- Test performance of provided queries with explain analyze
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
