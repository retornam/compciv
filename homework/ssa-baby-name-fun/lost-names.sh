#!/bin/sh

# Given two years, x and y, the lost-names.sh script should return an
# alphabetized list of names, by gender, that appear in the nationwide
# data for year x but not in y

sort "./data-hold/names-nationwide/yob$1.txt" | cut -d "," -f 1,2 > "./data-hold/lost-$1.txt"


sort "./data-hold/names-nationwide/yob$2.txt" | cut -d "," -f 1,2 > "./data-hold/lost-$2.txt"
