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

/*Create owners table*/
CREATE TABLE owners (
id int GENERATED ALWAYS AS IDENTITY,
full_name varchar(250),
age int,
PRIMARY KEY (id) 
);

/*Create species table*/
CREATE TABLE species (
id int GENERATED ALWAYS AS IDENTITY,
name varchar(100),
PRIMARY KEY (id)
);

/*Modify animals table*/
ALTER TABLE animals ADD PRIMARY KEY (id); 
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id int REFERENCES species (id);
ALTER TABLE animals ADD owner_id  int REFERENCES owners (id);

/*Create vets table*/
CREATE TABLE vets (
id int GENERATED ALWAYS AS IDENTITY, 
name varchar(100),
age int,
date_of_graduation date,
PRIMARY KEY (id)
);

/*Create specializations table*/
CREATE TABLE specializations (
specie_id int REFERENCES  species (id), 
vet_id int REFERENCES  vets (id) 
);

/*Create visits table*/
CREATE TABLE visits (
animal_id int REFERENCES  animals (id), 
vet_id int REFERENCES  vets (id) ,
visit_date date
);
