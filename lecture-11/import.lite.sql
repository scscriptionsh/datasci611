drop table if exists characters;
create table characters (
character_id integer, 
name text
);

.mode csv
.import source_data/characters.headless.csv characters
