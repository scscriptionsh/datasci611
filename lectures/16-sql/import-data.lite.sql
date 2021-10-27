DROP TABLE IF EXISTS powers;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS page_data;

CREATE TABLE powers (
power text,
character_name text,
universe text,
url text
);

CREATE TABLE properties (
character_name text,
universe text,
property_name text,
property_value text
);

CREATE TABLE page_data (
character_name text,
universe text,
page_length real
);

.mode csv
.header on

.import --csv --skip 1 source_data/character-page-data.csv page_data

.import --csv --skip 1 source_data/powers.csv powers

.import --csv --skip 1 source_data/characters.csv properties
