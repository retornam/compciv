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


# Question 4: In legislators-current.json, print the first name, last name,
# and the birthdate date of the 5th-listed congressmember (one item on each
# line is fine)

four=`cat data-hold/legislators-current.json | jq '.[4] | .name .first, .name .last, .bio .birthday'`
echo "4. $four"

# Question 5: In legislators-current.json, print the birthdates of the 10 youngest congressmembers

five=`cat data-hold/legislators-current.json | jq ' .[] .bio .birthday' | sort -r | head -n 10 | tr -d '"'`

echo "5. $five"



# Question 6:  In legislators-current.json, print the list of religious
# affiliations (including null), in descending-order of frequency

six=`cat legislators-current.json`
echo "6. $six"

# Question 7: In legislators-current.json, Print the number of incoming Congressmembers

seven=`cat legislators-current.json`
echo "7. $seven"

# Question 8: In legislators-current.json, Print the start year of the
# longest-serving Congressmember

eight=`cat legislators-current.json`
echo "8. $eight"

# Question 9: In legislators-current.json, print the number of Republican congressmembers

nine=`cat legislators-current.json`
echo ".$nine"

# Question 10:In legislators-current.json, print the number of Congressmembers who are neither Republican nor Democratic

ten=`cat legislators-current.json`
echo ".$ten"

# Question 11: In legislators-current.json, get the list of all .rss_url
# entries, with duplicates removed, and in alphabetical order, and print just
# the first 10 lines:

eleven=`cat legislators-current.json`
echo ".$eleven"

# Question 12: In legislators-social-media.json, print the number of Twitter accounts

twelve=`cat legislators-social-media.json`
echo ".$twelve"
# Question 13: In legislators-social-media.json, print the number of Facebook accounts

thirteen=`cat legislators-social-media.json`
echo ".$thirteen"
# Question 14: In legislators-social-media.json, print the first 10 lines of a
# comma-separated list of all bioguideIDs, along with Twitter screen names
# (if they have one), in alphabetical order of Twitter screen names

fourteen=`cat congress-twitter-profiles.json`
echo ".$fourteen"
# Question 15: In congress-twitter-profiles.json, print the number of verified Twitter accounts.

fifteen=`cat congress-twitter-profiles.json`
echo ".$fifteen"

# Question 16: In congress-twitter-profiles.json, print the number of verified Twitter accounts.

sixteen=`cat congress-twitter-profiles.json`
echo ".$sixteen"

# Question 17: In congress-twitter-profiles.json, print the largest follower count

seventeen=`cat congress-twitter-profiles.json`
echo ".$seventeen"

# Question 18:  In congress-twitter-profiles.json, print the first 10 lines
# of: CSV of name, screen_name, followers_count, verified, and created_at
# (when the account was created)

eighteen=``
echo ".$eighteen"

# Question 19:  In congress-twitter-profiles.json, print the first 10 lines
# of: a CSV of screen_name, statuses_count, followers_count, and the
# created_at of their most recent tweet

nineteen=`cat data-hold/congress-twitter-profiles.json | jq '.[0,1,2,3,4,5,6,7,8,9] |  .screen_name, .statuses_count, .followers_count,  .status.created_at ' | \
    tr -d '"'`
echo ".$nineteen"
