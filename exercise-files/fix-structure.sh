#!/bin/bash
input="exercise-list-to-fix.dat"
while IFS= read -r line
do
    filename="exercise-""$line"
    if [[ -d "$filename" ]]
    then
        echo "Directory $filename exists. Fixing structure!"
        cd $filename
        rm *.py
        mv README.md README.md.bak
        cp -r ../base-exercise-files/. .
        mv README.md.bak README.md
        git add --all
        git commit -m 'Fixes directory structure'
        git push origin master
        cd ..
    else
        echo "Directory $filename doesn't exist locally. We can't fix it if it isn't there!"
    fi
done < "$input"
