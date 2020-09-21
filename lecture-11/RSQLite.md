RSQLite and SQL Basics
======================
author: Vincent Toups
date: 11 Sept 2020
width:1400
height:800
css:style.css

RSQLite
=======

A library to allow you to access SQLite databases directly from R.

We already set up our database in the notes. So


```r
library(RSQLite);
library(DBI);
library(tidyverse);
connection <- dbConnect(SQLite(),"db.lite.sql");
dbGetQuery(connection, "select * from marvel_dc_characters") %>% as_tibble();
```

```
# A tibble: 39,648 x 12
       id name  identity alignment eye_color hair_color gender status
    <int> <chr> <chr>    <chr>     <chr>     <chr>      <chr>  <chr> 
 1 100001 Clau… "Secret" "Neutral" "Hazel"   "Brown"    "Male" Living
 2 100002 Elek… "Secret" "Neutral" "Blue"    "Black"    "Fema… Living
 3 100003 Thom… "Secret" "Neutral" "Black"   ""         "Male" Living
 4 100004 Mogu… ""       ""        ""        "Bald"     ""     Living
 5 100005 Deni… "Secret" "Good"    "Brown"   "Black"    "Fema… Living
 6 100006 Aphr… "Secret" "Good"    "Blue"    "Blond"    "Fema… Living
 7 100007 Jeve… "Public" "Good"    "Brown"   "Brown"    "Male" Living
 8 100008 Fibe… "Secret" "Neutral" "Brown"   "Brown"    "Male" Living
 9 100009 Tran… ""       "Good"    ""        "No"       ""     Living
10 100010 Snag… "No Dua… "Bad"     "Yellow"  "Black"    "Fema… Living
# … with 39,638 more rows, and 4 more variables: appearances <chr>,
#   first_appearance <chr>, year <int>, universe <chr>
```

The output is a data frame, which we convert immediately into a tibble.

Convenience
===========

Frequently you're working with one database so the following utility is handy:


```r
q <- function(...){
    connection <- dbConnect(SQLite(),"db.lite.sql");
    result <- NULL;
    error <- NULL;
    tryCatch({
        result <- dbGetQuery(connection, sprintf(...));
    },error=function(the_error){
        dbDisconnect(connection);
        NULL
    });
    dbDisconnect(connection);
    if(!is.null(error)){
        stop(error);
    }
    result %>% as_tibble();
}
```
We use tryCatch to ensure that we release our database connection if something goes wrong.

Using It
========


```r
tbl <- q("select * from marvel_dc_characters limit %d", 10);
tbl
```

```
# A tibble: 10 x 12
       id name  identity alignment eye_color hair_color gender status
    <int> <chr> <chr>    <chr>     <chr>     <chr>      <chr>  <chr> 
 1 100001 Clau… "Secret" "Neutral" "Hazel"   "Brown"    "Male" Living
 2 100002 Elek… "Secret" "Neutral" "Blue"    "Black"    "Fema… Living
 3 100003 Thom… "Secret" "Neutral" "Black"   ""         "Male" Living
 4 100004 Mogu… ""       ""        ""        "Bald"     ""     Living
 5 100005 Deni… "Secret" "Good"    "Brown"   "Black"    "Fema… Living
 6 100006 Aphr… "Secret" "Good"    "Blue"    "Blond"    "Fema… Living
 7 100007 Jeve… "Public" "Good"    "Brown"   "Brown"    "Male" Living
 8 100008 Fibe… "Secret" "Neutral" "Brown"   "Brown"    "Male" Living
 9 100009 Tran… ""       "Good"    ""        "No"       ""     Living
10 100010 Snag… "No Dua… "Bad"     "Yellow"  "Black"    "Fema… Living
# … with 4 more variables: appearances <chr>, first_appearance <chr>,
#   year <int>, universe <chr>
```

SELECT
======

SELECT is how we pull out a subset of columns or calculate values from
a table.


```r
q("select name, substr(year, 3) from marvel_dc_characters limit 10");
```

