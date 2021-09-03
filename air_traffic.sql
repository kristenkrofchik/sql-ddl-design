-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
)

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_name TEXT NOT NULL
)

CREATE TABLE airlines 
(
  id SERIAL PRIMARY KEY,
  al_name TEXT NOT NULL,
  al_code TEXT NOT NULL
)

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  dep_time TIMESTAMP NOT NULL,
  arr_time TIMESTAMP NOT NULL,
  from_city INTEGER REFERENCES cities ON DELETE SET NULL,
  to_city INTEGER REFERENCES cities ON DELETE SET NULL,
  airline INTEGER REFERENCES airlines ON DELETE SET NULL
)

CREATE TABLE passenger_seats
(
  id SERIAL PRIMARY KEY,
  seat_number VARCHAR(4) NOT NULL,
  pass_id INTEGER REFERENCES passengers ON DELETE SET NULL,
  flight_id INTEGER REFERENCES passengers ON DELETE SET NULL
)

