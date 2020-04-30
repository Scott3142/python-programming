#!/bin/bash
input="working-exercises.dat"
while IFS= read -r line
do
    reponame="exercise-""$line"
    if [[ -d "$reponame" ]]
    then
        echo "Directory $reponame exists. Forking repo to $orgname."
        cd $reponame
        hub fork --org=$orgname
        cd ..
    else
        echo "Directory $filename doesn't exist locally. Cloning repo."
        git clone git@github.com:$orgname/$reponame.git
    fi
done < "$input"
