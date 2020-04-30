#!/bin/bash
input="del_working-exercises.dat"

echo "I'm going to cancel this to make sure you know what you're doing here..."
echo "Please read and understand this file!"
exit 0

while IFS= read -r line
do
    filename="exercise-""$line"
    echo "Checking to see if repo exists on remote..."
    if git clone git@github.com:den01-python-programming/$filename.git
    then
        if hub delete -y den01-python-programming/$filename
        then
            echo "Repo was present on remote so we deleted it."
        else
            echo "Something went wrong! Do the tokens have the correct scope?"
    else
        echo "Repo not present on remote. Nothing to do."
    fi
done < "$input"
