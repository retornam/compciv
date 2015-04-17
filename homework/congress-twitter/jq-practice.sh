#!/bin/sh


# Question 1: Print the last name of the first congress member
# listed in legislators-current.json

# We need the jq program for this assignment, 
# first test that jq is installed else exit

command -v jq >/dev/null 2>&1 || { echo >&2 "I require jq  but it is not installed.  Aborting."; Exit 1; }

name=`cat data-hold/legislators-current.json | jq '.[0] .name .last' | tr -d '"'`
echo "1. $name"


# Question 2: In legislators-current.json, print the bioguide id of the 
# 112th Congressmember

bioguide=`cat data-hold/legislators-current.json | jq '.[111] .id.bioguide' | tr -d '"'`
echo "2. $bioguide"

# Question 3: In legislators-current.json, print the start date of the 
# 3rd term of the 14th-listed Congressmember

startdate=`cat data-hold/legislators-current.json | jq '.[13] .terms[2] .start' | tr -d '"'`
echo "3. $startdate"
