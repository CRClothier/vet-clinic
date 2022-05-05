/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic

CREATE TABLE animals (
  id INTEGER PRIMARY KEY,
  name TEXT,
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
 );
 
 /*Add a column species of type string to your animals table. Modify your schema.sql file.*/
 ALTER TABLE animals ADD species varchar(100); 