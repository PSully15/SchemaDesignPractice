DROP DATABASE hospital_db;
CREATE DATABASE hospital_db;
\c hospital_db;

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  insurance TEXT NOT NULL,
  birthday DATE NOT NULL,
  phone_number VARCHAR(10) NOT NULL
);

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  field TEXT NOT NULL
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT
);

CREATE TABLE patient_visits
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors (id) ON DELETE SET NULL,
  patient_id INTEGER REFERENCES patients (id) ON DELETE SET NULL
);

CREATE TABLE diagnosis
(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES patient_visits (id) ON DELETE SET NULL,
  disease_id INTEGER REFERENCES Diseases (id) ON DELETE SET NULL
);

INSERT INTO patients
(
  name,
  insurance,
  birthday,
  phone_number
)
VALUES
(
  'Patrick Sullivan',
  'Generic Company',
  '07-15-1997',
  4011234567
);

INSERT INTO doctors
(
  name,
  field
)
VALUES
(
  'John Hancock',
  'Surgeon'
);

INSERT INTO diseases
(
  name,
  description
)
VALUES
(
  'Cyst',
  'Tissue that contains fluid'
);

INSERT INTO patient_visits
(
  doctor_id,
  patient_id
)
VALUES
(
  1,
  1
);

INSERT INTO diagnosis
(
  visit_id,
  disease_id
)
VALUES
(
  1,
  1
);