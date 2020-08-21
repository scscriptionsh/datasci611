#!/bin/bash 

N_ROWS=`cat data/super_hero_powers.csv | wc | expand | tr -s ' ' | cut -d' ' -f2`
N_UNIQ=`cat data/super_hero_powers.csv | cut -d',' -f2- | sort | uniq | wc | expand | tr -s ' ' | cut -d' ' -f2`

echo There are $N_ROWS heroes but only $N_UNIQ sets of powers.