```
# A tibble: 10 x 2
   name                          `substr(year, 3)`
   <chr>                         <chr>            
 1 Claude Potier (Earth-616)     "00"             
 2 Elektra Natchios (Earth-616)  "81"             
 3 Thomas Williams (Earth-616)   "02"             
 4 Mogul (Earth-616)             "70"             
 5 Denise Havens (Earth-616)     "95"             
 6 Aphrodite Ourania (Earth-616) "48"             
 7 Jeven Ognats (Post-Zero Hour) "94"             
 8 Fiber (Earth-616)             ""               
 9 Tranta (Earth-616)            "91"             
10 Snaggi (Earth-616)            ""               
```

We can calculate all sorts of things in the clauses of a SELECT statement. 


```r
q("select name, cast(substr(year, 3) as integer) from marvel_dc_characters limit 10");
```

```
# A tibble: 10 x 2
   name                          `cast(substr(year, 3) as integer)`
   <chr>                                                      <int>
 1 Claude Potier (Earth-616)                                      0
 2 Elektra Natchios (Earth-616)                                  81
 3 Thomas Williams (Earth-616)                                    2
 4 Mogul (Earth-616)                                             70
 5 Denise Havens (Earth-616)                                     95
 6 Aphrodite Ourania (Earth-616)                                 48
 7 Jeven Ognats (Post-Zero Hour)                                 94
 8 Fiber (Earth-616)                                              0
 9 Tranta (Earth-616)                                            91
10 Snaggi (Earth-616)                                             0
```

SELECT as
=========

Unless we select just a column we usually want to use an `as` after
our expression to give the column a name in the results:


```r
q("select
    name,
    cast(substr(year, 3) as integer) as short_year
   from marvel_dc_characters limit 10");
```

```
# A tibble: 10 x 2
   name                          short_year
   <chr>                              <int>
 1 Claude Potier (Earth-616)              0
 2 Elektra Natchios (Earth-616)          81
 3 Thomas Williams (Earth-616)            2
 4 Mogul (Earth-616)                     70
 5 Denise Havens (Earth-616)             95
 6 Aphrodite Ourania (Earth-616)         48
 7 Jeven Ognats (Post-Zero Hour)         94
 8 Fiber (Earth-616)                      0
 9 Tranta (Earth-616)                    91
10 Snaggi (Earth-616)                     0
```

Filtering with WHERE
====================


```r
q("select
    name,
    cast(substr(year, 3) as integer) as short_year,
    year as year
   from marvel_dc_characters
   where year > 1940 and year < 2000");
```

```
# A tibble: 26,911 x 3
   name                                  short_year  year
   <chr>                                      <int> <int>
 1 Elektra Natchios (Earth-616)                  81  1981
 2 Mogul (Earth-616)                             70  1970
 3 Denise Havens (Earth-616)                     95  1995
 4 Aphrodite Ourania (Earth-616)                 48  1948
 5 Jeven Ognats (Post-Zero Hour)                 94  1994
 6 Tranta (Earth-616)                            91  1991
 7 Paragon (A.I.M.) (Earth-616)                  94  1994
 8 James Ilse (Earth-616)                        46  1946
 9 Hardball (Imperial Guard) (Earth-616)         92  1992
10 Michelle Carter (New Earth)                   86  1986
# … with 26,901 more rows
```

Where clauses can contain any expression. In SQLite 0 is false and
everything else is true.

Ordering the Results
====================

we use "ORDER BY" to order the results:


```r
q("select
    name,
    cast(substr(year, 3) as integer) as short_year,
    year as year
   from marvel_dc_characters
   where year > 1940 and year < 2000
   order by year asc;")
```

```
# A tibble: 26,911 x 3
   name                         short_year  year
   <chr>                             <int> <int>
 1 Pat Murphy (Earth-616)               41  1941
 2 Abraham Erskine (Earth-616)          41  1941
 3 Killer Casey (Earth-616)             41  1941
 4 Pepo Laroc (Earth-616)               41  1941
 5 Trapeze Trio (Earth-616)             41  1941
 6 Rudolf Norsen (Earth-616)            41  1941
 7 Major Croy (Earth-616)               41  1941
 8 Gos Carlton (Earth-616)              41  1941
 9 Charles McArthur (Earth-616)         41  1941
10 Doctor Howard (Earth-616)            41  1941
# … with 26,901 more rows
```

