#!/bin/bash


# This script downloads the following zip files
# http://stash.compciv.org/ssa_baby_names/namesbystate.zip
# http://stash.compciv.org/ssa_baby_names/names.zip
# to the directory zips and unzips it into a directory named data-hold

download_zip_file() {
    command -v curl >/dev/null 2>&1 || { echo >&2 "I require curlbut it's not installed.  Aborting."; Exit 1; }
    curl -o ./zips/namesbystate.zip http://stash.compciv.org/ssa_baby_names/namesbystate.zip
    curl -o ./zips/names.zip http://stash.compciv.org/ssa_baby_names/names.zip
    echo  "Zip file download to zips folder completed."

}

unzip_files() {
    if [ -e "./zips/namesbystate.zip" ] && [ -e "./zips/names.zip" ]; then
        echo "File exists.Starting unzip task.."
        unzip ./zips/namesbystate.zip -d ./data-hold
        unzip ./zips/names.zip -d ./data-hold
        Echo "unzipped files to ./data-hold"
    else
        echo "File zips/namebystate.zip or zips/names.zip doesn't exist"
        echo " Please re-download file"
        exit 1;
    fi
}

if [ -d "zips" ] && [ -d "data-hold" ]; then
    if [ -e "./zips/namesbystate.zip" ]; then
        echo "namesbystate.zip already file exists"
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


