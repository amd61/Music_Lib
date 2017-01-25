DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;



CREATE TABLE artist (

id SERIAL4 primary key,
name varchar(255) 

);

CREATE TABLE album (

id SERIAL4 primary key,
title varchar(255),
genre varchar,
artist_id INT4 references artists(id)
);