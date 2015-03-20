#!/bin/bash

# Given a state abbreviation and a year, the uniquely-stately.sh
# script would return a list of names, by gender, that appear only in the
# given state for that year. The output list should include: the gender, the
# name, and the number of babies with that name for that state and year.



state=$1
year=$2




filenames=$(ls ./data-hold/names-by-state/*.TXT | grep -v $state)


cat $filenames | grep ",$year," | cut -d ',' -f 2,4 | sort | uniq > data-hold/tmp.txt



cat "./data-hold/names-by-state/$state.TXT" | grep ",$year," | cut -d "," -f 2,4,5 | grep -vF -f  ./data-hold/tmp.txt

