/* This homework should be submitted in the form of an SQLite Script
like this. As per the instructions, the script should, when executed
against the music database, produce the appropriate outputs in csv
format.

We can limit the size of the output files to 20 rows and unless the
query explicitly asserts an order, the resulting rows may differ from
person to person.

*/

/* 1. translate:

> songs.query('artist_name == "Guided By Voices"');

*/

.mode csv
.headers on
.once just_guided_by_voices.csv

select * from songs where artist_name = "Guided By Voices" limit 20;

/*
2. translate 
(songs
 .query('artist_name == "Guided By Voices"')
 .filter(['title','release','year'])
 .sort_values(['release','year']))
*/

.once gbv_sorted.csv
select title, release, year from songs
where artist_name = "Guided By Voices"
order by release, year
limit 20;

/*
3. (songs
 .eval('dummy = 1')
 .groupby('artist_name',as_index=False)
 .agg({'dummy':'sum'})
 .rename(columns={'dummy':'count'})
 .sort_values(['count'], ascending=False)
.head(20))
*/

.once artist_song_count.csv
select artist_name, count(1) as count from songs
group by artist_name
order by count
limit 20;

/*
4. songs_per_year = (songs
 .query('year >= 1900')
 .eval('dummy = 1')
 .groupby('year', as_index=False)
 .agg({'dummy':'sum'})
 .rename(columns={'dummy':'count'})
 .sort_values(['year'], ascending=False))

*/

.once songs_per_year.csv

select year, count(1) as count from songs
group by year
having year >= 1900
limit 10;

/* there are variations on the above (particularly as to where the
filtration happens, all are ok */

/* 5. 
albums_per_year = (songs
 .query('year >= 1900')
 .eval('dummy = 1')
 .groupby(['release','year'], as_index=False)
 .agg({'dummy':'count'})
 .eval('dummy = 1')
 .groupby('year', as_index=False)
 .agg({'dummy':'count'})
 .rename(columns={'dummy':'count'})
 .sort_values('year'))
*/

.once albums_per_year.csv

with albums as
 (select year, release
  from songs
  where year >= 1900
  group by year, release)
select year, sum(1) as count from albums
group by year
order by year
limit 20;

/* 6.

count_data = (albums_per_year
 .join(songs_per_year.set_index("year"), on=["year"], how="inner",
 lsuffix="_albums", rsuffix="_songs"))

There is a typo in the assignment but the idea here is to join songs
and albums per year.

*/

.once albums_and_songs_per_year.csv

with albums as (
  select year, release
  from songs
  where year >= 1900
  group by year, release),
albums_per_year as (
  select year, sum(1) as album_count from albums
  group by year
  ),
songs_per_year as (
  select year, sum(1) as song_count from songs
  where year >= 1900
  group by year
)
select a.year, a.album_count, s.song_count from
albums_per_year a
join songs_per_year s on a.year = s.year
order by a.year;

/*

*/

