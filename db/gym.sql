DROP TABLE reservations;
DROP TABLE members;
DROP TABLE classes;
DROP TABLE sessions;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  membership_type VARCHAR--,
  -- membership_number INT--,
  -- membership_start_date DATE,
  -- membership_renewal DATE
  );

CREATE TABLE classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  description TEXT,
  instructor VARCHAR,
  class_time TIME,
  max_capacity INT
  );

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  class_time TIME,
  max_capacity INT
  );

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  member_id INT REFERENCES members(id),
  gym_class_id INT REFERENCES classes(id)--,
  -- session_id INT REFERENCES sessions(id)
);
