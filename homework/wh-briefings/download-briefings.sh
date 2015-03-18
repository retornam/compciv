#!/bin/sh

# This script  visits the  https://whitehouse.gov
# and downloads all the available press briefings
# page links on the  website as of March 17, 2015



base_url=https://www.whitehouse.gov/briefing-room/press-briefings


#set the last page number 
last_num=139


for i in $(seq  0 $last_num)
do
    echo "$base_url?page=$i"

    curl  "$base_url?page=$i" -o "./html/$i.html"
done
