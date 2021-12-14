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
