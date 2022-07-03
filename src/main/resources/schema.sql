DROP TABLE IF EXISTS MPA_RATING, GENRES, FILMS, FILM_GENRES, USERS, LIKES, FRIENDSHIPS;

CREATE TABLE IF NOT EXISTS MPA_RATING (
    mpa_id int PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE IF NOT EXISTS GENRES (
    genre_id int PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE IF NOT EXISTS FILMS (
    film_id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(50),
    description varchar(200),
    releaseDate date,
    duration int,
    mpa_id int REFERENCES MPA_RATING (mpa_id)
);

CREATE TABLE IF NOT EXISTS FILM_GENRES (
    film_id bigint REFERENCES FILMS (film_id),
    genre_id int REFERENCES GENRES (genre_id)
);

CREATE TABLE IF NOT EXISTS USERS (
    user_id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    email varchar(50),
    login varchar(50),
    name varchar(50),
    birthday date
);

CREATE TABLE IF NOT EXISTS LIKES (
    film_id bigint REFERENCES FILMS (film_id),
    user_id bigint REFERENCES USERS (user_id)
);

CREATE TABLE IF NOT EXISTS FRIENDSHIPS (
    user_id bigint REFERENCES USERS (user_id),
    friend_id bigint REFERENCES USERS (user_id),
    status boolean
);