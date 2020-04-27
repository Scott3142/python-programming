#!/bin/bash
input="in-progress.dat"
while IFS= read -r line
do
    filename="exercise-""$line"
    if [[ -d "$filename" ]]
    then
        echo "Directory $filename exists. Entering directory."
        cd $filename
        sed -i 's/<sample-output>/```plaintext/g' README.md
        sed -i 's/<\/sample-output>/```/g' README.md
        cd ..
    else
        echo "Directory $filename doesn't exist locally. There's something wrong here!"
    fi
done < "$input"
