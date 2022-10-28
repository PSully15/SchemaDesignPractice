DROP DATABASE soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db;

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthday DATE NOT NULL,
  height TEXT NOT NULL,
  current_team_id INTEGER REFERENCES teams (id) ON DELETE SET NULL
);

create TABLE season
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  home_team_id INTEGER REFERENCES teams (id) ON DELETE SET NULL,
  away_team_id INTEGER REFERENCES teams (id) ON DELETE SET NULL,
  location TEXT NOT NULL,
  match_date DATE NOT NULL,
  start_time TIME NOT NULL,
  season_id INTEGER REFERENCES season (id) ON DELETE SET NULL,
  head_referee_id INTEGER REFERENCES referees (id) ON DELETE SET NULL,
  assistant_referee_1_id INTEGER REFERENCES referees (id) ON DELETE SET NULL,
  assistant_referee_2_id INTEGER REFERENCES referees (id) ON DELETE SET NULL
);

CREATE TABLE lineups
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players (id) ON DELETE SET NULL,
  match_id  INTEGER REFERENCES matches (id) ON DELETE SET NULL,
  team_id INTEGER REFERENCES teams (id) ON DELETE SET NULL
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players (id) ON DELETE SET NULL,
  match_id INTEGER REFERENCES matches (id) ON DELETE SET NULL
);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams (id) ON DELETE SET NULL,
  match_id INTEGER REFERENCES matches (id) ON DELETE SET NULL,
  results TEXT NOT NULL
);