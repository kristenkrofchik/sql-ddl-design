DROP DATABASE IF EXISTS league_db;

CREATE DATABASE league_db;

\c league_db;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT,
    home_city TEXT,
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    birthday DATE,
    height FLOAT,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE refs 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    season_start_date DATE,
    season_end_date DATE
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    match_loc TEXT,
    match_date DATE,
    start_time TIME,
    home_team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    away_team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    season_id INTEGER REFERENCES seasons ON DELETE SET NULL,
    head_ref_id INTEGER REFERENCES refs ON DELETE SET NULL,
    assistant_ref_1_id INTEGER REFERENCES refs ON DELETE SET NULL,
    assistant_ref_2_id INTEGER REFERENCES refs ON DELETE SET NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL
);

CREATE TABLE lineups
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
)

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL,
    result TEXT CHECK (result ='win' OR result='loss' OR result='draw')
)


INSERT INTO teams (team_name, home_city)
VALUES
('Wildcats', 'Chicago'),
('Panthers', 'Montreal'),
('Dogs', 'Mexico City'),
('Lions', 'Detroit'),
('Hamburgers', 'Istanbul');

INSERT INTO players (first_name, last_name, team_id)
VALUES
('Harry', 'Manciate', 1),
('Leo', 'Duumas', 1),
('Pb', 'Jelly', 1),
('Kita', 'Mees', 2),
('J', 'Peterman', 3),
('Dina', 'Lohan', 4),
('Arno', 'M', 5);

INSERT INTO refs (first_name, last_name)
VALUES
('Greg', 'Johnson'),
('Anna', 'Miso'),
('Larry', 'Bobarty'),
('Lars', 'Babushka')

INSERT INTO seasons (season_start_date, season_end_date)
VALUES
('2020-11-01', '2021-02-15'),
('2019-11-02', '2020-02-17');

INSERT INTO matches (home_team_id, away_team_id, season_id, head_ref_id, assistant_ref_1_id, assistant_ref_2_id)
VALUES
(1, 2, 1, 1, 2, 3),
(1, 3, 1, 1, 2, 3),
(2, 4, 2, 4, 1, 2);

INSERT INTO goals (player_id, match_id)
VALUES
(1, 1),
(2, 1),
(2, 2);

INSERT INTO lineups (player_id, match_id, team_id)
VALUES
(1, 1, 1),
(2, 1, 1)

INSERT INTO results (team_id, match_id, result)
VALUES
(1, 1, 'win'),
(2, 1, 'loss')


