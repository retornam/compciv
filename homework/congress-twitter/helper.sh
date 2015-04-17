#!/bin/sh

download_zip_files() {
    command -v curl >/dev/null 2>&1 || { echo >&2 "I require curlbut it's not installed.  Aborting."; Exit 1; }
	cwd=`pwd`
	cd zips
	curl -O http://stash.compciv.org/congress-twitter/json/jq-congress-twitter-exercise.zip
	cd $cwd
}


unzip_files() {
    if [ -e "./zips/jq-congress-twitter-exercise.zip" ]; then
        echo "File exists.Starting unzip task.."
        unzip ./zips/jq-congress-twitter-exercise.zip -d ../data-hold/
    else
        echo "File zips/jq-congress-twitter-exercise.zip doesn't exist"
        echo " Please re-download file"
        exit 1;
    fi
}

if [ -d "zips" ] && [ -d "data-hold" ]; then
    if [ -e "./zips/jq-congress-twitter-exercise.zip" ]; then
        echo "jq-congress-twitter-exercise.zip already file exists"
    else
        download_zip_file
    fi
else
    echo "Creating new directory zips"
    mkdir zips
    echo "Creating new directory data-hold"
    mkdir data-hold
    download_zip_file
fi

unzip_files


