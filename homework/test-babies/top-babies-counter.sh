#!/bin/bash


# top-babies-counter.sh  is a script  when executed,
# for every state file, print out the line which contains
# the most popular baby name(in a single year) in that 
# states history.


for txtfile in $(ls data-hold/*.TXT)
do
    cat $txtfile | sort -n -r -t ',' -k 5 | head -n 1 >>  data-hold/top-baby-names
done

