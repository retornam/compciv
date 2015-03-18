#!/bin/sh

# This script checks the html folder under the current working directory which # contains html files from the White House press briefings page
# [https://www.whitehouse.gov/briefing-room/press-briefings]. Using the pup
# program we select elements that match the selector h3 a attr{href}


check_if_pup_is_installed() {
    command -v pup >/dev/null 2>&1  || {
        echo >&2 "pup is required but not installed.
        Aborting";
        exit 1;
    }
}

match_html_selectors() {
    if [ -d "html" ]; then
        cat html/*.html | pup 'h3 a attr{href}' > ./html/all_briefing_links
        # The links in the *.html files from the whitehouse are relative not
        # absolute so we need to append the following to the beginning of each line
        sed 's/^/https:\/\/www.whitehouse.gov/' ./html/all_briefing_links > ./html/tmp
        mv ./html/tmp ./html/all_briefing_links
        echo "Showing last 10 items of ./html/all_briefing_links..."
        tail -10 ./html/all_briefing_links
        echo "...DONE.\nEXITING..\n"
    else
        echo "The html folder doesn't exist.Aborting"
        exit 1;
    fi
}


check_if_pup_is_installed
match_html_selectors