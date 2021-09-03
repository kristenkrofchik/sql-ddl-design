-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  prod_name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL, 
  dur_in_sec INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album INTEGER REFERENCES albums ON DELETE SET NULL
);

CREATE TABLE songs_artists
(
  song_id INTEGER REFERENCES songs ON DELETE SET NULL,
  artist_id INTEGER REFERENCES artists ON DELETE SET NULL
);

CREATE TABLE songs_producers
(
  song_id INTEGER REFERENCES songs ON DELETE SET NULL,
  producer_id INTEGER REFERENCES producerss ON DELETE SET NULL
);


