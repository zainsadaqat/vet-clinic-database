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
