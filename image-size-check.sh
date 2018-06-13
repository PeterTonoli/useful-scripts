#!/bin/bash
# List all images in the current working directory that exceed a specified height/width 
# Originally from a post by HalosGhost at https://unix.stackexchange.com/a/157594
# Licensed Creative Commons Attribution-ShareAlike 3.0 Unported https://creativecommons.org/licenses/by-sa/3.0/
files=*
minimumWidth=1280
minimumHeight=1024

for f in $files
do
    imageWidth=$(identify -format "%w" "$f")
    imageHeight=$(identify -format "%h" "$f")

    if [ "$imageWidth" -gt "$minimumWidth" ] || [ "$imageHeight" -gt "$minimumHeight" ]; then
        echo $f `identify -format "%wx%h" "$f"`
    fi
done
