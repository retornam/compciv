#!/bin/sh
set -o history
set -H

# This script selects all links found in the file html/all_briefing_links a
# and downloads them to the folder html/briefings for later analysis. The
# script assumes that the html folder is in the current working directory

cwd=$(pwd)
html_briefings_dir="$cwd/html/briefings"
all_briefing_links="$cwd/html/all_briefing_links"
cd $html_briefings_dir

#get list of files in html_briefings_dir
filescount=$(ls -l | wc -l)


download_all_briefings(){
    if [ -e $all_briefing_links ] ; then
        while read p; do
            curl -O $p
        done <$all_briefing_links
    else
        echo "The file all_briefing_links does not exist. Exiting.."
        exit 1;
    fi
}

strip_text_from_html() {
    for  filename in $(ls)
    do
        cat $filename | pup 'div#content p text{}' >> all_press_briefing_words
    done
    echo "\n"
    echo "Printing last 10 lines of all_press_briefing_words file ...\n"
    tail -10 all_press_briefing_words
    echo "DONE....Exiting\n"
}

sort_words(){
    if [ -e "$cwd/html/briefings/all_press_briefing_words" ]; then
        cat "$cwd/html/briefings/all_press_briefing_words" | grep -oE '[[:alpha:]]{5,}' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn > "$cwd/html/briefings/sorted_briefing_words"
    else
        echo "The file $cwd/html/briefings/all_press_briefing_words doesn't exist"
    fi
}



if  [ $filescount > 0 ] ; then
    echo "We have $filescount  files in $html_briefings_dir"
    echo "Skipping new downloads\n"
else
    echo "We have $filescount files in $html_briefings_dir"
    echo "Starting new download..."
    download_all_briefings
fi

strip_text_from_html
sort_words