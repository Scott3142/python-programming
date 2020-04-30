#!/bin/bash
input="exercise-list.dat"
while IFS= read -r line
do
    filename="exercise-""$line"
    if [[ -d "$filename" ]]
    then
        echo "Directory $filename exists. Pulling git repo!"
        cd $filename
        #git remote add origin git@github.com:den01-python-programming/$filename
        #git pull origin master
        cd ..
    else
        echo "Directory $filename doesn't exist locally. Checking to see if repo exists on remote..."
        if git submodule add git@github.com:den01-python-programming/$filename.git
        then
            echo "Repo was present on remote so we added it as a submodule."
        else
            echo "Something went wrong. Have you already added this as a submodule?"
            #echo "Repo not present on remote. Creating and pushing initial commit."
            #mkdir $filename
            #cp -r base-exercise-files/. $filename
            #cd $filename
            #echo "# Exercise ""$line" >> README.md
            #git init
            #git add --all
            #git commit -m 'Initial commit'
            #hub create den01-python-programming/$filename
            #git push origin master
            #cd ..
        fi
    fi
done < "$input"
