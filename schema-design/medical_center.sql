DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY, 
    first_name TEXT, 
    last_name TEXT, 
    specialty TEXT,
    email TEXT
);

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY, 
    first_name TEXT, 
    last_name TEXT, 
    insurance TEXT, 
    birthday DATE,
    email TEXT
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT,
    disease_description TEXT
)

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    visit_date DATE
)

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE SET NULL,
    disease_id INTEGER REFERENCES diseases ON DELETE SET NULL,
    notes TEXT
)

INSERT INTO doctors (first_name, last_name, specialty)
VALUES
('Jan', 'Murtaugh', 'Family Medicine'),
('Leo', 'Angel', 'Gynecology'),
('Kite', 'Lasagna', 'Pediatrics');

INSERT INTO patients (first_name, last_name)
VALUES
('Tiana', 'Frog'),
('Rapunzel', 'Hair'),
('Lisa', 'Aguadente'),
('Kiki', 'Storeio');

INSERT INTO diseases (disease_name)
VALUES
('purpleitis'),
('covid19'),
('smelly feet');

INSERT INTO visits (id, doctor_id, patient_id, visit_date)
VALUES
(1, 1, 1, '2020-12-12'),
(2, 3, 2, '2021-10-10');

INSERT INTO diagnoses (id, visit_id, disease_id) 
VALUES
(1, 1, 3),
(2, 1, 2);
