# DROP TABLES

songplay_table_drop = "DROP TABLE IF EXISTS songplays;"
user_table_drop = "DROP TABLE IF EXISTS users;"
song_table_drop = "DROP TABLE IF EXISTS songs;"
artist_table_drop = "DROP TABLE IF EXISTS artists;"
time_table_drop = "DROP TABLE IF EXISTS time;"

# CREATE TABLES

songplay_table_create = ("""
CREATE TABLE IF NOT EXISTS songplays
(
    songplay_id serial PRIMARY KEY, 
    start_time bigint NOT NULL, 
    user_id int NOT NULL, 
    level varchar, 
    song_id varchar, 
    artist_id varchar, 
    session_id int, 
    location varchar, 
    user_agent varchar
)


""")

user_table_create = ("""
CREATE TABLE IF NOT EXISTS users
(
    user_id int NOT NULL PRIMARY KEY, 
    first_name varchar, 
    last_name varchar, 
    gender varchar, 
    level varchar
)
""")

song_table_create = ("""
CREATE TABLE IF NOT EXISTS songs
(
    song_id varchar NOT NULL PRIMARY KEY, 
    title varchar NOT NULL, 
    artist_id varchar NOT NULL, 
    year int, 
    duration float
)
""")

artist_table_create = ("""
CREATE TABLE IF NOT EXISTS artists
(
    artist_id varchar NOT NULL PRIMARY KEY, 
    name varchar NOT NULL, 
    location varchar, 
    latitude float, 
    longitude float
)
""")

time_table_create = ("""
CREATE TABLE IF NOT EXISTS time
(
    start_time bigint NOT NULL PRIMARY KEY, 
    hour int, 
    day int, 
    week int, 
    month int, 
    year int, 
    weekday int
)
""")

# INSERT RECORDS

songplay_table_insert = ("""
INSERT INTO songplays VALUES(DEFAULT, %s, %s, %s, %s, %s, %s, %s, %s)
ON CONFLICT DO NOTHING;
""")

user_table_insert = ("""
INSERT INTO users VALUES(%s, %s, %s, %s, %s)
ON CONFLICT (user_id) 
DO UPDATE SET level = EXCLUDED.level;
""")

song_table_insert = ("""
INSERT INTO songs VALUES(%s, %s, %s, %s, %s)
ON CONFLICT DO NOTHING;
""")

artist_table_insert = ("""
INSERT INTO artists VALUES(%s, %s, %s, %s, %s)
ON CONFLICT DO NOTHING;
""")


time_table_insert = ("""
INSERT INTO time VALUES(%s, %s, %s, %s, %s, %s, %s)
ON CONFLICT DO NOTHING;
""")

# FIND SONGS

song_select = ("""
select s.song_id, a.artist_id from songs s join artists a on s.artist_id = a.artist_id
where s.title = %s and a.name = %s and s.duration = %s;
""")

# QUERY LISTS

create_table_queries = [songplay_table_create, user_table_create, song_table_create, artist_table_create, time_table_create]
drop_table_queries = [songplay_table_drop, user_table_drop, song_table_drop, artist_table_drop, time_table_drop]