In lecture 17 we performed several queries on a csv extracted from
this sqlite database:

```
http://millionsongdataset.com/sites/default/files/AdditionalFiles/track_metadata.db
```

Here are the operations we performed during the lecture 

1. All songs by Guided By Voices
```
songs.query('artist_name == "Guided By Voices"')
```

2. All songs by Guided By Voices selecting a subset of columns and
   ordering by release and year.

```
(songs
 .query('artist_name == "Guided By Voices"')
 .filter(['title','release','year'])
 .sort_values(['release','year']))
```

3. Group by Artist and Count Songs

```
(songs
 .eval('dummy = 1')
 .groupby('artist_name',as_index=False)
 .agg({'dummy':'sum'})
 .rename(columns={'dummy':'count'})
 .sort_values(['count'], ascending=False)
.head(20))
```

4. Group by Year (1900 on) and sum songs.

```
songs_per_year = (songs
 .query('year >= 1900')
 .eval('dummy = 1')
 .groupby('year', as_index=False)
 .agg({'dummy':'sum'})
 .rename(columns={'dummy':'count'})
 .sort_values(['year'], ascending=False))
```

5. Count unique albums per yer.

```
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
```

6. Join of 5 & 6 by year.

```
count_data = (albums_per_year
 .join(songs_per_year.set_index("year"), on=["year"], how="inner", lsuffix="_albums", rsuffix="_songs"))
```

This homework assignment is to

1. Download the sqlite db we used for this data.
2. Translate each query into sqlite
3. Dump the first 20 lines of each query into a csv file

Submit your work in the form of an SQLite file which performs these
actions (you do not need to submit the dumps or the database)

Note that to perform the last query, which joins the songs_per_year
data and the albums_per_year data you will need to create tables in
the SQLite database (or use common table expressions). If you decide
to use CTEs you don't need to dump data for albums_per_year or
songs_per_year separately.

