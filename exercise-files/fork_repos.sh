#!/bin/bash
input="working-exercises.dat"
while IFS= read -r line
do
    reponame="exercise-""$line"
    if [[ -d "$reponame" ]]
    then
        echo "Directory $reponame exists. Forking repo to den01-python-programming."
        cd $reponame
        hub fork --org=den01-python-programming
        cd ..
    else
        echo "Directory $filename doesn't exist locally. Cloning repo."
        git clone git@github.com:btec-diploma-unit4-programming-master/$reponame.git
    fi
done < "$input"
