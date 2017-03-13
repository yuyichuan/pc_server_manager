CREATE TABLE team(
    id INTEGER PRIMARY KEY,
    name    TEXT
);

CREATE TABLE member(
    id      INTEGER PRIMARY KEY,
    team_id    INTEGER REFERENCES team (id),
    first_name  TEXT,
    last_name   TEXT,
    part        TEXT,
    age         INT
);