GROUP BY
========

In the tidyverse when we "group by" we generally summarize but we can
actually ungroup as well. In SQL "GROUP BY" must reduce any returned
values using an "aggregation function" (that is the phrase to google).

Eg:

```r
q("select
    year as year,
    count() as count
    from marvel_dc_characters
    group by year
    order by count desc")
```

```
# A tibble: 80 x 2
   year   count
   <chr>  <int>
 1 ""      1699
 2 "1993"  1317
 3 "1994"  1200
 4 "1992"  1088
 5 "2006"  1065
 6 "2008"   931
 7 "2010"   927
 8 "1989"   908
 9 "1988"   894
10 "1990"   889
# … with 70 more rows
```

Common Table Expressions
========================

It is often handy to create intermediate, temporary tables to make
code cleaner. These are much like variables in other languages except
they must always hold tables:


```r
q("with tmp as (
 select cast(year as integer) as year,
        universe
 from marvel_dc_characters
)
 select
        year,
        sum(universe = 'Marvel') as marvel_count,
        sum(universe = 'DC') as dc_count,
        count() as total
 from tmp
 where year is not null
 group by year
 order by total desc")
```

```
# A tibble: 80 x 4
    year marvel_count dc_count total
   <int>        <int>    <int> <int>
 1     0          815      884  1699
 2  1993          554      763  1317
 3  1994          485      715  1200
 4  1992          455      633  1088
 5  2006          381      684  1065
 6  2008          360      571   931
 7  2010          324      603   927
 8  1989          321      587   908
 9  1988          304      590   894
10  1990          357      532   889
# … with 70 more rows
```

Note that we can include year in the above without an aggregation
function: it is in the "GROUP BY" clause.

Common Table Expressions
========================

We can have as many CTEs as we want. Each must have a name.

They vanish when the query is over.

HAVING
======

"WHERE" restricts the results _before_ grouping. "HAVING" restricts
them after:


```r
q("with tmp as (
 select cast(year as integer) as year,
        universe
 from marvel_dc_characters
)
 select
        year,
        sum(universe = 'Marvel') as marvel_count,
        sum(universe = 'DC') as dc_count,
        count() as total
 from tmp
 where year is not null
 group by year
 having year > 1945
 order by total desc")
```

```
# A tibble: 68 x 4
    year marvel_count dc_count total
   <int>        <int>    <int> <int>
 1  1993          554      763  1317
 2  1994          485      715  1200
 3  1992          455      633  1088
 4  2006          381      684  1065
 5  2008          360      571   931
 6  2010          324      603   927
 7  1989          321      587   908
 8  1988          304      590   894
 9  1990          357      532   889
10  1991          360      505   865
# … with 58 more rows
```

JOINs
=====

Joins have the same semantics as tidyverse: inner, left, right, full.

Like most things in SQL, they are more verbose.

Let's select the stats from the powers table but only for characters
which have super strength.


```r
q("select s.*, p.power as explicit_power
from character_stats s
join hero_powers p
  on p.name = s.name where p.power = 'super_strength'
 and p.has = 'TRUE'");
```

```
# A tibble: 291 x 10
   name  alignment intelligence strength speed durability power combat total
   <chr> <chr>            <int>    <int> <int>      <int> <int>  <int> <int>
 1 3-D … good                50       31    43         32    25     52   233
 2 A-Bo… good                38      100    17         80    17     64   316
 3 Abe … good                88       14    35         42    35     85   299
 4 Abom… bad                 63       80    53         90    55     95   436
 5 Abra… bad                 88      100    83         99   100     56   526
 6 Agen… good                75       28    38         80    72     95   388
 7 Air-… bad                 50       85   100         85   100     40   460
 8 Amazo bad                 75      100   100        100   100    100   575
 9 Angel good                63       13    46         64    17     42   245
10 Anni… bad                 75       80    47         56    59     64   381
# … with 281 more rows, and 1 more variable: explicit_power <chr>
```

