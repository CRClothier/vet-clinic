/*Find all animals whose name ends in "mon".*/
select * from animals 
WHERE name LIKE '%mon';

/*List the name of all animals born between 2016 and 2019.*/
select name from animals 
WHERE date_of_birth between '2016-01-01' and '2019-12-31';

/*List the name of all animals that are neutered and have less than 3 escape attempts.*/
select name from animals 
WHERE neutered = '1' and escape_attempts < 3;

/*List date of birth of all animals named either "Agumon" or "Pikachu".*/
select date_of_birth from animals 
WHERE name IN ( 'Agumon', 'Pikachu');

/*List name and escape attempts of animals that weigh more than 10.5kg*/
select name, escape_attempts from animals 
WHERE weight_kg > 10.5;

/*Find all animals that are neutered.*/
select * from animals 
WHERE neutered = '1';

/*Find all animals not named Gabumon.*/
select * from animals 
WHERE name <> 'Gabumon';

/*Find all animals with a weight between 10.4kg and 17.3kg*/
select * from animals 
WHERE weight_kg between 10.4 and 17.3; 


BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified'; 
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;

/*Update species based on name*/
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 
UPDATE animals SET species = 'pokemon' WHERE species IS NULL; 
COMMIT TRANSACTION;
SELECT * FROM animals;

/*test deleting all records from the animal table*/
BEGIN TRANSACTION;
DELETE FROM animals; 
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;

/*Update animals with negative weight*/
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01'; 
SAVEPOINT SP1; 
UPDATE animals SET weight_kg = -weight_kg;
ROLLBACK TO SP1; 
UPDATE animals SET weight_kg = -weight_kg where weight_kg < 0;
COMMIT TRANSACTION;

/*How many animals are there?*/
SELECT COUNT(*) AS COUNT_OF_ANIMALS FROM animals;

/*How many animals have never tried to escape?*/
SELECT COUNT(*) AS COUNT_OF_CALM_ANIMALS 
FROM animals
WHERE escape_attempts = 0;

/*What is the average weight of animals?*/
SELECT AVG(weight_kg) AS AVERAGE_WEIGHT 
FROM animals;

/*Who escapes the most, neutered or not neutered animals?*/
SELECT name 
FROM animals 
ORDER BY escape_attempts DESC
limit 1;

/*What is the minimum and maximum weight of each type of animal?*/
SELECT species , MIN(weight_kg) as MIN_WEIGHT , MAX(weight_kg) AS MAX_WEIGHT 
FROM animals 
GROUP BY species;

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT species , AVG(escape_attempts) as AVERAGE_ESCAPES
FROM animals 
WHERE date_of_birth between '1990-01-01' and '2000-12-31' 
GROUP BY species;