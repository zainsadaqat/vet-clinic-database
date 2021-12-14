/* Database schema to keep the structure of entire database. */

-- Create a database named vet_clinic.
CREATEDB VET_CLINIC;

-- Create a table named animals with the following columns:
-- id: integer
-- name: string
-- date_of_birth: date
-- escape_attempts: integer
-- neutered: boolean
-- weight_kg: decimal

VET_CLINIC=# CREATE TABLE ANIMALS(
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    NAME TEXT,
    DATE_OF_BIRTH DATE,
    ESCAPE_ATTEMPTS INT,
    NEUTERED BOOLEAN,
    WEIGHT_KG DECIMAL
);


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

