#!/bin/bash

# Author: Abbas Rizvi
# Created: 20/02/2024
# Edited: 20/02/2024


script_dir=$(dirname "$0")
file_list=$script_dir/files.txt

for file in $(cat $file_list); do

    # replace ~ with $HOME
    file_full=$(echo "$file" | sed "s|^~|${HOME}|ig")

    target_dir="$(pwd)/"
    
    # remove . if exists
    
    # check if file is in config folder
    if [[ $file == *'config'* ]]; then
        target_dir="$(pwd)/config"
    fi

    # check if file exists and sync
    if [ -e $file_full ]; then

        echo "importing $file"
        rsync -rq $file_full $target_dir


        # check if file is not in readme
        if [ -z $(grep $file $script_dir/README.md) ]; then

            echo "- $file" >> $script_dir/README.md

        fi



    else 
        echo "$file does not exist"
    fi

done

echo -e "\nAll files imported!!"
echo -e "\nadding to readme...\n"

