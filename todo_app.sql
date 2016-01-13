-- psql -f todo_app.sql

-- CREATE DATABASE todo_app;

-- DROP USER michael;

-- CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app kevin;

CREATE TABLE tasks (
id serial primary key not null,
title char(255) not null,
description text,
created_at timestamp without time zone not null default now(),
updated_at timestamp without time zone,
completed boolean not null default false
);

ALTER TABLE tasks DROP completed;

ALTER TABLE tasks ADD completed_at timestamp without time zone default null;

ALTER TABLE tasks ALTER updated_at SET not null;

INSERT INTO tasks VALUES (
  DEFAULT,
  'Study SQL',
  'Complete this exercise',
  now(),
  now(),
  NULL
);

INSERT INTO tasks VALUES (
  DEFAULT,
  'Study PostgreSQL',
  'Read all the documentation',
  now(),
  now(),
  NULL
);

SELECT title
FROM tasks;

-- SELECT *
-- FROM tasks
-- WHERE completed_at = null;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL'

SELECT title, description
FROM tasks
WHERE completed_at = null;

SELECT *
FROM tasks
WHERE created_at DESC;

INSERT INTO tasks VALUES (
  DEFAULT,
  'mistake 1',
  'test entry',
  now(),
  now(),
  NULL
);

INSERT INTO tasks VALUES (
  DEFAULT,
  'mistake 2',
  'another test',
  now(),
  now(),
  NULL
);

INSERT INTO tasks VALUES (
  DEFAULT,
  'third mistake',
  'anoter mistake',
  now(),
  now(),
  NULL
);

SELECT title
FROM tasks
WHERE title CONTAINS 'mistake';

DELETE
FROM tasks
WHERE title CONTAINS 'mistake';

SELECT title
FROM tasks
ORDER BY title asc;