UNION (rbind)
=============

Or maybe we want to compare both `super_speed` and `super_strength`
characers.


```r
q("select s.*, p.power as explicit_power
from character_stats s
join hero_powers p
  on p.name = s.name where p.power = 'super_speed'
 and p.has = 'TRUE'
union select s.*, p.power as explicit_power
from character_stats s
join hero_powers p
  on p.name = s.name where p.power = 'super_speed'
 and p.has = 'TRUE'");
```

```
# A tibble: 194 x 10
   name  alignment intelligence strength speed durability power combat total
   <chr> <chr>            <int>    <int> <int>      <int> <int>  <int> <int>
 1 3-D … good                50       31    43         32    25     52   233
 2 Abom… bad                 63       80    53         90    55     95   436
 3 Abra… bad                 88      100    83         99   100     56   526
 4 Adam… good                 1        1     1          1     0      1     5
 5 Air-… bad                 50       85   100         85   100     40   460
 6 Alan… good                63       80    23         90    98     32   386
 7 Amazo bad                 75      100   100        100   100    100   575
 8 Angel good                63       13    46         64    17     42   245
 9 Anni… bad                 75       80    47         56    59     64   381
10 Apoc… bad                100      100    33        100   100     60   493
# … with 184 more rows, and 1 more variable: explicit_power <chr>
```

LEFT JOIN 
=========

(RIGHT join not supported in SQLite)

1. you want to count the number of pieces of missing data
2. you want to replace missing data with some other value via
   COALESCE.
   
Eg: (contrived)
===============


```r
q("with characters as (select distinct name from character_stats),
        clear_stats as (select * from character_stats where total > 5),
        missings as (select c.name,
                            s.* from characters c
                     left join clear_stats s on c.name = s.name where s.intelligence is null)
 select count(*) from missings");
```

```
# A tibble: 1 x 1
  `count(*)`
       <int>
1        177
```

Eg: (contrived): COALESCE
=========================


```r
q("with characters as (select distinct name from character_stats),
        clear_stats as (select * from character_stats where total > 5),
        avgs as (select sum(intelligence)/count() as intelligence,
sum(strength)/count() as strength,
sum(speed)/count() as speed,
sum(durability)/count() as durability,
sum(power)/count() as power,
sum(combat)/count() as combat from clear_stats
),
        missings as (select c.name,
                             coalesce(s.intelligence, a.intelligence) as intelligence,
coalesce(s.strength, a.strength) as strength,
coalesce(s.speed, a.speed) as speed,
coalesce(s.durability, a.durability) as durability,
coalesce(s.power, a.power) as power,
coalesce(s.combat, a.combat) as combat
from characters c
                     left join clear_stats s on c.name = s.name 
                     inner join avgs a on 1)
 select * from missings limit 10");
```

```
# A tibble: 10 x 7
   name     intelligence   strength    speed     durability   power    combat   
   <chr>    <chr>          <chr>       <chr>     <chr>        <chr>    <chr>    
 1 Name     Intelligence   Strength    Speed     Durability   Power    Combat   
 2 3-D Man  50             31          43        32           25       52       
 3 A-Bomb   38             100         17        80           17       64       
 4 Abe Sap… 88             14          35        42           35       85       
 5 Abin Sur 50             90          53        64           84       65       
 6 Abomina… 63             80          53        90           55       95       
 7 Abraxas  88             100         83        99           100      56       
 8 Adam Mo… 63             10          12        100          71       64       
 9 Adam St… 62.1011494252… 40.4436781… 37.94712… 58.36091954… 56.6229… 60.28045…
10 Agent  … 62.1011494252… 40.4436781… 37.94712… 58.36091954… 56.6229… 60.28045…
```

Recap
=====

1. You may find a data set too big to fit in R's memory
2. But don't want to go to the trouble of getting an AWS account and
   buying a VM with 128 GB of RAM.
3. SQLite is an SQL database that works with single files
4. It can do most operations in much less RAM than dplyr
5. You can import CSV data into SQL fairly easily
6. And then pre-process the data there, pulling the (smaller) results
   directly into R via RSQlite.
   
   
