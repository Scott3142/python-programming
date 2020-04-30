#!/bin/bash

echo "Where would you like to fork the exercises? Please specify just the org name without repo name and without http://"
read orgname

input="working-exercises.dat"
while IFS= read -r line
do
    reponame="exercise-""$line"
    if [[ -d "$reponame" ]]
    then
        echo "Directory $reponame exists. Forking repo to $orgname."
        git submodule update --init $filename
        cd $reponame
        git add --all
        git commit -m 'Nothing to do? There should not be anything here.'
        git branch tmp
        git checkout master
        git merge tmp
        git branch -d tmp
        git push origin master
        hub fork --org=$orgname
        cd ..
    else
        echo "Directory $filename doesn't exist locally. There's somthing wrong here!"
    fi
done < "$input"
