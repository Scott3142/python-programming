#!/bin/bash

sed -n 's/.*-master\/exercise-\(.*\)\.git/\1/p' ../python-programming/site/codelabs/part-1.md | cut -d ")" -f1 >> exercise-list.dat
sed -n 's/.*-master\/exercise-\(.*\)\.git/\1/p' ../python-programming/site/codelabs/part-2.md | cut -d ")" -f1 >> exercise-list.dat
sed -n 's/.*-master\/exercise-\(.*\)\.git/\1/p' ../python-programming/site/codelabs/part-3.md | cut -d ")" -f1 >> exercise-list.dat
sed -n 's/.*-master\/exercise-\(.*\)\.git/\1/p' ../python-programming/site/codelabs/part-4.md | cut -d ")" -f1 >> exercise-list.dat
sed -n 's/.*-master\/exercise-\(.*\)\.git/\1/p' ../python-programming/site/codelabs/part-5.md | cut -d ")" -f1 >> exercise-list.dat
sed -n 's/.*-master\/exercise-\(.*\)\.git/\1/p' ../python-programming/site/codelabs/part-6.md | cut -d ")" -f1 >> exercise-list.dat
sed -n 's/.*-master\/exercise-\(.*\)\.git/\1/p' ../python-programming/site/codelabs/part-7.md | cut -d ")" -f1 >> exercise-list.dat
