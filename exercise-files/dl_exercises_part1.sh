#!/bin/bash
run_install()
{
    ## Prompt the user
    read -p "To run this script you will need the 'expect' library. Would you like to install it? [y/n]: " answer
    ## Set the default value if no answer was given
    answer=${answer:y}
    ## If the answer matches y or Y, install
    [[ $answer =~ [y] ]] && sudo apt -y install expect
    if [[ $answer != y ]]; then
        echo "You cannot run this script without installing this package. Please enter y."
        exit 0 #
    fi
}

dpkg -s "expect" >/dev/null 2>&1 || run_install

while true; do
    read -p "Are you a student at Bridgend College and enrolled in a Github Classroom? (y/n) " enrolled

    if [[ $enrolled != 'y' && $enrolled != 'n' ]]; then
        echo "Please enter y/n."
        continue
    fi
    break
done

while true; do
    read -p "Which exercises would you like to download? (1/2/3/4/5/6/7) " exercise_number
    if [[ $exercise_number != '1' && $exercise_number != '2' && $exercise_number != '3' && $exercise_number != '4' && $exercise_number != '5' && $exercise_number != '6' && $exercise_number != '7' ]]; then
        echo "Please enter either 1/2/3/4/5/6/7."
        continue
    fi
    break
done

if [ $enrolled == 'y' ]; then
    read -p "Username for 'https://github.com': " username
    read -s -p "Password for 'https://$username@github.com': " pass
    username_stripped=$(echo $username | sed -e 's/ /-/g' -e 's/[A-Z]/\L&/g')
fi

#input="exercise-list.dat"
input="working-exercises.dat"
while IFS= read -r line
do
    search="exercise-$exercise_number-"
    reponame="exercise-""$line"
    if [[ $reponame == *"$search"* ]]; then
        if [ $enrolled == 'y' ]; then
            if [[ -d "$reponame-$username_stripped" ]]; then
                echo ""
                echo "Repo directory exists locally. If you want to pull instead, you'll have to do this manually."
                echo ""
            else
                echo "Cloning $reponame from your Github Classroom repo."
                if git clone git@github.com:den01-hnc-2020/$reponame-$username_stripped.git ; then
                    echo "SSH keys detected in Github account. Cloned using ssh."
                    echo ""
                else
                    echo "Cloning using https/"
                    expect -c " \
                        spawn git clone https://github.com/den01-hnc-2020/$reponame-$username_stripped.git; \
                        expect \"Username for 'https://github.com': \"; \
                        send -- \"$username\r\"; \
                        expect \"Password for 'https://$username@github.com': \"; \
                        send -- \"$pass\r\"; \
                        expect eof"
                    echo "SSH keys not detected in Github account. Cloned using https."
                    echo ""
                fi
            fi
        elif [ $enrolled == 'n' ]; then
            if [[ -d "$reponame" ]]; then
                echo ""
                echo "Repo directory exists locally. If you want to pull instead, you'll have to do this manually."
                echo ""
            else
                echo "Cloning $reponame from the main Python Programming repo."
                git clone https://github.com/den01-python-programming/$reponame.git
            fi
        fi
    fi
done < "$input"
