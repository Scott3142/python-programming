#!/bin/bash

ONEEND=33
TWOEND=31
THREEEND=26
FOUREND=30
FIVEEND=17
SIXEND=14
SEVENEND=9
TOTAL=153
switch=1
echo "Exercise 1.1" > exercise-list-for-classroom.txt
echo "den01-python-programming/exercise-1-1-ada-lovelace" >> exercise-list-for-classroom.txt
declare -i j=2
for i in $(seq 2 $TOTAL); do
    echo "Exercise $switch.$j" >> exercise-list-for-classroom.txt;
    exercise=$(sed "${i}q;d" exercise-list.dat)
    echo "den01-python-programming/exercise-$exercise" >> exercise-list-for-classroom.txt;
    j=$j+1
    if [ "$j" == "$ONEEND" ] && [ "$switch" == "1" ]; then
        switch=2
        j=1
    fi
    if [ "$j" ==  "$TWOEND" ] && [ "$switch" == "2" ]; then
        switch=3
        j=1
    fi
    if [ "$j" ==  "$THREEEND" ] && [ "$switch" == "3" ]; then
        switch=4
        j=1
    fi
    if [ "$j" ==  "$FOUREND" ] && [ "$switch" == "4" ]; then
        switch=5
        j=1
    fi
    if [ "$j" ==  "$FIVEEND" ] && [ "$switch" == "5" ]; then
        switch=6
        j=1
    fi
    if [ "$j" ==  "$SIXEND" ] && [ "$switch" == "6" ]; then
        switch=7
        j=1
    fi
done
