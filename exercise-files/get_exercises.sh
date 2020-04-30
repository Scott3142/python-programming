#!/bin/bash

input=../site/codelabs/part-

for i in $(seq 1 7); 
do
    filename=$input$i.md
    echo "Getting exercises from" $filename
    sed -n 's/.*-master\/exercise-\(.*\)\.git/\1/p' $filename | cut -d ")" -f1 >> working-exercises.dat
done 
