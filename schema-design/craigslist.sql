DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    user_first_name TEXT,
    user_last_name TEXT,
    user_email TEXT NOT NULL,
    password VARCHAR(20) NOT NULL,
    pref_region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    cat_name TEXT
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    post_title TEXT,
    post_text TEXT,
    location TEXT,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
);

INSERT INTO regions (region_name)
VALUES
('Midwest'),
('Northeast'),
('Midatlantic'),
('Europe');

INSERT INTO users (username, user_email, password, pref_region)
VALUES
('lita', 'lita@yahoo.com', 'monkeys', 1),
('boo', 'booboo@ghost.com', 'dogs', 1),
('lion', 'lionsrcool@yahoo.com', 'llamas', 1),
('mister', 'misterman@gmail.com', 'tomatoes', 4);

INSERT INTO categories (cat_name)
VALUES
('jobs'),
('antiques'),
('garage sales'),
('meetups'),
('toys');

INSERT INTO posts (post_title, user_id, region_id, category_id)
VALUES
('cafe waitress', 3, 1, 1),
('cafe cook', 3, 1, 1),
('cafe hostess', 3, 1, 1),
('toy car', 1, 1, 5),
('vintage doll', 1, 1, 5),
('flea market', 4, 4, 3);