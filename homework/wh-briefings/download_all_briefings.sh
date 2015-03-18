#!/bin/sh


# This script selects all links found in the file html/all_briefing_links a
# and downloads them to the folder html/briefings for later analysis. The
# script assumes that the html folder is in the current working directory

cwd=$(pwd)
download_all_briefings(){
    if [ -e './html/all_briefing_links'] ; then
        while read p; do
        cd ./html/briefings
        curl  -O $p
    done <./html/all_briefing_links
    else
        echo "The file all_briefing_links does not exist. Exiting.."
        exit 1;
    fi
}

strip_text_from_html() {
    cd  ./html/briefings
    for  filename in $(ls )
    do
        cat $filename | pup 'div#content p text{}' >> all_press_briefing_words
    done
    tail -10 all_press_briefing_words
    cd $cwd
}


strip_text_from_html