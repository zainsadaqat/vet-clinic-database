/* Database schema to keep the structure of entire database. */


-------------------------------- DAY 01 --------------------------------


-- Create a database named vet_clinic.
CREATEDB VET_CLINIC;


-- Create a table named animals with the following columns:
VET_CLINIC=# CREATE TABLE ANIMALS(
-- id: integer
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- name: string
    NAME TEXT,
-- date_of_birth: date
    DATE_OF_BIRTH DATE,
-- escape_attempts: integer
    ESCAPE_ATTEMPTS INT,
-- neutered: boolean
    NEUTERED BOOLEAN,
-- weight_kg: decimal
    WEIGHT_KG DECIMAL
);


-------------------------------- DAY 02 --------------------------------


-- Add a column species of type string to your animals table. Modify your schema.sql file.
ALTER TABLE ANIMALS ADD SPECIES TEXT;


-------------------------------- DAY 03 --------------------------------


-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer
CREATE TABLE OWNERS(
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    FULL_NAME TEXT,
    AGE INT
);


-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
CREATE TABLE SPECIES(
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    NAME TEXT
);


-- Modify animals table:

-- Remove column species
ALTER TABLE ANIMALS DROP COLUMN SPECIES;

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE ANIMALS ADD OWNER_ID INT;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE ANIMALS ADD SPECIES_ID INT;


-- Modify your inserted animals so it includes the species_id value:

-- If the name ends in "mon" it will be Digimon
UPDATE ANIMALS SET SPECIES_ID = (SELECT ID FROM SPECIES WHERE NAME='Digimon') WHERE NAME LIKE '%mon';

-- All other animals are Pokemon
UPDATE ANIMALS SET SPECIES_ID = (SELECT ID FROM SPECIES WHERE NAME='Pokemon') WHERE NAME NOT LIKE '%mon';


-------------------------------- DAY 04 --------------------------------


-- Create a table named vets with the following columns:
CREATE TABLE VETS(

-- id: integer (set it as autoincremented PRIMARY KEY)
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,

-- name: string
    NAME TEXT,

-- age: integer
    AGE INT,

-- date_of_graduation: date
    DATE_OF_GRADUATION DATE
);


-- There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle this relationship.
CREATE TABLE SPECIALIZATIONS(
    VET_ID INT,
    SPECIES_ID INT,
    CONSTRAINT VET_ID FOREIGN KEY(VET_ID) REFERENCES VETS(ID),
    CONSTRAINT SPECIES_ID FOREIGN KEY(SPECIES_ID) REFERENCES SPECIES(ID)
);


-- There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
CREATE TABLE VISITS(
    ANIMALS_ID INT,
    CONSTRAINT ANIMALS_ID FOREIGN KEY(ANIMALS_ID) REFERENCES ANIMALS(ID),
    VETS_ID INT,
    CONSTRAINT VETS_ID FOREIGN KEY(VETS_ID) REFERENCES VETS(ID),
    DATE_OF_VISIT DATE
);



-------------------------------- WEEK 02: DAY 01 --------------------------------

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- SELECT COUNT(*) FROM visits where animal_id = 4;
CREATE INDEX ANIMALS_ID_INDEX ON VISITS(ANIMALS_ID);

-- SELECT * FROM visits where vet_id = 2;
CREATE INDEX VETS_ID_INDEX ON VISITS(VETS_ID);



