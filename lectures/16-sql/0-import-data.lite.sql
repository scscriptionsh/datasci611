DROP TABLE IF EXISTS powers;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS page_lengths;

DROP TABLE IF EXISTS powers_raw;
DROP TABLE IF EXISTS properties_raw;
DROP TABLE IF EXISTS page_lengths_raw;


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
page_length real
);

CREATE TABLE powers_raw (
power text,
character_name text,
universe text,
url text);

CREATE TABLE properties_raw (
character_name text,
universe text,
property_name text,
property_value text
);

CREATE TABLE page_data_raw (
character_name text,
page_length real
);

