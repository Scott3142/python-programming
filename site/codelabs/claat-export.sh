#!/bin/bash

#This file 'compiles' and exports every codelab in this directory
#We have to manually change the place the codelabs look for their formatting to our custom directory
#This fixes the path executed when user presses 'Done' at the end of the codelab.
claat export *.md
find . -type f -name 'index.html' -exec sed -i 's/https:\/\/storage\.googleapis\.com\/codelab-elements\/codelab-elements\.js/\.\.\/\.\.\/elements\/codelab-elements\/codelab-elements\.js/g' {} \;

claat serve
