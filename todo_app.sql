CREATE DATABASE todo_app;

DROP USER michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app michael;

CREATE TABLE tasks (
id int primary key not null,
title char(255) not null,
description text,
created_at timestamp without time zone not null default now(),
updated_at timestamp without time zone,
completed boolean not null default false
);

ALTER TABLE tasks DROP completed;

ALTER TABLE tasks ADD completed_at timestamp without time zone default null;

ALTER TABLE tasks ALTER updated_at SET not null;

