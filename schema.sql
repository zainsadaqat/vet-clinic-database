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