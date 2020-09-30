#!/bin/bash

echo "Scripts"
find . -type f -exec sed -i 's/"\/styles/"{{baseUrl}}\/styles/g' {} \;
echo "Images"
find . -type f -exec sed -i 's/"\/images/"{{baseUrl}}\/images/g' {} \;
echo "Javascript"
find . -type f -exec sed -i 's/"\/js/"{{baseUrl}}\/js/g' {} \;
echo "Bower components"
find . -type f -exec sed -i 's/"\/bower_components/"{{baseUrl}}\/bower_components/g' {} \;
echo "Elements"
find . -type f -exec sed -i 's/"\/elements/"{{baseUrl}}\/elements/g' {} \;
echo "Scripts"
find . -type f -exec sed -i 's/"\/scripts/"{{baseUrl}}\/scripts/g' {} \;
echo "Views"
find . -type f -exec sed -i 's/"\/views/"{{baseUrl}}\/views/g' {} \;
echo "Finshed"

