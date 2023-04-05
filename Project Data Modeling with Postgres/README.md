1. Discuss the purpose of this database in the context of the startup, Sparkify, and their analytical goals
    - Create database sparkifydb with song and log dataset (json format).
    - Define a star schema, extract data, transform and load to postgresql database was created.
    - Helpful for analysis team can queries on song play analysis.
2. How to run the Python scripts
    - Run create_tables.py file: create all tables.
    - Run elt.py file: process json file and insert to tables.
3. An explanation of the files in the repository
    - create_tables.py: drop and create tables with query scripts.
    - sql_queries.py: SQL script for CREATE, DROP, INSERT and SELECT.
    - etl.py: read json file from data folder, transfrom and insert to tables.
4. State and justify your database schema design and ETL pipeline
    - Star schema has 1 Fact and 4 Dimension tables:
        + Fact table: songplays 
        + Dim tables: users, songs, artists, time
    - ETL pipeline: 
        + sql_queries.py define script for CREATE, DROP, INSERT table and SELECT query.
        + create_table.py using functions create_database, drop_tables, create_tables for create Database sparkifydb and process query scripts.
        + elt file process json file, transform and insert to 5 tables created. SELECT query collects song and artist id from the songs and artists tables and combines this with log file derived data to populate the songplays fact table.
