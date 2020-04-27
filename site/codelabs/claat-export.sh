#!/bin/bash

# This file 'compiles' and exports every codelab in this directory
# We have to manually change the place the codelabs look for their formatting to our custom directory
# This fixes the path executed when user presses 'Done' at the end of the codelab.

claat export faqs.md
claat export part-1.md
claat export part-2.md
claat export part-3.md
claat export part-4.md
claat export part-5.md
claat export part-6.md
claat export part-7.md
claat export project-list.md

# Options -o
# `local` Serve only codelabs locally
# `landing` Serve landing pages locally
# `deploy` Deploy full landing page and codelabs

while getopts ":o:" opt; do
  case $opt in
    o)
      if [ "$OPTARG" = "local" ]; then
        echo "Serving codelabs locally." >&2
        claat serve
      elif [ "$OPTARG" = "landing" ]; then
        echo "Serving landing page locally." >&2
	echo "Be aware - this is okay, but it loads the codelabs from scott3142.uk" >&2
	find . -type f -name 'index.html' -exec sed -i 's/https:\/\/storage\.googleapis\.com\/codelab-elements\/codelab-elements\.js/\.\.\/\.\.\/elements\/codelab-elements\/codelab-elements\.js/g' {} \;
        cd ../
        gulp serve
      elif [ "$OPTARG" = "deploy" ]; then
        echo "Deploying landing page and codelabs." >&2
        find . -type f -name 'index.html' -exec sed -i 's/https:\/\/storage\.googleapis\.com\/codelab-elements\/codelab-elements\.js/\.\.\/\.\.\/elements\/codelab-elements\/codelab-elements\.js/g' {} \;
	cd ../
        gulp deploy:prod
      fi
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done
