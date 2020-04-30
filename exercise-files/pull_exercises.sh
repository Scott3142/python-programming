#!/bin/bash
input="working-exercises.dat"
while IFS= read -r line
do
    filename="exercise-""$line"
    if [[ -d "$filename" ]]
    then
        echo "Directory $filename exists. Pulling repo."
        git submodule update --init $filename
    else
        echo "Directory $filename doesn't exist locally. There's something wrong here!"
    fi
done < "$input"
