#!/bin/bash
input="working-exercises.dat"
while IFS= read -r line
do
    filename="exercise-""$line"
    if [[ -d "$filename" ]]
    then
        echo "Directory $filename exists. Entering directory."
        cd $filename
        git add --all
        git commit -m 'Updates exercise'
        git branch tmp
        git checkout master
        git merge tmp
        git branch -d tmp
        git push origin master
        cd ..
    else
        echo "Directory $filename doesn't exist locally. There's something wrong here!"
    fi
done < "$input"
