#!/bin/bash

# Author: Abbas Rizvi
# Created: 20/02/2024
# Edited: 20/02/2024


script_dir=$(dirname "$0")
file_list=$script_dir/files.txt

for file in $(cat $file_list); do

    # replace ~ with $HOME
    file_full=$(echo "$file" | sed "s|^~|${HOME}|ig")

    target_dir="$script_dir/"
    
    # remove . if exists
    
    # check if file is in config folder
    if [[ $file == *'config'* ]]; then

        # target dir set to config
        target_dir="$script_dir/config"

        # check if file is not a dir (needed for individual config files sometimes)
        if [ ! -d $file_full ]; then

            # set target dir to path to folder
            target_dir=$(dirname $target_dir$(echo $dirname $file_full | sed "s|^${HOME}/.config||g"))
            mkdir -p $target_dir
        fi



    fi

    # check if file exists and sync
    if [ -e $file_full ]; then

        echo "importing $file"
        rsync -rq $file_full $target_dir


        # check if file is not in readme
         
        if ! grep -q $file $script_dir/README.md; then

            echo "- $file" >> $script_dir/README.md

        fi



    else 
        echo "$file does not exist"
    fi

done

echo -e "\nAll files imported!!"
echo -e "\nadding to readme...\n"

