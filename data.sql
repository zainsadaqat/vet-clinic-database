/* Populate database with sample data. */

-------------------------------- DAY 01 --------------------------------


-- Insert the following data:

-- Animal: His name is Agumon. He was born on Feb 3rd, 2020, and currently weighs 10.23kg. He was neutered and he has never tried to escape.
VET_CLINIC=# INSERT INTO ANIMALS(NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES('Agumon', '2020-02-03', 0, TRUE, 10.23);

-- Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. She is neutered and she has tried to escape 2 times.
VET_CLINIC=# INSERT INTO ANIMALS(NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES('Gabumon', '2018-10-15', 2, TRUE, 8);

-- Animal: His name is Pikachu. He was born on Jan 7th, 2021, and currently weighs 15.04kg. He was not neutered and he has tried to escape once.
VET_CLINIC=# INSERT INTO ANIMALS(NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES('Pikachu', '2021-01-07', 1, FALSE, 15.04);

-- Animal: Her name is Devimon. She was born on May 12th, 2017, and currently weighs 11kg. She is neutered and she has tried to escape 5 times.
VET_CLINIC=# INSERT INTO ANIMALS(NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES('Devimon', '2017-05-12', 5, TRUE, 11);


-------------------------------- DAY 02 --------------------------------


-- Insert the following data:

-- Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
VET_CLINIC=# INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Charmander', '2020-02-08', 0, FALSE,-11);

-- Animal: Her name is Plantmon. She was born on Nov 15th, 2022, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
VET_CLINIC=# INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Plantmon', '2022-11-15', 2, TRUE, -5.7);

-- Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to 3 times.
VET_CLINIC=# INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);

-- Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
VET_CLINIC=# INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Angemon', '2005-06-12', 1, TRUE, -45);

-- Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
VET_CLINIC=# INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4);

-- Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.
VET_CLINIC=# INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Blossom', '1998-10-13', 3, TRUE, 17);



-------------------------------- DAY 03 --------------------------------



-- Insert the following data into the owners table:

-- Sam Smith 34 years old.
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Sam Smith', 34);

-- Jennifer Orwell 19 years old.
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Jennifer Orwell', 19);

-- Bob 45 years old.
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Bob', 45);

-- Melody Pond 77 years old.
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Melody Pond', 77);

-- Dean Winchester 14 years old.
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Dean Winchester', 14);

-- Jodie Whittaker 38 years old.
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Jodie Whittaker', 38);


-- Insert the following data into the species table:

-- Pokemon
INSERT INTO SPECIES(NAME) VALUES('Pokemon');

-- Digimon
INSERT INTO SPECIES(NAME) VALUES('Digimon');


-- Modify your inserted animals to include owner information (owner_id):

-- Sam Smith owns Agumon.
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Sam Smith') WHERE NAME = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Jennifer Orwell') WHERE NAME IN ('Gabumon', 'Pikachu');

-- Bob owns Devimon and Plantmon.
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Bob') WHERE NAME IN ('Devimon', 'Plantmon');

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Melody Pond') WHERE NAME IN ('Charmander', 'Squirtle', 'Blossom');

-- Dean Winchester owns Angemon and Boarmon.
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Dean Winchester') WHERE NAME IN ('Angemon', 'Boarmon');


-------------------------------- DAY 04 --------------------------------


-- Insert the following data for vets:

-- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION) VALUES('Vet William Tatcher', 45, '2000-03-23');

-- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION) VALUES('Vet Maisy Smith', 26, '2019-01-17');

-- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION) VALUES('Vet Stephanie Mendez', 64, '1981-05-04');

-- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION) VALUES('Vet Jack Harkness', 38, '2008-06-08');


-- Insert the following data for specialties:

-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO SPECIALIZATIONS(SPECIES_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME='Pokemon'), (SELECT ID FROM VETS WHERE NAME='Vet William Tatcher'));

-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO SPECIALIZATIONS(SPECIES_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME='Pokemon'), (SELECT ID FROM VETS WHERE NAME='Vet Stephanie Mendez'));

INSERT INTO SPECIALIZATIONS(SPECIES_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME='Digimon'), (SELECT ID FROM VETS WHERE NAME='Vet Stephanie Mendez'));

-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO SPECIALIZATIONS(SPECIES_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME='Digimon'), (SELECT ID FROM VETS WHERE NAME='Vet Jack Harkness'));


-- Insert the following data for visits:
-- Agumon visited William Tatcher on May 24th, 2020.
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
-- Pikachu visited Maisy Smith on May 14th, 2020.
-- Devimon visited Stephanie Mendez on May 4th, 2021.
-- Charmander visited Jack Harkness on Feb 24th, 2021.
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
-- Plantmon visited William Tatcher on Aug 10th, 2020.
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
-- Angemon visited Jack Harkness on Nov 4th, 2020.
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
-- Boarmon visited Maisy Smith on May 15th, 2019.
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
-- Blossom visited Stephanie Mendez on May 24th, 2020.
-- Blossom visited William Tatcher on Jan 11th, 2021.


INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES
        ((SELECT id FROM animals WHERE name = 'Agumon'),
        (SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
        '2020-05-24'),

        ((SELECT id FROM animals WHERE name = 'Agumon'),
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
        '2020-07-22'),

        ((SELECT id FROM animals WHERE name = 'Gabumon'),
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
        '2021-02-02'),

        ((SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-01-05'),

        ((SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-03-08'),

        ((SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-05-14'),


        ((SELECT id FROM animals WHERE name = 'Devimon'),
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
        '2021-05-04'),

        ((SELECT id FROM animals WHERE name = 'Charmander'),
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
        '2021-02-24'),

        ((SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2019-12-21'),

        ((SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
        '2020-08-10'),

        ((SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2021-04-07'),

        ((SELECT id FROM animals WHERE name = 'Squirtle'),
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
        '2019-09-29'),

        ((SELECT id FROM animals WHERE name = 'Angemon'),
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
        '2020-10-03'),

        ((SELECT id FROM animals WHERE name = 'Angemon'),
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
        '2020-11-04'),

        ((SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2019-01-24'),

        ((SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2019-05-15'),

        ((SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-02-27'),

        ((SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-08-03'),
        ((SELECT id FROM animals WHERE name = 'Blossom'),
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
        '2020-05-24'),

        ((SELECT id FROM animals WHERE name = 'Blossom'),
        (SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
        '2021-01-11');

-- Insert data into visits and owners table

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
