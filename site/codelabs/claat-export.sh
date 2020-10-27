#!/bin/bash

# This file 'compiles' and exports every codelab in this directory
# We have to manually change the place the codelabs look for their formatting to our custom directory
# This fixes the path executed when user presses 'Done' at the end of the codelab.

claat export faqs.md
claat export local-dev.md
claat export getting-started.md
claat export part-1.md
claat export part-2.md
claat export part-3.md
claat export part-4.md
claat export part-5.md
claat export part-6.md
claat export part-7.md
claat export project-list.md
claat export guess-the-number.md

# Options -o
# `local` Serve only codelabs locally
# `landing` Serve landing pages locally
# `deploy` Deploy full landing page and codelabs

replaceVideo="<center><iframe width=\"560\" height=\"315\" src=\"https:\/\/www.youtube.com\/embed\/GOYVuaEvBCA\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen><\/iframe><\/center>"
replaceReplitVideo="<center><iframe width=\"560\" height=\"315\" src=\"https:\/\/www.youtube.com\/embed\/47gvkrD9oxY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen><\/iframe><\/center>"
replacePerception="<iframe width=\"560\" height=\"315\" src=\"https:\/\/www.youtube.com\/embed\/vJG698U2Mvo\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen><\/iframe>"
replaceSummaryZero="<iframe src=\"https:\/\/docs.google.com\/forms\/d\/e\/1FAIpQLSdeOZySX5e-0odSsE2W8kNOp_b7OwbqjAcC4_aAJzWCUgVrbg\/viewform?embedded=true\" width=\"560\" height=\"2650\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading…<\/iframe>"
replaceSummaryOne="<iframe src=\"https:\/\/docs.google.com\/forms\/d\/e\/1FAIpQLSe_xp2JKUSJg1bePtHrADnuREN7n-mLK867P3LiPkoQCa1lGQ\/viewform?embedded=true\" width=\"560\" height=\"1216\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading…<\/iframe>"
replaceSummaryTwo="<iframe src=\"https:\/\/docs.google.com\/forms\/d\/e\/1FAIpQLSe7zRIt9josURXvpg-0vClO4mDLshGzvEg6pzhiPQaKyLfemg\/viewform?embedded=true\" width=\"560\" height=\"2080\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading…<\/iframe>"
replaceSummaryThree="<iframe src=\"https:\/\/docs.google.com\/forms\/d\/e\/1FAIpQLSe7DA-Oubzxiv-HMPdB40lrE25xe5FcFnmaxKRiagOwdO7mEg\/viewform?embedded=true\" width=\"560\" height=\"1390\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading…<\/iframe>"
replaceSummaryFour="<iframe src=\"https:\/\/docs.google.com\/forms\/d\/e\/1FAIpQLSfRRM6PgNppRVObvy4bDi3jDFFdQyCBfUiIDlRNvCs2RNSUIA\/viewform?embedded=true\" width=\"560\" height=\"2182\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading…<\/iframe>"
replaceSummaryFive="<iframe src=\"https:\/\/docs.google.com\/forms\/d\/e\/1FAIpQLSd6hYWMQVD7qYoAdx9oPY3uOCDmHDNz2kkGt7O-PfnImDGl5w\/viewform?embedded=true\" width=\"560\" height=\"1414\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading…<\/iframe>"
replaceSummarySix="<iframe src=\"https:\/\/docs.google.com\/forms\/d\/e\/1FAIpQLSd095S6bRAwCzm9aLjK64QmU2MLSZjOyosvCXO-pXGpOMDloQ\/viewform?embedded=true\" width=\"560\" height=\"1786\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading…<\/iframe>"
replaceSummarySeven="<iframe src=\"https:\/\/docs.google.com\/forms\/d\/e\/1FAIpQLScgSjpwaXRRYjzDBJsrNNmsGQyAqaGqrp8DhwdcrE1uFmpv3g\/viewform?embedded=true\" width=\"560\" height=\"1636\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading…<\/iframe>"

while getopts ":o:" opt; do
  case $opt in
    o)
      if [ "$OPTARG" = "local" ]; then
        echo "Serving codelabs locally." >&2
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-video<\/p>/$replaceVideo/g" {} \;
     	find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-replit-video<\/p>/$replaceReplitVideo/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-perception-video<\/p>/$replacePerception/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-0<\/p>/$replaceSummaryZero/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-1<\/p>/$replaceSummaryOne/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-2<\/p>/$replaceSummaryTwo/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-3<\/p>/$replaceSummaryThree/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-4<\/p>/$replaceSummaryFour/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-5<\/p>/$replaceSummaryFive/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-6<\/p>/$replaceSummarySix/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-7<\/p>/$replaceSummarySeven/g" {} \;
        claat serve
      elif [ "$OPTARG" = "landing" ]; then
        echo "Serving landing page locally." >&2
        echo "Be aware - this is okay, but it loads the codelabs from scott3142.uk" >&2
        find . -type f -name 'index.html' -exec sed -i 's/https:\/\/storage\.googleapis\.com\/codelab-elements\/codelab-elements\.js/\.\.\/\.\.\/elements\/codelab-elements\/codelab-elements\.js/g' {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-video<\/p>/$replaceVideo/g" {} \;
    	find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-replit-video<\/p>/$replaceReplitVideo/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-perception-video<\/p>/$replacePerception/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-0<\/p>/$replaceSummaryZero/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-1<\/p>/$replaceSummaryOne/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-2<\/p>/$replaceSummaryTwo/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-3<\/p>/$replaceSummaryThree/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-4<\/p>/$replaceSummaryFour/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-5<\/p>/$replaceSummaryFive/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-6<\/p>/$replaceSummarySix/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-7<\/p>/$replaceSummarySeven/g" {} \;
        cd ../
        gulp serve
      elif [ "$OPTARG" = "deploy" ]; then
        echo "Deploying landing page and codelabs." >&2
        find . -type f -name 'index.html' -exec sed -i 's/https:\/\/storage\.googleapis\.com\/codelab-elements\/codelab-elements\.js/\.\.\/\.\.\/elements\/codelab-elements\/codelab-elements\.js/g' {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-video<\/p>/$replaceVideo/g" {} \;
	find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-replit-video<\/p>/$replaceReplitVideo/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-perception-video<\/p>/$replacePerception/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-0<\/p>/$replaceSummaryZero/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-1<\/p>/$replaceSummaryOne/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-2<\/p>/$replaceSummaryTwo/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-3<\/p>/$replaceSummaryThree/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-4<\/p>/$replaceSummaryFour/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-5<\/p>/$replaceSummaryFive/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-6<\/p>/$replaceSummarySix/g" {} \;
        find . -type f -name 'index.html' -exec sed -i "s/<p>replace-with-summary-form-7<\/p>/$replaceSummarySeven/g" {} \;
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
