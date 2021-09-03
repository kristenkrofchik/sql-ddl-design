-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TEABLE suns 
(
  id SERIAL PRIMARY KEY,
  sun_name TEXT NOT NULL,
  galaxy INTEGER REFERENCES galaxies ON DELETE SET NULL
)

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orb_per_in_yr FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES suns ON DELETE SET NULL,
  galaxy INTEGER REFERENCES galaxies ON DELETE SET NULL
)

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets ON DELETE SET NULL,
  galaxy_id INTEGER REFERENCES galaxies ON DELETE SET NULL
);


