DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;



CREATE TABLE artists (

id SERIAL4 primary key,
name varchar(255) 

);

CREATE TABLE albums (

id SERIAL4 primary key,
title varchar(255),
genre varchar,
artist_id INT4 references artists(id)
);