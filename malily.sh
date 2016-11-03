#!/bin/bash

echo "What's your first name: "
read name

echo "Where did you grow up: "
read hometown

echo "How many siblings do you have: "
read siblings

echo "How old are you: "
read age

echo "What's your favorite movie: "
read movie

#generate random strings
generator=$(cat /dev/random | tr -dc "[:alpha:]" | head -c 8)
echo "Randomly generated string: $generator"

datestamp=$(TZ=":US/Eastern" date +%m_%d_%Y)

echo "Today's date: $datestamp"

echo "$name,$hometown,$siblings,$age,$movie,$generator,$datestamp" >> final.csv

###### Bonus: M ######
pretty_print() {
IFS=","
    while read name hometown siblings age movie generator datestamp
        do
            echo -e "\n\033[1m$name \e[0m\
            \n*************\
            \nHometown: $hometown\
            \nNumber of Siblings: $siblings\
            \nAge: $age\
            \nFavorite Movie: $movie\
            \nIdentifier: $generator\
            \nDate: $datestamp\n"
        done < final.csv
}

echo "Would you like to print this CSV to the screen? Y/N"
read print2screen

if [ $print2screen == "Y" ]; then
pretty_print
else
echo "Okay, bye."
fi
###### ######